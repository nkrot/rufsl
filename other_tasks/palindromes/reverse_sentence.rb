#!/usr/bin/ruby
# -*- coding: utf-8 -*-

# # #
# more fun at:
#  http://www.palindromelist.net/
#  http://www.cs.arizona.edu/icon/oddsends/palinsen.htm
#  http://otvet.mail.ru/question/24884560
#

palindromes = \
[
 'Rats live on no evil star',
 'Mr. Owl ate my metal worm',
 'Аргентина манит негра'
]

palindromes.each do |sent|
  puts sent.split.map {|word|
    word.reverse
  }.reverse.join(' ')
end
