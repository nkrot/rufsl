#!/usr/bin/env ruby

# # #
#
#

#$:.unshift File.dirname(__FILE__)

require_relative 'parse_tree'
require 'test/unit'
require 'pp'

class TestParseTree < Test::Unit::TestCase
  @@parsings = [
    # TESTCASE 1
    [
     "I_PP1A love_VB apples_NNS and_CC pears_NNS grown_VBN by_IN my_PP$ grandparents_NNS in_IN their_PP$ garden_NN",
     "w__Sentence (( I_PP1A w__VB_XX (( love_VB w__N_XX (( w_NNS_HP_CC (( apples_NNS and_CC pears_NNS  ))  w__VBN_XX (( grown_VBN w__IN_N (( by_IN w__N_XX (( w_NNS (( my_PP$ grandparents_NNS  ))  w__IN_N (( in_IN w_NN (( their_PP$ garden_NN  ))   ))   ))   ))   ))   ))   ))   ))",
     %w{w__Sentence w__VB_XX w_NNS_HP_CC w_NNS_HP_CC w_NNS_HP_CC w__VBN_XX w__IN_N w_NNS w_NNS w__IN_N w_NN w_NN},
"w__Sentence
   I_PP1A
   w__VB_XX
      love_VB
      w__N_XX
         w_NNS_HP_CC
            apples_NNS
            and_CC
            pears_NNS
         w__VBN_XX
            grown_VBN
            w__IN_N
               by_IN
               w__N_XX
                  w_NNS
                     my_PP$
                     grandparents_NNS
                  w__IN_N
                     in_IN
                     w_NN
                        their_PP$
                        garden_NN"
    ],

    # TESTCASE 2
    [
     "I_PP1A love_VB apples_NNS and_CC pears_NNS that_CS my_PP$ grandparents_NNS grow_VB in_IN their_PP$ garden_NN",
     "w__Sentence (( I_PP1A w__VB_XX (( love_VB w_NNS_HP_CC (( apples_NNS and_CC pears_NNS  ))   ))   ))  that_CS w__Sentence (( w_NNS (( my_PP$ grandparents_NNS  ))  w__VB_XX (( grow_VB w__IN_N (( in_IN w_NN (( their_PP$ garden_NN  ))   ))   ))   ))",
     ["w__Sentence", "w__VB_XX", "w_NNS_HP_CC", "w_NNS_HP_CC", "w_NNS_HP_CC", nil, "w_NNS", "w_NNS", "w__VB_XX", "w__IN_N", "w_NN", "w_NN" ],
"w__Sentence
   I_PP1A
   w__VB_XX
      love_VB
      w_NNS_HP_CC
         apples_NNS
         and_CC
         pears_NNS
that_CS
w__Sentence
   w_NNS
      my_PP$
      grandparents_NNS
   w__VB_XX
      grow_VB
      w__IN_N
         in_IN
         w_NN
            their_PP$
            garden_NN"
    ]
  ]

  def test_to_s
    @@parsings.each do |(tsent, et_ps, et_parents, vtree)|
      tree = ParseTree.new
      tree.set et_ps
      assert_equal et_ps.squeeze(' '), tree.to_s
    end
  end

  def test_to_s_tree
    @@parsings.each do |(tsent, et_ps, et_parents, vtree)|
      tree = ParseTree.new
      tree.set et_ps
      assert_equal vtree, tree.to_s_tree
    end
  end

  def test_leaves
    @@parsings.each do |(tsent, et_ps, et_parents, vtree)|
      tree = ParseTree.new
      tree.set et_ps

      et_words = tsent.split
      ac_leaves = tree.leaves

      assert_equal et_words.count, ac_leaves.count

      et_words.each_with_index do |word, idx|
        assert ac_leaves[idx].is_a?(ParseTree)
        assert_equal et_words[idx], ac_leaves[idx].name
      end
    end
  end

  def test_words
    @@parsings.each do |(tsent, et_ps, et_parents, vtree)|
      tree = ParseTree.new
      tree.set et_ps

      et_words = tsent.split

      assert_equal et_words.count, tree.word_count
      assert_equal et_words, tree.words
    end
  end

  def test_backreferences_to_parents
    @@parsings.each do |(tsent, et_ps, et_parents, vtree)|
      et_word_count = et_parents.length

      tree = ParseTree.new
      tree.set et_ps

      tree.leaves.each_with_index do |leaf, idx|
        p = leaf.parent
        p = p.name  if p
#        puts leaf.name.to_s + " < " + p.to_s

        assert_equal et_parents[idx], p
      end
    end
  end

  #
end
