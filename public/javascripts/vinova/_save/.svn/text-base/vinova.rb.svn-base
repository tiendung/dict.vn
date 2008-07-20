$KCODE = 'UTF-8'

#***************************************************************************
#* Vietnamese Phoenitic Data
#* reference: http://ngonngu.net/index.php?p=68
#***************************************************************************/
#  a ă â | e ê | i y | o ô ơ | u ư 
$initial = {
  'ng-' => /^ng(h(?=i|e|ê)|(?!i|e|ê|y))/   , # nghĩ, nghe, nghê, nghiêng | ngủi ngỡ ngàng NOT ngy
  'g-'  => /^g(h(?=i|e|ê)|(?!i|e|ê))/      , # ghi, ghè, ghế | gỡ gạc
  'c-'  => /^ch(?!y)/                      , # chích choè NOT chy
  'k-'  => /^(k(?=i|y|e|ê)|c(?!i|y|e|ê))/  , # kim, kem, kê, kiếm, kỷ | con cà cuống
  'z-i' => /^gi(?!u|ư|a|â|ă|o|ơ)/          , # gỉ, gìn
  'z-'  => /^(d|gi)/                       , # giây da, giữ
  'kh-' => /^kh(?!y)/ , # khúc khích NOT khy
  'tr-' => /^tr(?!y)/ , # trống trải
  'nh-' => /^nh(?!y)/ , # nhắn nhủ  
  'th-' => /^th(?!y)/ , # thảnh thơi
  'f-'  => /^ph(?!y)/ , # phong phú
  'b-'  => /^b(?!y)/  , # buôn bán
  'd-'  => /^đ(?!y)/  , # đúng đắn
  'q-'  => /^q(?=u)/  , # quê, quán, quyên
  'h-'  => /^h/ , # hớt hải
  'l-'  => /^l/ , # lo lắng
  'm-'  => /^m/ , # may mắn
  'n-'  => /^n/ , # nắn nót
  'v-'  => /^v/ , # vỗ về
  't-'  => /^t/ , # tin tưởng
  'r-'  => /^r/ , # rõ ràng
  'x-'  => /^x/ , # xinh xắn
  's-'  => /^s/ , # sẵn sàng
  
  "-"   => /^/
}

$onset = {
  'k-w-' => /q-u(?!ô)/                   , # quyên, quăn
  '-w-'  => /-(u(?=y|ê|ơ|â)|o(?=a|e|ă))/ , # huy, thuế, huơ, thuần, chuyện | hoá, hoè, choắt, loang

  '--'   => /-/
}

$coda = {
  'gn-' => /^(hn-(?=i|ea|ê)|gn-(?=ô|o|ơ|e|êi|a|ă|u|ư))/ , # inh, kính, mênh, canh | ông, xong, siêng, keng, trang, trăng, hương, chúng
  'k-'  => /^(hc-(?=i|ea|ê)|c-(?=ô|o|ơ|e|êi|a|ă|u|ư))/  , # ích, mếch, cạch | ác, lắc, bọc, tiếc
  'w-'  => /^(o-(?=a|e)|u-(?=i|a|ă|ê|â|ơ|ư))/           , # áo, xạo, kéo | au, mếu, nấu, rượu, xíu, lưu
  'j-'  => /^(y-(?=ă|â)|i-(?!ă|â))/                     , # máy, cậy | cài, ngoái, tươi, tuổi, coi
  'm-'  => /^m-/ , # ám, lắm
  'n-'  => /^n-/ , # in, nghẹn
  'p-'  => /^p-/ , # úp, lấp
  't-'  => /^t-/ , # át, cắt

  '-'   => /^-/ 
};

