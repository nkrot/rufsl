#!/usr/bin/env ruby

# # #
# This will work for any number of VBDs
#

Encoding::default_internal = "Windows-1252"
Encoding::default_external = "Windows-1252"

vbds = []

while line = gets
  line.chomp!

  if line =~ /^(.+\S)\s+classes:.+VB-/
    vb = $1
  end

  if vb && line =~ /VB-.+--> VBD-\d+ (.+)/
    vbds << $1.strip
  end

  if line.empty? && vb
    if vbds.length > 1
      puts "#{vb}\tVB\t-->\tVBD\t#{vbds.join("\t")}"
    end
    vb = nil
    vbds.clear
  end
end

