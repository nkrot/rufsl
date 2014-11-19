# -*- coding: iso-8859-1 -*-

class SynLDB

  def initialize
    $stderr.puts "Starting SynLDB..."

    @tags = {
      "," => [","],
      "." => ["."],
      "da"          => ["CS", "RP", "QVP", "QG"],
      "die"         => ["ATDFN", "ATDFA", "ATDPN", "ATDPA", "PSPN", "PSPA", "PSFN", "PSFA"],
      "auswahl"	    => ["NCFSN", "NCFSG", "NCFSD", "NCFSA", "wdcSV"],
      "bedarf"      => ["VLPI1S", "VLPI3S", "NCMSN", "NCMSD", "NCMSA"],
      "farbstoffen" => ["NCMPD"],
      "färbe"       => ["VLPI1S", "VLPM2S", "VLPS3S", "wdcSV"],
      "keratinfasern" => ["NCMPD"],
      "an"         => ["APPD", "APPA", "APC", "RP", "QVP"],
      "beschränkt" => ["JP", "JPP", "VLPP", "VLPI2P", "VLPI3S", "VLPM2P"],
      "besteht"    => ["VLPI2P", "VLPI3S", "VLPM2P"],
      "derartigen" => ["JPMG", "JPMD", "JPMA", "JPNG", "JPND", "JPFG", "JPFD", "JPPN", "JPPG", "JPPD", "JPPA", "NCNSG", "NCNSD", "NCXPN", "NCXPG", "NCXPD"],
      "ein"       => ["ATIMN", "ATINN", "ATINA", "DZ", "RP", "QVP"],
      "einsetzbaren" => ["JPMG", "JPMD", "JPMA", "JPNG", "JPND", "JPFG", "JPFD", "JPPN", "JPPG", "JPPD", "JPPA"],
      "für"       => ["APPN", "APPA"],
      "in"        => ["APPD", "APPA"],
      "ist"       => ["VSPI3S"],
      "mitteln"   => ["VLINF", "VLPI1P", "VLPI3P", "NCNPD"],
      "weiterhin" => ["RP"]
    }

    @spec_tags = {
      "."        => ["NER_FILTER"],
      "auswahl"    => "uninf_noun quantitative_noun noun_2_verb cafm_abstract_nouns abstract_not_main_topic CAFM_UNINF_NOUN".split,
      "bedarf"     => "uninformative_noun noun_post_infz cafm_abstract_nouns abstract_not_main_topic NGCE_uninformative_noun".split,
      "färbe"      => ["vb_stem"],
      "an"         => "male_name adv_no_adj".split,
      "beschränkt" => "sentim_bad adj_with_attribute adj_person_character".split,
      "besteht"    => ["vb_stem"],
      "da"         => "uninformative_adv noun_surname_prefix male_name cnj_subordinating cafm_units adv_no_adj".split,
      "derartigen" => "uninformative_adj_light uninformative_adj QA_uninformative_adj NGCE_uninformative_adj".split,
      "die"        => "universal_animacy uninformative_ng prn_relative geoname dt_no_attr NGCE_uninformative_ng".split,
      "ein"        => "male_name dt_no_attr adv_no_adj".split,
      "einsetzbaren" => ["cafm_uninformative_jj_param"],
      "in"         => "units_size uninformative_adj_lemma prefixes_woc noun_geo_name_abbr adj_unchangeable".split,
      "ist"        => "wdc_no_noun vb_aux sein".split,
      "mitteln"    => "verb_2_noun vb_technical vb_stem uninformative_noun uninf_noun noun_2_verb abstract_not_main_topic NGCE_uninformative_noun".split,
      "weiterhin"  => ["adv_no_adj"]
    }

  end

  def tags word
    word = word.downcase
    if @tags.include?(word)
      @tags[word].dup
    else
      []
    end
  end

  def spec_tags word
    word = word.downcase
    if @spec_tags.include?(word)
      @spec_tags[word].dup
    else
      []
    end
  end
end

if __FILE__ == $0
  dict = SynLDB.new
  words = ["Da", "da", "einsetzbaren", "Färbe", "hasta la vista"]
  puts "What do we know about these words? #{words.inspect}"
  words.each do |wd|
    puts "Word '#{wd}' has tags: #{dict.tags(wd)}"
    puts "Word '#{wd}' has spec-tags: #{dict.spec_tags(wd)}"
    puts ""
  end
end
