#!/usr/bin/env ruby

# # #
# The goal is to classify inputted numbers into
#  digits:   0-9
#  numbers:  any other, e.g. -1, 10
# when the user inputs the word quit, the script should exit
# gracefully saying 'Good bye'
#

msg = "Enter an integer number or quit to exit"
puts msg

while line = gets
  line.chomp!
  num = line.to_i

  if line == "quit"
    break
  elsif num < 0
    res = " is a number"
  elsif num < 10
    res = " is a digit"
  else
    res = " is a number"
  end

  puts num.to_s + res
  puts msg
end

puts "Exiting. Good bye..."
