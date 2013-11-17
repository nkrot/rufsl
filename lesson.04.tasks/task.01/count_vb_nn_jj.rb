#!/usr/bin/env ruby

# # #
# USAGE: DicTester --all --brief | count_vb_nn_jj.rb
#

Encoding::default_internal = "Windows-1252"
Encoding::default_external = "Windows-1252"

c_vb = c_vb_nn = c_vb_nn_jj = 0

while line = gets
  vb = line =~ /\tVB\b/
  nn = line =~ /\tNN\b/
  jj = line =~ /\tJJ\b/

  if vb && nn && jj
    c_vb_nn_jj += 1
  elsif vb && nn
    c_vb_nn += 1
  elsif vb && !jj
    c_vb += 1
  end
end

puts "VB+NN+JJ #{c_vb_nn_jj}"
puts "VB+NN    #{c_vb_nn}"
puts "VB       #{c_vb}"

## alternative condition checking
#  if vb
#    if nn
#      if jj
#        c_vb_nn_jj += 1
#      else
#        c_vb_nn += 1
#      end
#    elsif !jj
#      c_vb += 1
#    end
#  end

