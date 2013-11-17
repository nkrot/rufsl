#!/usr/bin/env ruby

load 'data'

lengths = @numbers.map {|item|
    item.length
}

#puts lengths.inspect

puts "min: " + lengths.min.to_s
puts "max: " + lengths.max.to_s







