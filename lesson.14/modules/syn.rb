
module Syn
  def self.untag(s)
    s.gsub(/_[^_\s]+/, "")
  end

  # given a tagged sentence,
  # return all tags from the tagged sentence, as array
  def self.tags(ts)
    ['nn', 'vb']
  end

  # given a tagged sentence,
  # return all words from the tagged sentence, as array
#  def ...
#  end

  # join all compounds into words
  # H_wdcEL -_wdcLK Bomben_wdcEL versuch_NCNSN
  # --> H-Bombenversuch
#  def unwdc
#  end
end
