# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Lines
Line.create({:name => "관악02", :line_id => "3920400"});
Line.create({:name => "5511", :line_id => "4551100"});
Line.create({:name => "5513", :line_id => "4551300"});
Line.create({:name => "5516", :line_id => "4551600"});

sections = Array.new
sections.push({:line => "3920400", :stops => Array.new})
sections.push({:line => "4551100", :stops => Array.new})
sections.push({:line => "4551300", :stops => Array.new})
sections.push({:line => "4551600", :stops => Array.new})

# 관악02
stops = sections[0][:stops]
stops.push(Stop.create({:name => "낙성대역", :stop_id => "10441", :property => "stop"}));
stops.push(Stop.create({:name => "낙성대입구", :stop_id => "12689", :property => "stop"}));
stops.push(Stop.create({:name => "인헌초등학교", :stop_id => "12690", :property => "stop"}));
stops.push(Stop.create({:name => "낙성대현대아파트", :stop_id => "10483", :property => "stop"}));
stops.push(Stop.create({:name => "낙성대공원.영어마을", :stop_id => "10497", :property => "stop"}));
stops.push(Stop.create({:name => "서울과학전시관", :stop_id => "10504", :property => "stop"}));
stops.push(Stop.create({:name => "호암교수회관", :stop_id => "12691", :property => "stop"}));
stops.push(Stop.create({:name => "인헌아파트", :stop_id => "10362", :property => "stop"}));
stops.push(Stop.create({:name => "호암교수회관", :stop_id => "10527", :property => "stop"}));
stops.push(Stop.create({:name => "가족생활동", :stop_id => "10538", :property => "stop"}));
stops.push(Stop.create({:name => "서울대후문.연구공원", :stop_id => "10541", :property => "stop"}));
stops.push(Stop.create({:name => "기숙사신관", :stop_id => "10548", :property => "stop"}));
stops.push(Stop.create({:name => "기숙사구관", :stop_id => "10556", :property => "stop"}));
stops.push(Stop.create({:name => "기숙사삼거리", :stop_id => "10560", :property => "stop"}));
stops.push(Stop.create({:name => "공동기기원", :stop_id => "10452", :property => "stop"}));
stops.push(Stop.create({:name => "유전공학연구소.반도체공동연구소", :stop_id => "33356", :property => "stop"}));
stops.push(Stop.create({:name => "에너지자원연구소", :stop_id => "34733", :property => "stop"}));
stops.push(Stop.create({:name => "신소재", :stop_id => "33354", :property => "stop"}));
stops.push(Stop.create({:name => "제2파워플랜트", :stop_id => "10565", :property => "stop"}));
stops.push(Stop.create({:name => "건설환경종합연구소", :stop_id => "10567", :property => "stop"}));
stops.push(Stop.create({:name => "제2공학관", :stop_id => "33712", :property => "stop"}));
stops.push(Stop.create({:name => "제1공학관", :stop_id => "10214", :property => "stop"}));
stops.push(Stop.create({:name => "유전공학연구소.반도체공동연구소", :stop_id => "33355", :property => "stop"}));
stops.push(Stop.create({:name => "교수회관입구", :stop_id => "10459", :property => "stop"}));
stops.push(Stop.create({:name => "기숙사삼거리", :stop_id => "10135", :property => "stop"}));
stops.push(Stop.create({:name => "BK국제관", :stop_id => "10055", :property => "stop"}));
stops.push(Stop.create({:name => "가족생활동", :stop_id => "10034", :property => "stop"}));
stops.push(Stop.create({:name => "호암교수회관", :stop_id => "12691", :property => "stop"}));
stops.push(Stop.create({:name => "인헌아파트", :stop_id => "10362", :property => "stop"}));
stops.push(Stop.create({:name => "서울과학전시관", :stop_id => "10377", :property => "stop"}));
stops.push(Stop.create({:name => "낙성대공원.영어마을", :stop_id => "12687", :property => "stop"}));
stops.push(Stop.create({:name => "낙성대현대아파트", :stop_id => "10396", :property => "stop"}));
stops.push(Stop.create({:name => "인헌초등학교", :stop_id => "12688", :property => "stop"}));
stops.push(Stop.create({:name => "낙성대입구", :stop_id => "10422", :property => "stop"}));

