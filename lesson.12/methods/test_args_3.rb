#!/usr/bin/env ruby

def numbers_are_passed_by_copy(a)
  puts "inside method  : #{a.object_id}"
  a += 10
  puts "inside method  : #{a.object_id}\n\n"
  return a
end

i = 10

puts "Before method call:"
puts "'#{i}' : #{i.object_id}\n\n"

puts "Returned from method: #{numbers_are_passed_by_copy(i)}\n\n"

puts "After method call"
puts "'#{i}' : #{i.object_id}"
