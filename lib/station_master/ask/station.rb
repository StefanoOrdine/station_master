module StationMaster
  module Ask
    class Station
      class << self
        def all
          stations_array = []
          index = 0
          begin
            response = MultiJson::load(remote_call(:stations, page: index), symbolize_keys: true).inject([]) do |array, station|
              station_code = station[:codiceStazione]
              latitude = station[:lat]
              longitude = station[:lon]
              region_id = find_region_id_by_code(station[:codiceStazione])
              station_details = find_details(station_code, region_id)
              location = (station_details[:localita][:nomeLungo] || '').split.map(&:capitalize).join(' ') if station_details

              array << {
                station_code: station_code,
                latitude: latitude,
                longitude: longitude,
                region_id: region_id,
                location: location
              }
            end
            stations_array += response
            index += 1
          end while response.any?

          stations_array
        end

        def find_by_city(city)
          remote_call(:search, { city: city }).split(/\n/).map(&:strip).inject({}) { |hash, entry| hash.merge!({ entry.split('|').first.to_sym => entry.split('|').last }) }
        end

        def find_region_id_by_code(station_code)
          remote_call(:region_id, station_code: station_code)
        end

        def find_details(station_code, region_id)
          MultiJson::load(remote_call(:station_details, station_code: station_code, region_id: region_id), symbolize_keys: true)
        end

        private
          def remote_call(resource, options = {})
            request_url = case resource
              when :stations then
                STATION_MASTER_BASE_URL + "elencoStazioni/#{options[:page] || 0}"
              when :region_id then
                STATION_MASTER_BASE_URL + "regione/#{options[:station_code] || 0}"
              when :station_details
                STATION_MASTER_BASE_URL + "dettaglioStazione/#{options[:station_code] || 0}/#{options[:region_id] || 0}"
              when :search
                STATION_MASTER_BASE_URL + "autocompletaStazione/#{options[:city] || ''}"
              else
                ''
            end

            remote_call!(request_url)
          end

          def remote_call!(request_url)
            url = URI.parse(request_url)
            http = Net::HTTP.new(url.host, url.port)
            http.read_timeout = 2

            http.get(url).body
          end
      end
    end
  end
end