#!/usr/bin/env ruby

require_relative './rsnp'
require 'test/unit'

class TestSNP < Test::Unit::TestCase

  def test_initialize_1
    text = "This is an apple"
    rel = "r__SimpleNounPhrase\t#{text}"
    snp = SimpleNounPhrase.new rel
    assert_equal text, snp.data
  end

  def test_initialize_2
    text = "This is an apple"
    snp = SimpleNounPhrase.new text
    assert_equal text, snp.data
  end

  def test_initialize_3
    text = "This is an apple"
    snp = SimpleNounPhrase.new
    snp.set text
    assert_equal text, snp.data
  end

  def test_initialize_4
    text = "SAO\treal beaver\tnot love\t\tbeaver bier\t\t\t\t\t\t"
    assert_raise(RuntimeError) { snp = SimpleNounPhrase.new(text) }
  end

  # TODO: other possible forms of initial data include:
  # < r__SimpleNounPhrase ...
  # +>> r__SimpleNounPhrase ...

  def test_read_only_attributes
    snp = SimpleNounPhrase.new

    assert_equal "NounPhrase", snp.fieldname
    assert_raises(NoMethodError) { snp.fieldname = "fake" }

    assert_equal "r__SimpleNounPhrase", snp.relname
    assert_raises(NoMethodError) { snp.relname   = "SAO"  }
  end

  def test_to_s
    text = "An array of hedgehogs"
    snp = SimpleNounPhrase.new text
    assert_equal "r__SimpleNounPhrase\t#{text}", snp.to_s
  end

  def test_to_v
    text = "An array of eels"
    et = \
"Relation r__SimpleNounPhrase
  NounPhrase     : #{text}"

    snp = SimpleNounPhrase.new text
    assert_equal et, snp.to_v
  end

  def test_length
    snp = SimpleNounPhrase.new("r__SimpleNounPhrase\tOne two three")
    assert_equal 3, snp.length
  end

  def test_match_re
    text = "three happy beavers"
    snp = SimpleNounPhrase.new text

    assert_not_nil snp =~ /pp/
    assert snp !~ /bier/
  end
end


