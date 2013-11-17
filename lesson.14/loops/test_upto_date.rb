#!/usr/bin/ruby

require 'date'

d1 = Date.new(2012, 2, 23)
d2 = Date.new(2012, 3, 8)

c = 0
d1.upto(d2) do |d|
  puts d.to_s
  c += 1
end

puts "Days: #{c}"

######################################################################

d1 = Date.new(2013, 2, 23)
d2 = Date.new(2013, 3, 8)

c = 0
d1.upto(d2) do |d|
  puts d.to_s
  c += 1
end

puts "Days: #{c}"


