#!/usr/bin/env ruby

# # #
#
#

Encoding::default_internal = "Windows-1252"
Encoding::default_external = "Windows-1252"

expected_tags = %w{ VBZ VBG VBD VBN }

while line = gets
  line.chomp!

  if line =~ /classes:.+VB-/
    vb = line.split(/  +/).first
  end

  if vb && line =~ /VB-.+--> (VB[ZGDN])-/
    expected_tags.delete $1
  end

  if line.empty? && vb
    unless expected_tags.empty?
      expected_tags.unshift vb
      puts expected_tags.join("\t")
    end
    vb = nil
    expected_tags = %w{ VBZ VBG VBD VBN }
  end
end
