module StationMaster
  module Schedule
    class Departure
      attr_reader :train_code, :train_type, :destination, :platform, :time, :delay

      def initialize(hash)
        @train_code = hash[:numeroTreno]
        @train_type = hash[:categoria]
        @destination = hash[:destinazione]
        @platform = (hash[:binarioProgrammatoPartenzaDescrizione].to_s || '0').strip
        @time = Time.at((hash[:orarioPartenza] || 0) / 1000).in_time_zone(TIME_ZONE)
        @delay = hash[:ritardo]
      end

      def to_hash
        {
          train_code: train_code,
          train_type: train_type,
          destination: destination,
          platform: platform,
          time: time.strftime('%H:%M'),
          delay: delay
        }
      end
    end
  end
end