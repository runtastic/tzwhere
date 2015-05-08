require "bundler/gem_tasks"
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)


desc "update points.dat"
task :update_points_dat do
  data = `curl http://download.geonames.org/export/dump/cities5000.zip | gunzip -`
  file = File.open(File.join(File.dirname(__FILE__),'lib','tzwhere','points.dat'),'w')
  data.each_line do |line|
    line = line.split("\t")
    latitude = line[4]
    longitude = line[5]
    time_zone = line[17]
    file.write("#{latitude} #{longitude} #{time_zone}\n")
  end
  file.close
end
