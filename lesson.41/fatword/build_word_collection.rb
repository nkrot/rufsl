#!/usr/bin/env ruby

#require_relative "fat_word.rb"
require_relative "fat_word.1.rb"

Encoding.default_external = 'Windows-1252'

def build_word_collection tokens
  res_words = []
  tokens.each do |token|
    res_words << FatWord.new(token)
  end
  res_words
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
