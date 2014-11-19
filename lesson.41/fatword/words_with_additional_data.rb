#!/usr/bin/env ruby

require_relative "fat_word"
require_relative "syn_ldb"

Encoding.default_external = 'Windows-1252'

@syn_ldb = SynLDB.new

def build_word_collection tokens
  res_words = []
  tokens.each do |token|
    fat_word = FatWord.new(token)
    fat_word.syn_ldb = @syn_ldb
    res_words << fat_word
  end
  res_words
end

while line = gets
  line.chomp!

  if line =~ /Sentence tagged\s(.+)/
    words = build_word_collection($1.split)

    # debug
    words.each do |word|
      puts "=" * 20
      puts "WORD %s TAG %s OFFSETS %s" % [word.text, word.tag, word.offset]
      puts "Tagged word: #{word.tw}"
      puts "All word tags: #{word.tags}"
      puts "All word spec tags: #{word.spectags}"

      puts ""
    end
  end
end