# 5511
stops = sections[1][:stops]
stops.push(Stop.create({:name => "제2공학관", :stop_id => "33712", :property => "stop"}));
stops.push(Stop.create({:name => "제1공학관", :stop_id => "33711", :property => "stop"}));
stops.push(Stop.create({:name => "에너지자원연구소", :stop_id => "34733", :property => "stop"}));
stops.push(Stop.create({:name => "공대입구", :stop_id => "33748", :property => "stop"}));
stops.push(Stop.create({:name => "농생대", :stop_id => "33749", :property => "stop"}));
stops.push(Stop.create({:name => "자연대.행정관입구", :stop_id => "33750", :property => "stop"}));
stops.push(Stop.create({:name => "문화관입구", :stop_id => "34732", :property => "stop"}));
stops.push(Stop.create({:name => "법대입구", :stop_id => "34043", :property => "stop"}));
stops.push(Stop.create({:name => "서울대정문", :stop_id => "34731", :property => "stop"}));
stops.push(Stop.create({:name => "서울대학교", :stop_id => "3447", :property => "stop"}));
stops.push(Stop.create({:name => "서울대학교.치과병원", :stop_id => "14408", :property => "stop"}));
stops.push(Stop.create({:name => "서울여상.서울문영여중고앞", :stop_id => "3722", :property => "stop"}));
stops.push(Stop.create({:name => "관악구청", :stop_id => "34553", :property => "stop"}));
stops.push(Stop.create({:name => "서울대입구역", :stop_id => "3719", :property => "stop"}));
stops.push(Stop.create({:name => "봉천사거리.봉천중앙시장", :stop_id => "3555", :property => "stop"}));
stops.push(Stop.create({:name => "봉원중학교.행운동우성아파트", :stop_id => "3556", :property => "stop"}));
stops.push(Stop.create({:name => "관악푸르지오아파트", :stop_id => "3558", :property => "stop"}));
stops.push(Stop.create({:name => "봉천고개.관악현대아파트", :stop_id => "34813", :property => "stop"}));
stops.push(Stop.create({:name => "숭실대입구역", :stop_id => "3438", :property => "stop"}));
stops.push(Stop.create({:name => "상도1동주민센터.상도3차래미안", :stop_id => "36776", :property => "stop"}));
stops.push(Stop.create({:name => "상도3차삼성래미안후문", :stop_id => "36778", :property => "stop"}));
stops.push(Stop.create({:name => "상도SH빌아파트상도팰리스후문", :stop_id => "36780", :property => "stop"}));
stops.push(Stop.create({:name => "중앙대후문", :stop_id => "10248", :property => "stop"}));
stops.push(Stop.create({:name => "중앙대정문", :stop_id => "10246", :property => "stop"}));
stops.push(Stop.create({:name => "중앙대학교", :stop_id => "30876", :property => "stop"}));
stops.push(Stop.create({:name => "흑석역.흑석동빗물펌프장", :stop_id => "1525", :property => "stop"}));
stops.push(Stop.create({:name => "중앙대정문", :stop_id => "30877", :property => "stop"}));
stops.push(Stop.create({:name => "중앙대중문", :stop_id => "10247", :property => "stop"}));
stops.push(Stop.create({:name => "중앙대후문", :stop_id => "10249", :property => "stop"}));
stops.push(Stop.create({:name => "상도SH빌아파트상도팰리스후문", :stop_id => "36781", :property => "stop"}));
stops.push(Stop.create({:name => "상도3차삼성래미안후문", :stop_id => "36779", :property => "stop"}));
stops.push(Stop.create({:name => "상도1동주민센터.상도3차래미안", :stop_id => "36777", :property => "stop"}));
stops.push(Stop.create({:name => "숭실대입구역", :stop_id => "36777", :property => "stop"}));
stops.push(Stop.create({:name => "봉현초등학교", :stop_id => "3560", :property => "stop"}));
stops.push(Stop.create({:name => "성현동동아아파트", :stop_id => "3559", :property => "stop"}));
stops.push(Stop.create({:name => "봉원중학교.행운동우성아파트", :stop_id => "3557", :property => "stop"}));
stops.push(Stop.create({:name => "봉천사거리.위버폴리스", :stop_id => "13827", :property => "stop"}));
stops.push(Stop.create({:name => "서울대입구역", :stop_id => "33535", :property => "stop"}));
stops.push(Stop.create({:name => "관악경찰서", :stop_id => "35960", :property => "stop"}));
stops.push(Stop.create({:name => "서울여상.서울문영여중고앞", :stop_id => "3721", :property => "stop"}));
stops.push(Stop.create({:name => "서울대학교", :stop_id => "34554", :property => "stop"}));
stops.push(Stop.create({:name => "경영대", :stop_id => "33753", :property => "stop"}));
stops.push(Stop.create({:name => "수의대입구.보건대학원앞", :stop_id => "34741", :property => "stop"}));
stops.push(Stop.create({:name => "국제대학원", :stop_id => "33744", :property => "stop"}));
stops.push(Stop.create({:name => "관악사삼거리", :stop_id => "10456", :property => "stop"}));
stops.push(Stop.create({:name => "공동기기원", :stop_id => "10452", :property => "stop"}));
stops.push(Stop.create({:name => "유전공학연구소.반도체공동연구소", :stop_id => "33356", :property => "stop"}));
stops.push(Stop.create({:name => "에너지자원연구소", :stop_id => "34733", :property => "stop"}));
stops.push(Stop.create({:name => "신소재", :stop_id => "33354", :property => "stop"}));
stops.push(Stop.create({:name => "건설환경종합연구소앞", :stop_id => "36960", :property => "stop"}));
stops.push(Stop.create({:name => "제2공학관", :stop_id => "35864", :property => "stop"}));

