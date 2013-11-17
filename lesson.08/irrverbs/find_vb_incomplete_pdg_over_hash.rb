#!/usr/bin/env ruby

# # #
#
#

Encoding::default_internal = "Windows-1252"
Encoding::default_external = "Windows-1252"

found_tags = {
  'VBZ' => false,
  'VBG' => false,
  'VBD' => false,
  'VBN' => false
}

while line = gets
  line.chomp!

  if line =~ /classes:/
    vb = nil
    found_tags.each {|k,v| found_tags[k] = false}
  end

  if line =~ /classes:.+VB-/
    vb = line.split(/  +/).first
  end

  if vb && line =~ /VB-.+--> (VB[ZGDN])-/
    found_tags [$1] = true
  end

  if line.empty? && vb
    missing_tags = found_tags.select {|k,v| !v}.keys
    unless missing_tags.empty?
      puts vb + "\t" + missing_tags.join("\t")
    end
  end
end
