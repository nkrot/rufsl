#!/usr/bin/ruby

# # #
# USAGE: extract_nth_sentence.rb corpus.tok.txt
# USAGE: extract_nth_sentence.rb --each-nth=20 corpus.tok.txt
#

require 'optparse'

@nth = 10 # [DEFAULT] extract each nth line

OptionParser.new do |opts|
  opts.banner = "
  Select each n-th non-empty line from the file(s)
USAGE: #{File.basename($0)} [OPTIONS] file(s)
OPTIONS:
"
  opts.on('-h', '--help', 'display this message and exit') do
    puts opts
    exit 0
  end

  opts.on('--each-nth=NUMBER',
          "extract each #{@nth}-th line instead of the default #{@nth}-th") do |val|
    @nth = val.to_i
  end

end.parse!


c_in = 0 # keeps track of the current line number

while line = gets
  line.chomp!

  unless line.empty?
    c_in += 1

    if c_in == @nth
      puts line
      c_in = 0
    end
  end
  
end
