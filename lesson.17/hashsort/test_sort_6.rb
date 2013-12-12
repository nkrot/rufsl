#!/usr/bin/ruby

load 'data'

sorted = @numerals.sort_by {|item|
#  puts item.inspect
  item[1][0].reverse
}

puts "Sorted:"
puts sorted.inspect

sorted = @numerals.sort_by {|key, val|
  val.first.reverse
}

puts "Sorted:"
puts sorted.inspect
