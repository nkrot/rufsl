#!/usr/bin/ruby

# # #
# USAGE: compute_quality_metrics.rb corpus_np.gold_vs_auto.txt
#

tp = tn = fp = fn = 0

while line = gets
  label, gold_word, auto_word = line.split
  gw_tag = gold_word.split(/_/).last

  case label
  when "="
    if gw_tag == "NP"
      tp += 1
    else
      tn += 1 # only necessary for computing # of all
    end

  when "-"
    if gw_tag == "NP"
      fn += 1
    else
      fp += 1
    end
  end
end

acc    = (tp+tn) / (tp + tn + fp + fn).to_f
prec   = tp / (tp+fp).to_f
recall = tp / (tp+fn).to_f

puts "Quality of NP recognition:"
puts " Accuracy:  %.2f" % acc
puts " Precision: %.2f" % prec
puts " Recall:    %.2f" % recall
