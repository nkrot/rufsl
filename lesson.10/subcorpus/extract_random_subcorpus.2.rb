#!/usr/bin/ruby

# # #
# USAGE: extract_random_subcorpus.rb
#

pct = 10 # required percent of data to extract

lines = []

while line = gets
  line.chomp!

  unless line.empty?
    lines << line
  end
end

# 10% of 26455 = 2646 using correct rounding
how_many_we_want = (lines.length.to_f * pct / 100).round

## this picks the right number of sentences,
##  with no duplicates,
##  in random order :(
#selected_lines = lines.sample(how_many_we_want)

# alternatively, we build an array of numbers of
# the same length as the number of read-in lines,
# then select from it randomly the required number of items
# and use the selected items as indices in lines
# to pick the sentences
random_indices = (0...lines.length).to_a.sample(how_many_we_want).sort

# without splat operator:
random_indices.each do |idx|
  puts lines[idx]
end

$stderr.puts "Selected %i lines of out %i\n" % [random_indices.length, lines.length]


if !false
  # using splat operator
  # *array - splat operator
  selected_lines = lines.values_at(*random_indices) 

  puts selected_lines.join("\n")

  $stderr.puts "Selected %i lines of out %i\n" % [selected_lines.length, lines.length]
end




