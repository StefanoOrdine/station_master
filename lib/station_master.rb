require 'active_support/core_ext'
require 'multi_json'
require 'net/http'

require 'station_master/ask'
require 'station_master/schedule'
require 'station_master/station'
require 'station_master/version'

module StationMaster
  STATION_MASTER_BASE_URL = 'http://www.viaggiatreno.it/viaggiatrenonew/resteasy/viaggiatreno/'
  TIME_ZONE = 'Rome'
end