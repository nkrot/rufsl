#
#
#

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
end

