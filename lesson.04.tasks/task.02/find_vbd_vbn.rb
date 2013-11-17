#!/usr/bin/env ruby

# # #
# USAGE: DicTester --all | find_vbd_vbn.rb
#

Encoding::default_internal = "Windows-1252"
Encoding::default_external = "Windows-1252"

c_found = 0

while line = gets
  line.chomp!

  vbn_freq = vbd_freq = -1

  if line =~ /VBN-\d+\/([^\s]+)/
    vbn_freq = $1.to_f
  end

  if line =~ /VBD-\d+\/([^\s]+)/
    vbd_freq = $1.to_f
  end

  # TODO: this is wrong in case of existing VBN and non-existing VBD
  if vbn_freq + vbd_freq > 0 && vbn_freq >= vbd_freq*10
    puts line.split.first
    c_found += 1
  end
end

STDERR.puts "Found: #{c_found}"

