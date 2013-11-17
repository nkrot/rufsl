#!/usr/bin/env ruby

msg = "Enter an integer number"
puts msg

while num = gets
  num = num.chomp.to_i

  # test the number
  if num > 0
    res = "is a positive number"
  elsif num < 0
    res = "is a negative number"
  else
    res = "is zero"
  end
  puts "#{num} " + res

  puts msg
end
