#
# relation SAO
#
#
# A further steps
# 1. extract common functionality into a base class
#

class SAO

  def initialize
  end

#  def subject
#  end

#  def subject=
#  end

  def to_s
  end

  def to_v
  end

  # should work with numbers as well
#  def set fieldname, value
#  end

  # should work with all below forms:
  # sao[0]
  # sao["subject"] and sao["Subject"]
  # sao[:subject]
  def []
  end

  def []=
  end

  def each
    yield fieldname, value
  end

end

