require 'station_master/station/find'

module StationMaster
  class Station
    extend Find

    attr_reader :station_code, :latitude, :longitude, :region_id, :location

    def initialize(station_code, latitude, longitude, region_id, location)
      @station_code = station_code
      @latitude = latitude
      @longitude = longitude
      @region_id = region_id
      @location = location
    end

    def to_hash
      {
        station_code: station_code,
        latitude: latitude,
        longitude: longitude,
        region_id: region_id,
        location: location
      }
    end
  end
end