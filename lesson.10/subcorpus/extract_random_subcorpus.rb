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
selected_lines = lines.sample(how_many_we_want)

puts selected_lines.join("\n")

$stderr.puts "Selected %i lines of out %i\n" % [selected_lines.length, lines.length]

