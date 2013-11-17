#!/usr/bin/ruby

# # #
# USAGE: ts2ts_rbta.rb file_with_tagged_sentences
#

while line = gets
  line.chomp!

  unless line.empty?
    # convert the sentence to a convenient data structure
    words = line.split.map do |tw|
      tw.match(/^(.+)_([^_]+)$/)
      [$1, $2]
    end

    # scan the sentence word by word applying rules
    last_idx = words.length-1
    words.each_with_index do |curr_word, idx|
      prev_word = idx > 0        ? words[idx-1] : []
      next_word = idx < last_idx ? words[idx+1] : []

      if curr_word[-1] == "NN" &&
          prev_word[-1] =~ /^PP[123]A/ &&
          next_word[-1] =~ /^N[NP]/
      then
#        puts "Changed: #{curr_word[-1]} -> VB"
        curr_word[-1] = "VB"
      end

      # other rules go here
      # if ...
    end

    line = words.map {|wt| wt.join('_')}.join(' ')
  end

  puts line
end

