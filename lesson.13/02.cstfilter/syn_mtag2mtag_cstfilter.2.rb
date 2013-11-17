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

# A title has all words in Titlecase, allowing only aux parts of speech be in lowercase
# Aux parts of speech are limited to determiners, prepositions and conjunctions
def title? mtag_fields
  mtag_fields.all? {|word, tags|
#    puts word.inspect
#    puts tags.inspect
    word =~ /^[^[:lower:]]/ ||
    word =~ /^[[:lower:]]/ && tags.any? {|t| t =~ /^[ICADT]/}
  }
end

while line = gets
  line.chomp!

  unless line.empty?
    fields = parse_mtag(line)
#    puts fields.inspect

    label = title?(fields) ? 'TITLE' : 'NON-TITLE'

    # the above ternary operator is equal to
#    if title?(fields)
#      label = 'TITLE'
#    else
#      label = 'NON-TITLE'
#    end

    puts label + "\t" + line
  end
end

