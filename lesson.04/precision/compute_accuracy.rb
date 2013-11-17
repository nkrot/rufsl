#!/usr/bin/ruby

# # #
# USAGE: compute_accuracy.rb corpus_np.gold_vs_auto.txt
#

c_eq = c_diff = 0

while line = gets
  case line
  when /^=/
    c_eq += 1
  when /^-/
    c_diff += 1
  end
end

puts "Equal/different: #{c_eq}/#{c_diff}"

acc = c_eq.to_f / (c_eq+c_diff) 

puts "Accuracy of recognizing NP/non-NP words: %.2f" % acc
