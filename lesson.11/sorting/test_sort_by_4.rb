#!/usr/bin/env ruby

load 'data'

anti_fruits = @fruits.sort_by {|item|
    item.reverse
}

puts @fruits.inspect
puts anti_fruits.inspect

