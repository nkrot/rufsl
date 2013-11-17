#!/usr/bin/env ruby

def select_by_length(words, len)
  selected = []
  words.each {|word| 
    if word.length == len
      selected << word
    end
  }
  return selected
end

dict = %w{cat act book teacher Ruby}

res = select_by_length(dict, 4)

puts res.inspect

