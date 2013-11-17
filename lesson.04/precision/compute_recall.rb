#!/usr/bin/ruby

# # #
# USAGE: compute_recall.rb corpus_np.gold_vs_auto.txt
#
# this script computes recall of NP recognition

tp = fn = 0

while line = gets
  label, gold_word, auto_word = line.split

  if gold_word =~ /_NP/
    if auto_word =~ /_NP/
      tp += 1
    else
      fn += 1
    end
  end
end

recall = tp.to_f / (tp+fn)

puts "Recall of NP recognition: %.2f" % recall
