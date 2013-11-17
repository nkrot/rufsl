#!/usr/bin/env ruby

# # #
#
#

Encoding::default_internal = "Windows-1252"
Encoding::default_external = "Windows-1252"

while line = gets
  line.chomp!

  if line =~ /classes:/
    vb = vbg = vbz = vbd = vbn = nil
  end

  if line =~ /classes:.+VB-/
    vb = line.split(/  +/).first
  end

  if vb && line =~ /VB-.+--> (VB[ZGDN])-/
    case $1
    when /VBZ/ then vbz = true
    when /VBG/ then vbg = true
    when /VBD/ then vbd = true
    when /VBN/ then vbn = true
    end
  end

  if line.empty? && vb
    missing_tags = []
    missing_tags << "VBZ"  unless vbz
    missing_tags << "VBG"  unless vbg
    missing_tags << "VBD"  unless vbd
    missing_tags << "VBN"  unless vbn

    unless missing_tags.empty?
      missing_tags.unshift vb
      puts missing_tags.join("\t")
    end
  end
end
