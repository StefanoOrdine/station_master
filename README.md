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

To find a specific station based on city name:

    StationMaster::Station.find_by_city('Torino')

It returns a list of possible stations that match the parameter string.

To find real-time departures information:

    StationMaster::Schedule.find_station_departures('S06421')

It retrieve the current station departures status.

To find real-time arrivals information:

    StationMaster::Schedule.find_station_arrivals('S06421')

It retrieve the current station arrivals status.

To get a list of all stations available:

    StationMaster::Station.all


It returns the list of all stations with geo-coordinates information (may
require minutes!).

## Changelog

### 0.1.3

- Fix definitely localization.

### 0.1.2

- Update ruby version

### 0.1.1

- Fix time zone for api requests, update active_support gem.

### 0.1.0

- Add time zone.

### 0.0.12

- OMG these dependencies!

### 0.0.11

- Fix gem dependencies.

### 0.0.10

- Move gem dependencies in gemspec.

### 0.0.9

- Refactor code, better code organization.

### 0.0.8

- Bug fix arrivals and departures initializers.

### 0.0.7

- Add delay information to schedule arrivals and departures.

### 0.0.6

- Add arrivals schedule to station_master.

### 0.0.5

- Add departures schedule to station_master.

### 0.0.4

- Fix dependencies.

### 0.0.3

- Retrieve station codes by providing city name.

### 0.0.2

- Setup test environment.
- Mocking api in test environment.

### 0.0.1

- Retrieve the list of all stations.
- gem bundlerized.

## Contributing

1. Fork it ( http://github.com/<my-github-username>/station_master/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

The MIT License (MIT)

Copyright (c) 2014 Stefano Ordine

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
