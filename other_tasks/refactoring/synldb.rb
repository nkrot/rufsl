#
#
#

Encoding::default_external = 'Windows-1252'

class SynLDB

  def initialize
    @tags = {}
    load_default_file
  end

  def tags word
    @tags[word.upcase] || []
  end

  private
  def load_default_file
    fname = "../../dictester/dictester.all.txt"
    if File.exist? fname
      File.readlines(fname).each do |line|
        if line =~ /^(.*\S)\s+classes:\s+(.+)/
          word = $1.upcase
          tags = $2.gsub(/-\d+\/\d+/, "").split
          @tags[word] = tags
        end
      end
    else
      raise "File with dictester data not found: #{fname}"
    end
  end
end

if __FILE__ == $0
  synldb = SynLDB.new
  puts synldb.tags("figure") == ["VB", "NN"]
  puts synldb.tags("figurillo") == []
end
