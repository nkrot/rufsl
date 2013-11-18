#!/usr/bin/ruby

while line = gets
  line.chomp!
#  puts line.inspect

  rel = line.split(/\t/, -1)

  name = rel.shift

  rel.map! do |field|
    field.split.map do |tw|
      tw.sub(/_[^_]+$/, "") # remove the tag from a tagged word
    end.join(' ')
  end

  rel.unshift name

#  puts rel.join("\t").inspect
  puts rel.join("\t")
end
