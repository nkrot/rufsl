#!/usr/bin/ruby

# # #
# USAGE: ThisScript data_file
#

c_np = c_zz = 0

while line = gets
  words = line.split
  c_np += words.count {|word| word =~ /_NP/}
  c_zz += words.count {|word| word !~ /_NP/}
end

puts "Words with NP: %s\nWords with non-NP: %s\n" % [c_np, c_zz]


