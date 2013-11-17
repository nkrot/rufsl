#!/usr/bin/env ruby

def select_by_length(words, len)
  words.select {|word| word.length == len}
end

dict = %w{cat act book teacher Ruby}

res = select_by_length(dict, 4)

puts res.inspect
