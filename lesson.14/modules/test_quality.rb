#!/usr/bin/env ruby

require 'test/unit' # obligatory
require './quality' # your class/module you want to test

class TestQuality < Test::Unit::TestCase

  # every method MUST start with test_

  def test_accuracy_with_two_args
    assert_equal 0.8, Quality::accuracy(8, 2) # num_of_equal, num_of_diff 
  end

  def test_accuracy_with_four_args
    assert_equal 0.8, Quality::accuracy(5, 3, 2, 0) # tp, tn, fp, fn
  end

  def test_precision
    assert_equal 0.7, Quality::precision(700, 300) # tp, fp
  end

  def test_recall
    assert_equal 0.875, Quality::recall(70, 10) # tp, fn
  end
end

#class Test...  < Test::Unit::TestCase
#
#end
