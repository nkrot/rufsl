#!/usr/bin/env ruby

load 'data'

puts "Initial state"
puts @months.inspect

@months.each_with_index {|m, i|
  @months[i] = nil  if m =~ /r/
}

puts "Some items reset to nil"
puts @months.inspect
puts @months.length

puts "Compacted (nil removed)"
puts @months.compact.inspect

puts @months.length
