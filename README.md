# TZWhere

Lookup a time zone by latitude/longitude using the nearest neighbor method.

## Caveats

The nearest neighbor method can sometimes be inacurrate, if compared to a point
lookup in a polygon. In most cases, the risk of inaccuracy is acceptable.

## Installation

Add this line to your application's Gemfile:

    gem 'tzwhere'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tzwhere

## Usage

    TZWhere.lookup(41.7599, -87.2079)

    # => "America/Chicago"

## Running Tests

Ensure the test dependencies are installed:

    $ bundle

Run the test suite:

    $ rake spec

## DataSource

Uses the data available at http://download.geonames.org/export/dump/

The current version extract longitude, latitude and timezone from the
`cities5000` dataset. This set includes all citites with a population > 5000
(~47k entries).

Can be changes to either the `cities1000`(144k entires) or
`cities15000`(23k entries) dataset by changing the `update_points_data` rake
task and executing it. One will be faster the other one more accurate.

## Contributing

See CONTRIBUTING.md

## Copyright

Copyright (c) 2014 Adam Daniels (<adam@mediadrive.ca>).

Geocode data (points.dat) by [Geonames.org](http://www.geonames.org) is licensed under [CC BY 3.0](http://creativecommons.org/licenses/by/3.0/)

See LICENSE for details.
