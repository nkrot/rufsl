#!/usr/bin/env ruby

# # #
#
#

def parse_mtag(line)
  fields = line.split
  wts = [] # word+tags
  0.step(fields.length-1, 2) do |i|
    wts << [fields[i], split_tags(fields[i+1])]
  end
  wts
end

def split_tags mtag
  mtag.split('_') #.map {|tf| tf.split('/')}
end


while line = gets
  line.chomp!

  # TODO: write your code below

  unless line.empty?
    fields = parse_mtag(line)
#    puts fields.inspect
  end
end

