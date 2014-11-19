#!/usr/bin/env ruby

Encoding.default_external = 'Windows-1252'

def build_word_collection tokens
  [1,2]
end

while line = gets
  line.chomp!

  if line =~ /Sentence tagged\s(.+)/
    words = build_word_collection($1.split)

    # debug
    words.each do |word|
      puts "WORD %s TAG %s OFFSETS %s" % [word.text, word.tag, word.offset]
      puts "Tagged word: #{word.tw}"
    end
  end
end
