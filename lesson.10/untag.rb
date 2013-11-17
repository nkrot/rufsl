#!/usr/bin/ruby

while line = gets
  line.chomp!

  puts "Tag sequence"
  puts line.split.map {|tagged|
    tagged.split('_').last
  }.join(' ')


  puts "Word sequence"
  puts line.split.map {|tagged|
    tagged.split('_')[0..-2]
    #tagged[/(.+)_/, 1] # will keep underscore in as_well
  }.join(' ')
end
