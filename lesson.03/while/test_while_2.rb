#!/usr/bin/ruby

i = j = 0
while i < 5 && j < 5
  puts "i=#{i}, j=#{j}"
  i += 1
  j += i
end
puts ""