$vowel = {
  'w-iê-' => /w-(yê(?=.+)|ya$)/          , # uyên, tuyển | khuya, tuya
  '--iê-' => /--(yê(?=.+)|iê(?=.+)|ia$)/ , # yêu, yểng | tiến, miếng | mía, tia, ỉa

  '-ươ-'  => /-(ươ(?=.+)|ưa$)/ , # ưỡn, lượng | ưa, cứa
  '-uô-'  => /-(uô(?=.+)|ua$)/ , # uốn, muỗng | úa, bùa
  
  'w-i'   => /w-y/      , # thuý, quý, quỳnh
  '--i-'  => /--y$/     , # y (tá)
   '-i-'  => /-i(?!ng)/ , # nghi, minh NOT ming
                          # bi, hỉ, kí, lì, mì, tỉ, sĩ, vĩ

  '-ă-'   => /-(ă(?=.+)|a(?=u|y))/ , # cắn, đắng | rau, tay, quay
  '-ae-'  => /-a(?=nh|ch)/ , # nhanh, ách, ngách
  '-a-'   => /-a/          , # nhà, át, ngang, tai, quai, ác

  '-ôô-'  => /-ôô(?=ng)/   , # bôông
  '-ô-'   => /-ô/          , # cô, bông

  '-oo-'  => /-(oo(?=ng|c)|o(?!=ch))/ , # coong, moóc | lò, con ...
  '-o-'   => /-o(?=ng|c)/             , # cong, móc
  
  '-ê-'   => /-ê/        , # khế, tên, lênh
  '-e-'   => /-e(?!nh)/  , # bé, kẻng, lém NOT kenh
  '-ơ-'   => /-ơ/        , # mơ, lớn
  '-â-'   => /-â(?=.+)/  , # tân, bâng, khuâng
  '-ư-'   => /-ư/        , # tư, cứng
  '-u-'   => /-u/          # xu, cúng
}

$vowelToneMap = {"á" => "a1","à" => "a2","ả" => "a3","ã" => "a4","ạ" => "a5","ắ" => "ă1","ằ" => "ă2","ẳ" => "ă3","ẵ" => "ă4","ặ" => "ă5","ấ" => "â1","ầ" => "â2","ẩ" => "â3","ẫ" => "â4","ậ" => "â5","é" => "e1","è" => "e2","ẻ" => "e3","ẽ" => "e4","ẹ" => "e5","ế" => "ê1","ề" => "ê2","ể" => "ê3","ễ" => "ê4","ệ" => "ê5","í" => "i1","ì" => "i2","ỉ" => "i3","ĩ" => "i4","ị" => "i5","ý" => "y1","ỳ" => "y2","ỷ" => "y3","ỹ" => "y4","ỵ" => "y5","ó" => "o1","ò" => "o2","ỏ" => "o3","õ" => "o4","ọ" => "o5","ố" => "ô1","ồ" => "ô2","ổ" => "ô3","ỗ" => "ô4","ộ" => "ô5","ớ" => "ơ1","ờ" => "ơ2","ở" => "ơ3","ỡ" => "ơ4","ợ" => "ơ5","ú" => "u1","ù" => "u2","ủ" => "u3","ũ" => "u4","ụ" => "u5","ứ" => "ư1","ừ" => "ư2","ử" => "ư3","ữ" => "ư4","ự" => "ư5"};

def match( str, part ) 
  found = false;

  str.reverse! if ( part == $coda )
  
  part.keys.each do |prop|
    re = part[ prop ];
    if ( re.class != String && str =~ re )
      str.sub!( re, prop );
      found = true;
      break;
    end
  end
  
  str.reverse! if ( part == $coda )
  $vietnamese = $vietnamese && found;
  return str;
end

def parse( str ) 
  save = str.to_u.downcase
  tone = 0
  str = ""
  
  # get tone number
  # puts save.length, save.size, save[3..4], save[0..0], save.split
  i = 0
  while (i < save.size) do
    char = save[ i..i ]
    char = save[i..i+=1] if char[0] == 195
    char = $vowelToneMap[ char ] || char
    puts char
    tone = char[ -1..-1 ].to_i if ( char.size > 2 )
    str += char[ 0..-1 ]
    i += 1
  end
  puts str, tone
  $vietnamese = true
  str = match( str, $initial )
  str = match( str, $onset )
  str = match( str, $vowel )
  str = match( str, $coda  )
  return tone.to_s + str
end

puts parse( "lượng" )
puts $vietnamese