#
#
#

class FatWord
  attr_accessor :text, :tag, :offset
  attr_accessor :syn_ldb

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
end

