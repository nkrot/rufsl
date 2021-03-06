#!/usr/bin/env ruby

require_relative "syn_ldb"

class FatWord
  attr_accessor :text, :tag, :offset

  def initialize str
    @text = str.dup
    @tag = @offset = nil

    if @text =~ /(.+)_(-?\d+:-?\d+)$/
      @text, @offset = $1, $2
    end

    if @text =~  /(.+)_([^_]+)$/
      @text, @tag = $1, $2
    end
  end

  def tw
    @text + "_" + @tag
  end

  def to_s
    [@text, @tag, @offset].compact.join('_')
  end

  def tags
    syn_ldb.tags(self.text)
  end

  def spec_tags
    syn_ldb.spec_tags(self.text)
  end

  alias spectags spec_tags

  private
  def syn_ldb
    @syn_ldb ||= SynLDB.new
  end
end

######################################################################

word = FatWord.new "Auswahl_NCFSN_7:13"
puts word.tags.inspect

word = FatWord.new "derartigen_JPPD_125:134"
puts word.tags.inspect

