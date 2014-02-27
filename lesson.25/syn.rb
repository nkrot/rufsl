
module Syn
  def self.all_matches str, re
    mds = []
    pos = 0
    while md = str.match(re, pos)
      pos = md.end(0)
      mds << md
    end
    return mds
  end
end

# This idiom allows placing self tests into non-executable ruby scripts.
# This code will run only if the file is executed by running
#   ruby syn.rb
if __FILE__ == $0

  str = "whether_CS the_ATI wether_NN could_MD weather_VB the_ATI weather_NN or_CC whether_CS the_ATI weather_NN the_ATI wether_NN would_MD kill_VB ._."

  et_pre_matches  = [] # a list of string segments that preceed the matched part 
  et_post_matches = [] # a list of string segments that follow the matched part 

  et_pre_matches  << ""
  et_post_matches << " the_ATI wether_NN could_MD weather_VB the_ATI weather_NN or_CC whether_CS the_ATI weather_NN the_ATI wether_NN would_MD kill_VB ._."

  et_pre_matches  << "whether_CS the_ATI "
  et_post_matches << " could_MD weather_VB the_ATI weather_NN or_CC whether_CS the_ATI weather_NN the_ATI wether_NN would_MD kill_VB ._."

  et_pre_matches  << "whether_CS the_ATI wether_NN could_MD "
  et_post_matches << " the_ATI weather_NN or_CC whether_CS the_ATI weather_NN the_ATI wether_NN would_MD kill_VB ._."

  et_pre_matches  << "whether_CS the_ATI wether_NN could_MD weather_VB the_ATI "
  et_post_matches << " or_CC whether_CS the_ATI weather_NN the_ATI wether_NN would_MD kill_VB ._."

  et_pre_matches  << "whether_CS the_ATI wether_NN could_MD weather_VB the_ATI weather_NN or_CC "
  et_post_matches << " the_ATI weather_NN the_ATI wether_NN would_MD kill_VB ._."

  et_pre_matches  << "whether_CS the_ATI wether_NN could_MD weather_VB the_ATI weather_NN or_CC whether_CS the_ATI "
  et_post_matches << " the_ATI wether_NN would_MD kill_VB ._."

  et_pre_matches  << "whether_CS the_ATI wether_NN could_MD weather_VB the_ATI weather_NN or_CC whether_CS the_ATI weather_NN the_ATI "
  et_post_matches << " would_MD kill_VB ._."


  mds = Syn.all_matches str, /wh?ea?ther_\w+/

  puts 7 == mds.length

  mds.each_with_index do |md, idx|
    puts "Checking pre_match : #{et_pre_matches[idx] == md.pre_match}"
    puts "Checking post_match: #{et_post_matches[idx] == md.post_match}"
#    puts md.post_match
  end
end
