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

    # A title has all words in Titlecase, allowing only aux parts of speech be in lowercase
    # Aux parts of speech are limited to determiners, prepositions and conjunctions
    is_title = fields.all? {|word, tags|
#      puts word.inspect
#      puts tags.inspect
      word =~ /^[^[:lower:]]/ ||
      word =~ /^[[:lower:]]/ && tags.any? {|t| t =~ /^[ICADT]/}
    }

    label = is_title ? 'TITLE' : 'NON-TITLE'

    puts label + "\t" + line
  end
end

