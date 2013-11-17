#!/usr/bin/ruby

# # #
# USAGE: cat file | tr -s ' ' '\n' | ThisScript
#

c_np = c_zz = 0

while line = gets
  case line
  when /_NP/
    c_np += 1
  when /_ZZ/
    c_zz += 1
  end
end

puts "Words with NP: %s\nWords with non-NP: %s\n" % [c_np, c_zz]


