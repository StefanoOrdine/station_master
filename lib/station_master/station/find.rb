module StationMaster
  class Station
    module Find
      include Ask

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

            array << Station.new(station_code, latitude, longitude, region_id, location)
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

      protected
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
              nil
          end

          ask!(request_url) if request_url
        end
    end
  end
end