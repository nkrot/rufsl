!#/bin/rubi

# # #
# The goal is to classify inputted numbers into
  digits:   0-9
#  numbers:  any other, e.g. -1, 10
# when the user inputs the word quit, the script should exit
# gracefully saying 'Good bye'
#

msg = "Enter an integer number or quit to exit"
puts msg

while line = gets
  line.chomp

  if line = "quit"
    break
  elsif line < 10
    res = " is a digit"
  else if line < 0
    res = " is a number"
  elsif
    res = " is a number"
  end

  puts num + res
  puts msg2
end

puts "Exiting. Good bye..."
