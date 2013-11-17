#!/usr/bin/env ruby

# # #
# USAGE: syn_mtag2ts_max_freq.rb file(s)_in_mtag_format
#

# Pick the tag with the highest frequency
# "NN/450_VB/1090" -> "VB"
def tag_with_max_freq(tfs)
  tfs.split('_').map {|tf|
    tf.split('/')    # [tag1, freq1]
  }.max_by {|t,f|    # t, f = [tag1, freq1]
    f.to_i
  }.first
end

# String -> String
def mtag2ts_max_freq mtag_sent
  idx = -1
  mtag_sent.split.map {|data|
    idx += 1
    if idx.odd?
      '_' + tag_with_max_freq(data)
    else
      ' ' + data
    end
  }.join("").strip
end

while line = gets
  line.chomp!

#  puts line
  puts mtag2ts_max_freq line
end

