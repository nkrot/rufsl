#!/usr/bin/ruby

load 'data'
#=>@eng_numerals

puts "Original data:"
puts @eng_numerals.inspect

puts "Performing comparison"

count = 0
sorted = @eng_numerals.sort do |a, b|
  count += 1
  puts "a=#{a.inspect}"
  puts "b=#{b.inspect}"
  res = a <=> b
  puts "result of comparison: #{res}\n\n"
  res
end

puts "Number of comparisons performed: #{count}"

puts "Sorted data:"
puts sorted.inspect
