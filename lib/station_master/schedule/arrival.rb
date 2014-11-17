module StationMaster
  module Schedule
    class Arrival
      attr_reader :train_code, :train_type, :origin, :platform, :time, :delay

      def initialize(hash)
        @train_code = hash[:numeroTreno]
        @train_type = hash[:categoria]
        @origin = hash[:origine]
        @platform = (hash[:binarioProgrammatoArrivoDescrizione].to_s || '0').strip
        @time = Time.at((hash[:orarioArrivo] || 0) / 1000)
        @delay = hash[:ritardo]
      end

      def to_hash
        {
          train_code: train_code,
          train_type: train_type,
          origin: origin,
          platform: platform,
          time: time.strftime('%H:%M'),
          delay: delay
        }
      end
    end
  end
end