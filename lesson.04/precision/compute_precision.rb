#!/usr/bin/ruby

# # #
# USAGE: compute_precision.rb corpus_np.gold_vs_auto.txt
#
# this script computes precision of NP recognition

tp = fp = 0

while line = gets
  _, gold_word, auto_word = line.split

  if auto_word =~ /_NP/
    if gold_word =~ /_NP/
      tp += 1
    else
      fp += 1
    end
  end
end

prec = tp.to_f / (tp+fp)

puts "Precision of NP recognition: %.2f" % prec
