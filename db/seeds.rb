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

# Stops
# 관악02
Stop.create({:name => "기숙사삼거리", :stop_id => "21899"});
Stop.create({:name => "공동기기원", :stop_id => "21288"});
Stop.create({:name => "유전공학연구소.반도체공동연구소", :stop_id => "21289"});
Stop.create({:name => "에너지자원연구소", :stop_id => "21290"});
Stop.create({:name => "신소재", :stop_id => "21274"});
Stop.create({:name => "제2파워플랜트", :stop_id => "21904"});
Stop.create({:name => "건설환경종합연구소", :stop_id => "21905"});
Stop.create({:name => "제2공학관", :stop_id => "21275"});
Stop.create({:name => "제1공학관", :stop_id => "21516"});
Stop.create({:name => "유전공학연구소.반도체공동연구소", :stop_id => "21277"});
Stop.create({:name => "교수회관입구", :stop_id => "21278"});
Stop.create({:name => "기숙사삼거리", :stop_id => "21554"});
# 5511
Stop.create({:name => "제2공학관", :stop_id => "21275"});
Stop.create({:name => "제1공학관", :stop_id => "21276"});
Stop.create({:name => "에너지자원연구소", :stop_id => "21290"});
Stop.create({:name => "공대입구", :stop_id => "21292"});
Stop.create({:name => "농생대", :stop_id => "21293"});
Stop.create({:name => "자연대.행정관입구", :stop_id => "21294"});
Stop.create({:name => "문화관입구", :stop_id => "21297"});
Stop.create({:name => "법대입구", :stop_id => "21298"});
Stop.create({:name => "서울대정문", :stop_id => "21299"});
Stop.create({:name => "서울대학교", :stop_id => "21128"});
Stop.create({:name => "서울대학교", :stop_id => "21127"});
Stop.create({:name => "경영대", :stop_id => "21283"});
Stop.create({:name => "수의대입구.보건대학원앞", :stop_id => "21284"});
Stop.create({:name => "국제대학원", :stop_id => "21285"});
Stop.create({:name => "관악사삼거리", :stop_id => "21286"});
Stop.create({:name => "공동기기원", :stop_id => "21288"});
Stop.create({:name => "유전공학연구소.반도체공동연구소", :stop_id => "21289"});
Stop.create({:name => "에너지자원연구소", :stop_id => "21290"});
Stop.create({:name => "신소재", :stop_id => "21274"});
Stop.create({:name => "건설환경종합연구소앞", :stop_id => "21341"});
Stop.create({:name => "제2공학관", :stop_id => "21340"});
# 5513
Stop.create({:name => "제2공학관", :stop_id => "21275"});
Stop.create({:name => "제1공학관", :stop_id => "21276"});
Stop.create({:name => "유전공학연구소.반도체공동연구소", :stop_id => "21277"});
Stop.create({:name => "교수회관입구", :stop_id => "21278"});
Stop.create({:name => "관악사삼거리", :stop_id => "21279"});
Stop.create({:name => "국제대학원", :stop_id => "21280"});
Stop.create({:name => "수의대입구.보건대학원앞", :stop_id => "21281"});
Stop.create({:name => "경영대", :stop_id => "21282"});
Stop.create({:name => "서울대학교", :stop_id => "21128"});
Stop.create({:name => "서울대학교", :stop_id => "21127"});
Stop.create({:name => "서울대정문", :stop_id => "21269"});
Stop.create({:name => "법대입구", :stop_id => "21270"});
Stop.create({:name => "자연대.행정관입구", :stop_id => "21271"});
Stop.create({:name => "농생대", :stop_id => "21272"});
Stop.create({:name => "공대입구", :stop_id => "21273"});
Stop.create({:name => "신소재", :stop_id => "21274"});
Stop.create({:name => "건설환경종합연구소앞", :stop_id => "21341"});
Stop.create({:name => "제2공학관", :stop_id => "21340"});
# 5516
Stop.create({:name => "서울대학교", :stop_id => "21127"});
Stop.create({:name => "서울대정문", :stop_id => "21269"});
Stop.create({:name => "경영대", :stop_id => "21283"});
Stop.create({:name => "수의대입구.보건대학원앞", :stop_id => "21284"});
Stop.create({:name => "국제대학원", :stop_id => "21285"});
Stop.create({:name => "관악사삼거리", :stop_id => "21286"});
Stop.create({:name => "공동기기원", :stop_id => "21288"});
Stop.create({:name => "유전공학연구소.반도체공동연구소", :stop_id => "21289"});
Stop.create({:name => "에너지자원연구소", :stop_id => "21290"});
Stop.create({:name => "공대입구", :stop_id => "21292"});
Stop.create({:name => "농생대", :stop_id => "21293"});
Stop.create({:name => "자연대.행정관입구", :stop_id => "21294"});
Stop.create({:name => "서울대본부앞", :stop_id => "21295"});
Stop.create({:name => "법대입구", :stop_id => "21298"});
Stop.create({:name => "서울대정문", :stop_id => "21299"});
Stop.create({:name => "서울대학교", :stop_id => "21127"});
Stop.create({:name => "서울대정문", :stop_id => "21269"});
Stop.create({:name => "법대입구", :stop_id => "21270"});
Stop.create({:name => "자연대.행정관입구", :stop_id => "21271"});
Stop.create({:name => "농생대", :stop_id => "21272"});
Stop.create({:name => "공대입구", :stop_id => "21273"});
Stop.create({:name => "신소재", :stop_id => "21274"});
Stop.create({:name => "건설환경종합연구소앞", :stop_id => "21341"});
Stop.create({:name => "제2공학관", :stop_id => "21275"});
Stop.create({:name => "제1공학관", :stop_id => "21276"});
Stop.create({:name => "유전공학연구소.반도체공동연구소", :stop_id => "21277"});
Stop.create({:name => "교수회관입구", :stop_id => "21278"});
Stop.create({:name => "관악사삼거리", :stop_id => "21279"});
Stop.create({:name => "국제대학원", :stop_id => "21280"});
Stop.create({:name => "수의대입구.보건대학원앞", :stop_id => "21281"});
Stop.create({:name => "경영대", :stop_id => "21282"});

