#!/usr/bin/env ruby

c_in = c_up = c_down = 0

while line = gets
  c_in += 1
  case line
  when /^[[:upper:]]/ then c_up += 1
  when /^[[:lower:]]/ then c_down += 1
  end
end

puts "Number of lines: #{c_in}"
puts "Number of Words/words: #{c_up}/#{c_down}"
