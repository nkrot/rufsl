#!/usr/bin/ruby

a = 2
if a < 5
  b = a ** 2
  puts "(inside if) a=#{a}, b=#{b}"
end
puts ""


a = 2
while a < 5 do
  b = a ** 2
  puts "(inside while) a=#{a}, b=#{b}"
  a += 1
end