# 5513
stops = sections[2][:stops]
stops.push(Stop.create({:name => "제2공학관", :stop_id => "33712", :property => "stop"}));
stops.push(Stop.create({:name => "제1공학관", :stop_id => "33711", :property => "stop"}));
stops.push(Stop.create({:name => "유전공학연구소.반도체공동연구소", :stop_id => "33355", :property => "stop"}));
stops.push(Stop.create({:name => "교수회관입구", :stop_id => "10459", :property => "stop"}));
stops.push(Stop.create({:name => "관악사삼거리", :stop_id => "10455", :property => "stop"}));
stops.push(Stop.create({:name => "국제대학원", :stop_id => "33709", :property => "stop"}));
stops.push(Stop.create({:name => "수의대입구.보건대학원앞", :stop_id => "36591", :property => "stop"}));
stops.push(Stop.create({:name => "경영대", :stop_id => "33707", :property => "stop"}));
stops.push(Stop.create({:name => "서울대학교", :stop_id => "3447", :property => "stop"}));
stops.push(Stop.create({:name => "서울대학교.치과병원", :stop_id => "14408", :property => "stop"}));
stops.push(Stop.create({:name => "서울여상.서울문영여중고앞", :stop_id => "3722", :property => "stop"}));
stops.push(Stop.create({:name => "관악구청", :stop_id => "34553", :property => "stop"}));
stops.push(Stop.create({:name => "서울대입구역", :stop_id => "3719", :property => "stop"}));
stops.push(Stop.create({:name => "봉천사거리.봉천중앙시장", :stop_id => "3555", :property => "stop"}));
stops.push(Stop.create({:name => "봉원중학교.행운동우성아파트", :stop_id => "3556", :property => "stop"}));
stops.push(Stop.create({:name => "관악푸르지오아파트", :stop_id => "3558", :property => "stop"}));
stops.push(Stop.create({:name => "봉현초등학교", :stop_id => "32930", :property => "stop"}));
stops.push(Stop.create({:name => "관악드림타운115동", :stop_id => "33344", :property => "stop"}));
stops.push(Stop.create({:name => "관악드림타운북문", :stop_id => "33346", :property => "stop"}));
stops.push(Stop.create({:name => "구암중학교", :stop_id => "33349", :property => "stop"}));
stops.push(Stop.create({:name => "벽산아파트.선의사회복지관", :stop_id => "33338", :property => "stop"}));
stops.push(Stop.create({:name => "벽산블루밍벽산아파트303동앞", :stop_id => "34049", :property => "stop"}));
stops.push(Stop.create({:name => "벽산아파트.선의사회복지관", :stop_id => "33347", :property => "stop"}));
stops.push(Stop.create({:name => "구암중학교", :stop_id => "33348", :property => "stop"}));
stops.push(Stop.create({:name => "관악드림타운북문", :stop_id => "33345", :property => "stop"}));
stops.push(Stop.create({:name => "관악드림타운115동", :stop_id => "33343", :property => "stop"}));
stops.push(Stop.create({:name => "동아아파트105동앞", :stop_id => "33340", :property => "stop"}));
stops.push(Stop.create({:name => "성현동동아아파트", :stop_id => "3559", :property => "stop"}));
stops.push(Stop.create({:name => "봉원중학교.행운동우성아파트", :stop_id => "3557", :property => "stop"}));
stops.push(Stop.create({:name => "봉천사거리.위버폴리스", :stop_id => "13827", :property => "stop"}));
stops.push(Stop.create({:name => "서울대입구역", :stop_id => "33535", :property => "stop"}));
stops.push(Stop.create({:name => "관악경찰서", :stop_id => "35960", :property => "stop"}));
stops.push(Stop.create({:name => "서울여상.서울문영여중고앞", :stop_id => "3721", :property => "stop"}));
stops.push(Stop.create({:name => "서울대학교", :stop_id => "34554", :property => "stop"}));
stops.push(Stop.create({:name => "서울대정문", :stop_id => "3446", :property => "stop"}));
stops.push(Stop.create({:name => "법대입구", :stop_id => "33353", :property => "stop"}));
stops.push(Stop.create({:name => "자연대.행정관입구", :stop_id => "34552", :property => "stop"}));
stops.push(Stop.create({:name => "농생대", :stop_id => "33352", :property => "stop"}));
stops.push(Stop.create({:name => "공대입구", :stop_id => "33351", :property => "stop"}));
stops.push(Stop.create({:name => "신소재", :stop_id => "33354", :property => "stop"}));
stops.push(Stop.create({:name => "건설환경종합연구소앞", :stop_id => "36960", :property => "stop"}));
stops.push(Stop.create({:name => "제2공학관", :stop_id => "35864", :property => "stop"}));

