#------------------
# 20070515
# dungtn@gmail.com
#-------------------------------------------------------------------
# part-of-speech tags and linguistics terms 
#-------------------------------------------------------------------

LANGUAGES = ["English", "Vietnamese"]

POS_TAGS = {
  # Verb and related
  "động từ thời quá khứ đơn"  => :simple_past_tense, #preterit
  "thời quá khứ của"          => :past_tense,
  "động tính từ quá khứ"  => :past_participle,
  "quá khứ phân từ"       => :past_participle,
  "hiện tại phân từ"      => :present_participle,
  "động tính từ hiện tại" => :present_participle,
  "phân từ hiện tại"      => :present_participle,
  "động từ phản thân"     => :reflexive_verb,
  "tái quy"               => :reflexive_verb,
  "nội động từ"   => :intranstive_verb,
  "tự động từ"    => :intranstive_verb,
  "ngoại động từ" => :transitive_verb,
  "tha động từ"   => :transitive_verb,
  "động từ"       => :verb,
  "trợ động từ"   => :auxiliary_verb,
  "gốc động từ"   => :verb_root,
  
  "đại từ nhân xưng"      => :personal_pronoun,
  "nhân xưng đại danh từ" => :personal_pronoun,
  "đại từ"        => :pronoun,
  "đại danh từ"   => :pronoun,
  "phó từ"        => :adverb,
  "trạng từ"      => :adverb,
  "mạo từ"        => :article,
  "quán từ"       => :article,
  "danh từ"       => :noun,
  "giới từ"       => :preposition,
  "tiền trí từ"   => :preposition,
  "tính từ"       => :adjective,

  "liên từ"       => :conjunction,
  "thán từ"       => :interjection,
  "cảm thán"      => :interjection,
  "viết tắt"      => :abbreviation,
  "phân từ"       => :participle,
  "nhân xưng"     => :person
}

POS_TAG_VI_NAMES = {
  :simple_past_tense  => "động từ thời quá khứ đơn",
  :past_tense         => "thời quá khứ",
  :past_participle    => "quá khứ phân từ",
  :present_participle => "hiện tại phân từ",
  :reflexive_verb     => "động từ phản thân",
  :intranstive_verb   => "nội động từ",
  :transitive_verb    => "ngoại động từ",
  :verb               => "động từ",
  :auxiliary_verb     => "trợ động từ",
  :verb_root          => "gốc động từ",
  :personal_pronoun   => "đại từ nhân xưng",
  :pronoun            => "đại từ",
  :adverb             => "trạng từ",
  :article            => "quán từ",
  :noun               => "danh từ",
  :preposition        => "giới từ",
  :adjective          => "tính từ",
  :conjunction        => "liên từ",
  :interjection       => "thán từ",
  :abbreviation       => "viết tắt",
  :participle         => "phân từ",
  :person             => "nhân xưng"
}

@@pos_tags_keys = POS_TAGS.keys.sort_by {|key| -key.length }

def get_pos_tag( str )
  @@pos_tags_keys.each do |key|
    return POS_TAGS[key] if str.include?( key )
  end
  return :unknown
end

LINGUISTICS_TERMS = {
	"ngôn ngữ học"  => :linguistics,
  "từ loại"       => :part_of_speech,
  "từ tính"       => :part_of_speech,
	"phiến ngữ"     => :phrase,
	"nhóm từ"       => :phrase,
  "chính tả"	    => :orthography,
	"ngữ nghĩa học" => :semantics,
	"ngữ nghĩa luận"=> :semantics,
	"văn cảnh"      => :context,
	"ngữ cảnh"      => :context,
	"ngữ dụng luận" => :pragmatics,
	"ngữ dụng học"  => :pragmatics,
	"trùng tự hóa"  => :reduplication,
	"láy âm"        => :reduplication
}

PHONETICS_TERMS = {
	"ngữ âm học"    => :phonetics,
	"âm vị học"     => :phonology,
	"âm vận học"    => :phonology,
	"hệ thống âm vị"=> :phonology, 
	"âm vị"         => :phoneme,
	"âm tố"         => :phoneme,
	"đa âm tiết"    => :polysyllable,
	"đơn âm tiết"   => :monosyllable,
	"âm tiết"       => :syllable
}