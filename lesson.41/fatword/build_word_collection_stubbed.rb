#!/usr/bin/env ruby

Encoding.default_external = 'Windows-1252'

class FatWord
  def text
    'sometext'
  end

  def tag
    'sometag'
  end

  def offset
    '10:12'
  end

  def tw
    text + "_" + tag
  end
end

def build_word_collection tokens
  [ FatWord.new ]
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
