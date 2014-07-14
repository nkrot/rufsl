#
# TODO:
# 1. add rdoc documentation here
# 2. a method for checking is a tree is complete: well_formed? or single_top?
#    remember to ignore the fakeroot
# 3. see lesson.34/recursion/display_parse_tree#parse_bracketed_ps for an implementation
#    w/o Enumeration
# 4. iterator .each over the child nodes only?
# 5. iterators over the complete tree (DFS/WFS). why do we need it?
# 6. .find and .find_all (use enumerable) to find a node/all nodes where data (.name)
#    matches given condition
# 7. add position in the sentence to word nodes?
#
# for rdoc:
# a fake root is added to ensure that even incomplete trees are handled
#

class ParseTree
  attr_accessor :name, :children, :verbose
  attr_reader :leaf

  def initialize name=nil, is_leaf=false
    @name = name   if name
    @fakeroot = false
    @children = []
    @parent = nil
    @leaf = is_leaf

    @verbose = false
  end

  def set bracketed
    tokens = bracketed.split.to_enum
    @name = :top
    @fakeroot = true
    set_from_bracketed(tokens)
  end

  def to_s
    if leaf?
      name
    else
      chunks = []
      children.each { |ch| chunks << ch.to_s }
      unless fakeroot?
        chunks.unshift(@name, "((")
        chunks << "))"
      end
      chunks.join(' ')
    end
  end

  # Display in vertical form indenting each level with 3 spaces
  # ignore the fake added top node
  def to_s_tree level=0
    str = ''

    if fakeroot?
      level -= 1
    else
      str << indent(level) << @name.to_s
    end

    children.each do |ch|
      if ch.leaf?
        str << "\n" << indent(level+1) << ch.name
      else
        str << "\n" << ch.to_s_tree(level+1)
      end
    end
    str.sub!(/^\n/, '')

    str
  end

  def leaf?
    @leaf
  end

  def fakeroot?
    @fakeroot
  end

  def leaves
    leaves = []
    children.each do |ch|
      if ch.leaf?
        leaves << ch
      else
        leaves += ch.leaves
      end
    end
    leaves
  end

  def words
    leaves.map { |node| node.name }
  end

  def word_count
    leaves.length
  end

  def parent
    if fakeroot? || @parent.fakeroot?
      nil
    else
      @parent
    end
  end

  # TODO: what if the node already has a parent? should child be unlinked from this parent?
  # do we want
  def parent= p
    @parent = p
    unless p.children.include?(self)
      p.children << self
    end
  end

  protected

  def set_from_bracketed tokens
    verboser "set_from_bracketed called"

    loop do
      #begin
      token = tokens.next

      case token
      when '))'
        verboser "Seeing '#{token}' -- will return up"
        break

      when '(('
        verboser "Seeing '#{token}' -- will parse it as a subtree and add to children"

        # reconsider the decision wrt to previous token:
        # it was not a word but a new node (subtree) name
        tree = @children.last
        tree.leaf = false
        tree.set_from_bracketed(tokens)

      else
        verboser "Seeing '#{token}' -- this is either a word or node name, will add it to children"
        tree = ParseTree.new(token, leaf=true)
        tree.parent = self

      end

      #rescue StopIteration # wow! it is actually handled by Kernel#loop
      #  verboser "Scanning complete!"
      #  break
      #end
    end
  end

  def indent mult
    "   " * mult
  end

  def leaf= val
    @leaf = val
  end

  def verboser msg
    if @verbose
      puts msg
    end
  end
end