# 5516
stops = sections[3][:stops]
stops.push(Stop.create({:name => "신림2동차고지", :stop_id => "36316", :property => "stop"}));
stops.push(Stop.create({:name => "신림동고시촌입구", :stop_id => "3452", :property => "stop"}));
stops.push(Stop.create({:name => "서울산업정보학교.삼성교", :stop_id => "3450", :property => "stop"}));
stops.push(Stop.create({:name => "관악산입구.관악문화관도서관", :stop_id => "3448", :property => "stop"}));
stops.push(Stop.create({:name => "서울대학교", :stop_id => "34554", :property => "stop"}));
stops.push(Stop.create({:name => "서울대정문", :stop_id => "3446", :property => "stop"}));
stops.push(Stop.create({:name => "경영대", :stop_id => "33753", :property => "stop"}));
stops.push(Stop.create({:name => "수의대입구.보건대학원앞", :stop_id => "34741", :property => "stop"}));
stops.push(Stop.create({:name => "국제대학원", :stop_id => "33744", :property => "stop"}));
stops.push(Stop.create({:name => "관악사삼거리", :stop_id => "10456", :property => "stop"}));
stops.push(Stop.create({:name => "공동기기원", :stop_id => "10452", :property => "stop"}));
stops.push(Stop.create({:name => "유전공학연구소.반도체공동연구소", :stop_id => "33356", :property => "stop"}));
stops.push(Stop.create({:name => "에너지자원연구소", :stop_id => "34733", :property => "stop"}));
stops.push(Stop.create({:name => "공대입구", :stop_id => "33748", :property => "stop"}));
stops.push(Stop.create({:name => "농생대", :stop_id => "33749", :property => "stop"}));
stops.push(Stop.create({:name => "자연대.행정관입구", :stop_id => "33750", :property => "stop"}));
stops.push(Stop.create({:name => "서울대본부앞", :stop_id => "32870", :property => "stop"}));
stops.push(Stop.create({:name => "법대입구", :stop_id => "34043", :property => "stop"}));
stops.push(Stop.create({:name => "서울대정문", :stop_id => "34731", :property => "stop"}));
stops.push(Stop.create({:name => "신림중.삼성고.관악문화관도서관", :stop_id => "3449", :property => "stop"}));
stops.push(Stop.create({:name => "서울산업정보학교.삼성교", :stop_id => "3451", :property => "stop"}));
stops.push(Stop.create({:name => "신성초등학교", :stop_id => "3453", :property => "stop"}));
stops.push(Stop.create({:name => "국민은행신림동지점", :stop_id => "3455", :property => "stop"}));
stops.push(Stop.create({:name => "쑥고개입구", :stop_id => "3457", :property => "stop"}));
stops.push(Stop.create({:name => "서원동문화교앞", :stop_id => "3459", :property => "stop"}));
stops.push(Stop.create({:name => "신림사거리", :stop_id => "31124", :property => "stop"}));
stops.push(Stop.create({:name => "패션문화의거리입구", :stop_id => "3463", :property => "stop"}));
stops.push(Stop.create({:name => "롯데관악점", :stop_id => "4546", :property => "stop"}));
stops.push(Stop.create({:name => "서울특별시.보라매병원", :stop_id => "33039", :property => "stop"}));
stops.push(Stop.create({:name => "보라매삼성아파트.모자원고개", :stop_id => "9668", :property => "stop"}));
stops.push(Stop.create({:name => "신대방삼거리", :stop_id => "345", :property => "stop"}));
stops.push(Stop.create({:name => "성대시장", :stop_id => "340", :property => "stop"}));
stops.push(Stop.create({:name => "상도초등학교입구", :stop_id => "35385", :property => "stop"}));
stops.push(Stop.create({:name => "청화병원", :stop_id => "351", :property => "stop"}));
stops.push(Stop.create({:name => "동작구청.노량진초등학교앞", :stop_id => "349", :property => "stop"}));
stops.push(Stop.create({:name => "노량진역", :stop_id => "36741", :property => "stop"}));
stops.push(Stop.create({:name => "사육신공원", :stop_id => "36739", :property => "stop"}));
stops.push(Stop.create({:name => "노들역", :stop_id => "36742", :property => "stop"}));
stops.push(Stop.create({:name => "노들역", :stop_id => "36744", :property => "stop"}));
stops.push(Stop.create({:name => "사육신공원", :stop_id => "36738", :property => "stop"}));
stops.push(Stop.create({:name => "노량진역", :stop_id => "36740", :property => "stop"}));
stops.push(Stop.create({:name => "동작구청.노량진초등학교앞", :stop_id => "348", :property => "stop"}));
stops.push(Stop.create({:name => "장성교회", :stop_id => "350", :property => "stop"}));
stops.push(Stop.create({:name => "장승배기역", :stop_id => "343", :property => "stop"}));
stops.push(Stop.create({:name => "상도초등학교입구", :stop_id => "342", :property => "stop"}));
stops.push(Stop.create({:name => "성대시장", :stop_id => "339", :property => "stop"}));
stops.push(Stop.create({:name => "신대방삼거리", :stop_id => "344", :property => "stop"}));
stops.push(Stop.create({:name => "보라매병원입구", :stop_id => "347", :property => "stop"}));
stops.push(Stop.create({:name => "롯데백화점관악점", :stop_id => "352", :property => "stop"}));
stops.push(Stop.create({:name => "패션문화의거리입구", :stop_id => "3462", :property => "stop"}));
stops.push(Stop.create({:name => "신림사거리", :stop_id => "3460", :property => "stop"}));
stops.push(Stop.create({:name => "서원동문화교앞", :stop_id => "10429", :property => "stop"}));
stops.push(Stop.create({:name => "서림동주민센터.신화단지", :stop_id => "3456", :property => "stop"}));
stops.push(Stop.create({:name => "삼성동시장", :stop_id => "3454", :property => "stop"}));
stops.push(Stop.create({:name => "신림동고시촌입구", :stop_id => "3452", :property => "stop"}));
stops.push(Stop.create({:name => "서울산업정보학교.삼성교", :stop_id => "3450", :property => "stop"}));
stops.push(Stop.create({:name => "관악산입구.관악문화관도서관", :stop_id => "3448", :property => "stop"}));
stops.push(Stop.create({:name => "서울대학교", :stop_id => "34554", :property => "stop"}));
stops.push(Stop.create({:name => "서울대정문", :stop_id => "3446", :property => "stop"}));
stops.push(Stop.create({:name => "법대입구", :stop_id => "33353", :property => "stop"}));
stops.push(Stop.create({:name => "자연대.행정관입구", :stop_id => "34552", :property => "stop"}));
stops.push(Stop.create({:name => "농생대", :stop_id => "33352", :property => "stop"}));
stops.push(Stop.create({:name => "공대입구", :stop_id => "33351", :property => "stop"}));
stops.push(Stop.create({:name => "신소재", :stop_id => "33354", :property => "stop"}));
stops.push(Stop.create({:name => "건설환경종합연구소앞", :stop_id => "36960", :property => "stop"}));
stops.push(Stop.create({:name => "제2공학관", :stop_id => "33712", :property => "stop"}));
stops.push(Stop.create({:name => "제1공학관", :stop_id => "33711", :property => "stop"}));
stops.push(Stop.create({:name => "유전공학연구소.반도체공동연구소", :stop_id => "33355", :property => "stop"}));
stops.push(Stop.create({:name => "교수회관입구", :stop_id => "10459", :property => "stop"}));
stops.push(Stop.create({:name => "관악사삼거리", :stop_id => "10455", :property => "stop"}));
stops.push(Stop.create({:name => "국제대학원", :stop_id => "33709", :property => "stop"}));
stops.push(Stop.create({:name => "수의대입구.보건대학원앞", :stop_id => "36591", :property => "stop"}));
stops.push(Stop.create({:name => "경영대", :stop_id => "33707", :property => "stop"}));
stops.push(Stop.create({:name => "신림중.삼성고.관악문화관도서관", :stop_id => "3449", :property => "stop"}));
stops.push(Stop.create({:name => "서울산업정보학교.삼성교", :stop_id => "3451", :property => "stop"}));
stops.push(Stop.create({:name => "신림2동차고지", :stop_id => "36317", :property => "stop"}));

# Create edges.
edge_index = 0
i = 0
while i < sections.length
  if i > 0 && sections[i][:line] != sections[i - 1][:line]
    edge_index = 0
  end

  stop_index = 1
  while stop_index < sections[i][:stops].length
    edge = Edge.create({:line_id => sections[i][:line],
                 :edge_index => edge_index,
                 :from => sections[i][:stops][stop_index - 1][:stop_id],
                 :to => sections[i][:stops][stop_index][:stop_id],
                 :time => 120})

    edge_index += 1
    stop_index += 1
  end

  i += 1
end
