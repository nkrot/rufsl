#!/usr/bin/ruby

load 'data'

puts @temps.inspect

puts @temps.find {|el| el > 0}