=begin
제 2 공학관 33712(발) 35864(착)
기숙사 삼거리 10135(내려가는) 10560(올라가는)
관악사 삼거리 10455(내려가는) 10456(올라가는)
농생대 입구 33749(내려가는) 33352(올라가는)
서울대학교 정문 34731(나가는) 3446(들어오는)
서울대학교 3447(나가는) 34554(들어오는)
=end

#관악02
Edge.create({:line_id => "3920400", :edge_index => 0, :from => "33712", :to => "10135", :time => 360})
Edge.create({:line_id => "3920400", :edge_index => 1, :from => "10560", :to => "33712", :time => 360})

#5511
Edge.create({:line_id => "4551100", :edge_index => 0, :from => "33712", :to => "33749", :time => 180})
Edge.create({:line_id => "4551100", :edge_index => 1, :from => "33749", :to => "3447", :time => 240})
Edge.create({:line_id => "4551100", :edge_index => 2, :from => "34554", :to => "10456", :time => 360})
Edge.create({:line_id => "4551100", :edge_index => 3, :from => "10456", :to => "35864", :time => 420})

#5513
Edge.create({:line_id => "4551300", :edge_index => 0, :from => "33712", :to => "10455", :time => 180})
Edge.create({:line_id => "4551300", :edge_index => 1, :from => "10455", :to => "3447", :time => 300})
Edge.create({:line_id => "4551300", :edge_index => 2, :from => "34554", :to => "33352", :time => 300})
Edge.create({:line_id => "4551300", :edge_index => 3, :from => "33352", :to => "35864", :time => 240})

#5516
Edge.create({:line_id => "4551600", :edge_index => 0, :from => "34554", :to => "10456", :time => 300})
Edge.create({:line_id => "4551600", :edge_index => 1, :from => "10456", :to => "33749", :time => 300})
Edge.create({:line_id => "4551600", :edge_index => 2, :from => "33749", :to => "34731", :time => 300})
Edge.create({:line_id => "4551600", :edge_index => 3, :from => "34554", :to => "33352", :time => 240})
Edge.create({:line_id => "4551600", :edge_index => 4, :from => "33352", :to => "33712", :time => 300})
Edge.create({:line_id => "4551600", :edge_index => 5, :from => "33712", :to => "10455", :time => 240})
