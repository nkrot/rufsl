#
# TODO
# 1. add tests
#
# snp.set("This is an apple")
# snp1 = SimpleNounPhrase.new("A tasty apple")

class SimpleNounPhrase

  def initialize
  end

#  def nounphrase
#  end

  def set
  end

  def to_s
  end

  def to_v
  end

  # array of words
  # TODO: mutable? should changes to words be exported to the object?
  def words
    @data.split
  end

  def =~
  end

  # TODO: leave it as a task
  def !~ re
      !(self =~ re) 
  end
end

# Task:
# find rSNP that have different tags but the same wording
