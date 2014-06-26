#
# TODO
# 1. add tests
#

class SimpleNounPhrase
  attr_reader :fieldname, :relname
  attr_accessor :data

  def initialize text=nil
    @relname   = "r__SimpleNounPhrase"
    @fieldname = "NounPhrase"
    @data = nil

    set_data(text)  if text
  end

  def set val
    set_data val
  end

  def to_s
    [@relname, @data].join("\t")
  end

  def to_v
    "Relation #{@relname}\n  NounPhrase     : #{@data}"
  end

  def words
    if @data
      @data.split
    else
      []
    end
  end

  def =~ re
    @data =~ re
  end

  def !~ re
    !(self =~ re) 
  end

  def length
    words.length
  end

  private

  def set_data str
    if str =~ /#{@relname}\t/
      @data = $~.post_match

    elsif str =~ /\t/
      raise "Does not look like a relation of type: #{@relname}"

    else
      @data = str
    end
  end
end

# Task:
# find rSNP that have different tags but the same wording
