#!/usr/bin/env ruby

# # #
# USAGE: syn_mtag2ts_max_freq.rb file(s)_in_mtag_format
#

while line = gets
  line.chomp!

#  puts line

  fields = line.split

  fields.each_with_index do |data, idx|
    if idx.odd?
      fields[idx] = "_" + data.split('_').map {|tf|
        tf.split('/') # [tag1, freq1]
      }.max_by {|tf|
        tf.last.to_i
      }.first
    end
  end

  puts fields.join(" ").gsub(" _", "_")
end

