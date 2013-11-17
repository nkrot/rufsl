#!/usr/bin/ruby

# # #
# USAGE: compute_precision.rb corpus_np.gold_vs_auto.txt
#
# this script computes precision of NP recognition

tp = fp = 0

while line = gets
  _, gold_word, auto_word = line.split

  if ...

end

prec = ...

puts "Precision of NP recognition: %.2f" % prec
