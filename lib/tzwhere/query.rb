require 'geokdtree'
require 'singleton'
require 'active_support/values/time_zone'

module TZWhere
  class Query
    include Singleton

    def initialize
      @timezones = []
      @kdtree = Geokdtree::Tree.new(2)

      load_points
    end

    def lookup(latitude, longitude)
      result = kdtree.nearest([latitude, longitude])
      timezones.at(result.data)
    end

    private

    attr_accessor :timezones, :kdtree

    def load_points
      IO.foreach("#{File.dirname(__FILE__)}/points.dat") do |line|
        lat, long, timezone = line.split

        @timezones.push(timezone) unless @timezones.include?(timezone)
        kdtree.insert([lat.to_f, long.to_f], @timezones.index(timezone))
      end
      @timezones.map!{|e| ActiveSupport::TimeZone.new(e) }
    end
  end
end
