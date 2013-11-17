#!/usr/bin/env ruby

# # #
# ri Integer#upto
# ri Integer#downto
# ri Numeric#step
#

words = %w{uno dos tres cuatro cinco seis siete ocho nueve diez}

(words.length-3).downto(2) do |i|
  puts "Current word: #{words[i]}"
end


