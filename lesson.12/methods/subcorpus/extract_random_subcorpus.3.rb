#!/usr/bin/env ruby

# # #
# USAGE: extract_random_subcorpus.rb
#

pct = 10 # required percent of data to extract

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


lines = []
while line = gets
  lines << line  if line.length > 1
end

selected_lines = randomly_select_pct(lines, pct)

puts selected_lines.join("")

$stderr.puts "Selected %i lines of out %i\n" % [selected_lines.length, lines.length]

