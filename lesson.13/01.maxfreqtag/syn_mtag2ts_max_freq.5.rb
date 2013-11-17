#!/usr/bin/env ruby

# # #
# USAGE: syn_mtag2ts_max_freq.rb file(s)_in_mtag_format
#

def tag_with_max_freq(tfs)
  tfs.split('_').map {|tf|
    tf.split('/')    # [tag1, freq1]
  }.max_by {|t,f|    # t, f = [tag1, freq1]
    f.to_i
  }.first
end

while line = gets
  line.chomp!

#  puts line

  fields = line.split

  idx = -1
  fields.map! do |data|
    idx += 1
    if idx.odd?
      '_' + tag_with_max_freq(data)
    else
      ' ' + data
    end
  end

  puts fields.join("").strip
end

