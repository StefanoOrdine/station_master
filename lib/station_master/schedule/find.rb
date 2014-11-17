module StationMaster
  module Schedule
    module Find
      include Ask

      def find_station_arrivals(station_code, time = Time.now)
        MultiJson::load(remote_call(:arrivals, { station_code: station_code, time: format_time(time) }), symbolize_keys: true).inject([]) do |array, arrival_hash|
          array << Arrival.new(arrival_hash)
        end
      end

      def find_station_departures(station_code, time = Time.now)
        MultiJson::load(remote_call(:departures, { station_code: station_code, time: format_time(time) }), symbolize_keys: true).inject([]) do |array, arrival_hash|
          array << Departure.new(arrival_hash)
        end
      end

      protected
        def remote_call(resource, options = {})
          request_url = case resource
            when :arrivals then
              STATION_MASTER_BASE_URL + "arrivi/#{options[:station_code]}/#{options[:time]}"
            when :departures then
              STATION_MASTER_BASE_URL + "partenze/#{options[:station_code]}/#{options[:time]}"
            else
              nil
          end

          ask!(request_url) if request_url
        end

        def format_time(time)
          time.strftime('%a %b %d %Y %H:%M:%S GMT%z (CET)')
        end
    end
  end
end