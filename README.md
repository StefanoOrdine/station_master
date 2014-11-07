# StationMaster

This gem provide an interface to an api from www.viaggiatreno.it public site.
This project exploits the api that the site uses to build up the front-end side,
to retrieve real-time information on italian rail system and to provide an more
convinient interface to that information.

## Installation

Add this line to your application's Gemfile:

  gem 'station_master'

And then execute:

  $ bundle install

Or install it yourself as:

    $ gem install station_master

## Usage

  require 'station_master'

To get a list of all stations available:


  StationMaster::Ask::Station.all


It returns the list of all stations with geo-coordinates information (may
require minutes!).

To find a specific station based on city name:

  StationMaster::Ask::Station.find_by_city('Torino')

It returns a list of possible stations that match the parameter string.

## Contributing

1. Fork it ( http://github.com/<my-github-username>/station_master/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
