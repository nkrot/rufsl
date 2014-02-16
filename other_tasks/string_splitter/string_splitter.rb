
class StringSplitter
  attr_reader :dictionary, :raw_splittings
  attr_accessor :verbose, :do_postprocessing

  def initialize
    @dictionary = nil
    @verbose = false
    @lengths = []
    @ready = false
    @do_postprocessing = true

    @splittings = []
    @raw_splittings = []
  end

  def dictionary= dict
    @dict = dict
    if @dict.respond_to? :include?
      @lengths = @dict.keys.map { |w| w.length }.uniq.sort
      @ready = true
    else
      @lengths.clear
      @ready = false
    end
  end

  def reset
    @splittings.clear
    @raw_splittings.clear
    @allow_unknown_single_letter = false
  end

  # why double pass algorithm is important:
  #sent = 'стоиктебекрепкийаромат'
  # if two passes are applied (@allow_unknown_single_letter is used) then splittings are
  #  стоик тебе крепкий аромат
  #  сто и ктебе крепкий аромат
  #  сто и к тебе крепкий аромат
  #  с то и ктебе крепкий аромат
  #  с то и к тебе крепкий аромат
  # if all is done in a single pass, then the output is only
  #  стоик тебе крепкий аромат
  #  сто и ктебе крепкий аромат
  def process str
    ready?
    reset

    @raw_splittings = find_head_substring str

    if @raw_splittings.empty?
      verboser "Nothing! retrying"
      @allow_unknown_single_letter = true
      @raw_splittings = find_head_substring str
    end

    if @do_postprocessing
      postprocess
    end

    result
  end

  def raw_result
    @raw_splittings
  end

  def result
    if @splittings.empty?
      raw_result
    else
      @splittings
    end
  end
  alias results result

  private

  def postprocess
    @raw_splittings.each do |str|
      @splittings << convert_to_splitting(str)
    end
  end

  def find_head_substring(word)
    verboser "Processing '#{word}'"

    # boundary condition:
    # remaining subword is shorter than the shortest word in @dict
    return []  if word.length < @lengths[0]

    splittings = []

    found = false
    @lengths.reverse_each do |len|
      next  if len > word.length

      head = word[0,len]
      is_known_word = word?(head) || punctuation?(head)

      # additional condition (!is_known_word) is correct and allows generating
      # *all* splittings, which slows down the execution considerably.
      # For now, prefer a single - the longest - word
      if len == 1 && @allow_unknown_single_letter # && !is_known_word
        # special treatment of individual characters. here we want to
        # 1. keep searching is nothing was found
        # 2. stop searching if something was found to avoid oversplitting
        #    known words into individual characters. this also prevent
        #    generation of all possible splittings by giving preference to one only.
        is_known_word = !found
      end

      verboser "length: #{len} -> #{head} -> known=#{is_known_word}, found=#{found}"

      if is_known_word
        tail = word[len..-1]
      
        if tail.length == 0
          splittings << head
          found = true
          verboser "Adding to splittings: '#{head}'"

        else
          tails = find_head_substring(tail)
          verboser "Adding to splittings: #{tails.join(', ')}"
          unless tails.empty?
            tails.map!{ |tail| "#{head} #{tail}" }
            splittings.concat tails
            found = true
          end
        end
      end
    end
    
    return splittings
  end

  def word? wd
    @dict.has?(wd) || !!wd.match(/^([\da-zA-Z]+)$/)
  end

  def punctuation? wd
    !!wd.match(/^[[:punct:]]$/)
  end

  def ready?
    unless @ready
      raise "ERROR: dictionary not set"
    end
  end

  def verboser msg
    if @verbose
      puts msg
    end
  end

  def convert_to_splitting str
    words = Splitting.new
    word = nil

    str.split.each do |w|
      if w.length == 1 && !punctuation?(w)
#        puts "single word: '#{w}'"
        if word
          word.append w
        else
          word = Word.new(w)
          words << word
        end
      else
        words << Word.new(w)
        word = nil
      end
    end
    
    offset = 0
    words.each do |word|
      word.offset = offset
      word.known = word?(word.text) || punctuation?(word.text)
      offset += word.length
    end
    
    words
  end

  ##################################################################

  class Splitting < Array
    def word_at pos
      @char2words ||= map_char_positions_to_words
      @char2words[pos]
    end

    private
    def map_char_positions_to_words
      @char2words = {}
      self.each do |word|
        s,e = word.offsets
        s.upto(e) { |pos| @char2words[pos] = word }
      end
      @char2words
    end
  end

  ##################################################################

  class Word
    attr_accessor :text, :known, :offset

    def initialize text=nil
      @text = text || ''
      @known = false
      @offset = -1
    end

    def append text
      @text << text
    end

    def length
      @text.length
    end
    alias size length

    def unknown?
      ! known?
    end

    def known?
      @known
    end

    def end_offset
      offset + length - 1
    end

    def offsets
      [offset, end_offset]
    end
  end
end
