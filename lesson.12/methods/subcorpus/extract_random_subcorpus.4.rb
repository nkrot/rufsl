#!/usr/bin/env ruby

# # #
# USAGE: extract_random_subcorpus.rb input_file(s)
#

def randomly_select_pct(data, pct)
  # 10% of 26455 = 2646 using correct rounding
  how_many = (data.length.to_f * pct / 100).round

  # we build an array of numbers of
  # the same length as the number of read-in lines,
  # then select from it randomly the required number of items
  # and use the selected items as indices in lines
  # to pick the sentences
  random_indices = (0...data.length).to_a.sample(how_many).sort

  return data.values_at(*random_indices) 
end

long_lines = []
short_lines = []

while line = gets
  if line.split.length > 10
    long_lines << line
  elsif line.split.length > 1
    short_lines << line
  end
end

puts randomly_select_pct(short_lines, 10).join("")
puts randomly_select_pct(long_lines,  20).join("")

