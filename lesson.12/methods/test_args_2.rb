#!/usr/bin/env ruby

def transform(a)
  puts "Inside method  : #{a.object_id}"
  a.upcase!.delete!('A')
end

str = "Antananarivo"

puts "Before method call:"
puts "'#{str}' : #{str.object_id}\n\n"

puts "Method returned: '#{transform(str)}'\n\n"

puts "After method call"
puts "'#{str}' : #{str.object_id}"

