
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
      # TODO: convert to array of Word object, where each word has a property: known_to_dictionary
      # optionally, join single letters into a word
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

  private

  def convert_to_words str
    str.split
  end

  def postprocess
    @raw_splittings.each do |str|
      @splittings << convert_to_words(str)
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
      is_known_word = word?(head)

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
    @dict.include?(wd) || !!wd.match(/^([[:punct:]]|[\da-zA-Z]+)$/)
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

end
