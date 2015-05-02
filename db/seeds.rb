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
sections.push({:line => "4551100", :stops => Array.new})
sections.push({:line => "4551300", :stops => Array.new})
sections.push({:line => "4551300", :stops => Array.new})
sections.push({:line => "4551600", :stops => Array.new})
sections.push({:line => "4551600", :stops => Array.new})

# 관악02
stops = sections[0][:stops]
stops.push(Stop.create({:name => "기숙사구관", :stop_id => "10556"}));
stops.push(Stop.create({:name => "기숙사삼거리", :stop_id => "10560"}));
stops.push(Stop.create({:name => "공동기기원", :stop_id => "10452"}));
stops.push(Stop.create({:name => "유전공학연구소.반도체공동연구소", :stop_id => "33356"}));
stops.push(Stop.create({:name => "에너지자원연구소", :stop_id => "34733"}));
stops.push(Stop.create({:name => "신소재", :stop_id => "33354"}));
stops.push(Stop.create({:name => "제2파워플랜트", :stop_id => "10565"}));
stops.push(Stop.create({:name => "건설환경종합연구소", :stop_id => "10567"}));
stops.push(Stop.create({:name => "제2공학관", :stop_id => "33712"}));
stops.push(Stop.create({:name => "제1공학관", :stop_id => "10214"}));
stops.push(Stop.create({:name => "유전공학연구소.반도체공동연구소", :stop_id => "33355"}));
stops.push(Stop.create({:name => "교수회관입구", :stop_id => "10459"}));
stops.push(Stop.create({:name => "기숙사삼거리", :stop_id => "10135"}));

# Going out 5511
stops = sections[1][:stops]
stops.push(Stop.create({:name => "제2공학관", :stop_id => "33712"}));
stops.push(Stop.create({:name => "제1공학관", :stop_id => "33711"}));
stops.push(Stop.create({:name => "에너지자원연구소", :stop_id => "34733"}));
stops.push(Stop.create({:name => "공대입구", :stop_id => "33748"}));
stops.push(Stop.create({:name => "농생대", :stop_id => "33749"}));
stops.push(Stop.create({:name => "자연대.행정관입구", :stop_id => "33750"}));
stops.push(Stop.create({:name => "문화관입구", :stop_id => 34732}));
stops.push(Stop.create({:name => "법대입구", :stop_id => "34043"}));
stops.push(Stop.create({:name => "서울대정문", :stop_id => "34731"}));
stops.push(Stop.create({:name => "서울대학교", :stop_id => "3447"}));

# Coming 5511
stops = sections[2][:stops]
stops.push(Stop.create({:name => "서울여상.서울문영여중고앞", :stop_id => "3721"}));
stops.push(Stop.create({:name => "서울대학교", :stop_id => "34554"}));
stops.push(Stop.create({:name => "경영대", :stop_id => "33753"}));
stops.push(Stop.create({:name => "수의대입구.보건대학원앞", :stop_id => "34741"}));
stops.push(Stop.create({:name => "국제대학원", :stop_id => "33744"}));
stops.push(Stop.create({:name => "관악사삼거리", :stop_id => "10456"}));
stops.push(Stop.create({:name => "공동기기원", :stop_id => "10452"}));
stops.push(Stop.create({:name => "유전공학연구소.반도체공동연구소", :stop_id => "33356"}));
stops.push(Stop.create({:name => "에너지자원연구소", :stop_id => "34733"}));
stops.push(Stop.create({:name => "신소재", :stop_id => "33354"}));
stops.push(Stop.create({:name => "건설환경종합연구소앞", :stop_id => "36960"}));
stops.push(Stop.create({:name => "제2공학관", :stop_id => "35864"}));

# Going out 5513
stops = sections[3][:stops]
stops.push(Stop.create({:name => "제2공학관", :stop_id => "33712"}));
stops.push(Stop.create({:name => "제1공학관", :stop_id => "33711"}));
stops.push(Stop.create({:name => "유전공학연구소.반도체공동연구소", :stop_id => "33355"}));
stops.push(Stop.create({:name => "교수회관입구", :stop_id => "10459"}));
stops.push(Stop.create({:name => "관악사삼거리", :stop_id => "10455"}));
stops.push(Stop.create({:name => "국제대학원", :stop_id => "33709"}));
stops.push(Stop.create({:name => "수의대입구.보건대학원앞", :stop_id => "36591"}));
stops.push(Stop.create({:name => "경영대", :stop_id => "33707"}));
stops.push(Stop.create({:name => "서울대학교", :stop_id => "3447"}));

# Coming 5513
stops = sections[4][:stops]
stops.push(Stop.create({:name => "서울여상.서울문영여중고앞", :stop_id => "3721"}));
stops.push(Stop.create({:name => "서울대학교", :stop_id => "34554"}));
stops.push(Stop.create({:name => "서울대정문", :stop_id => "3446"}));
stops.push(Stop.create({:name => "법대입구", :stop_id => "33353"}));
stops.push(Stop.create({:name => "자연대.행정관입구", :stop_id => "34552"}));
stops.push(Stop.create({:name => "농생대", :stop_id => "33352"}));
stops.push(Stop.create({:name => "공대입구", :stop_id => "33351"}));
stops.push(Stop.create({:name => "신소재", :stop_id => "33354"}));
stops.push(Stop.create({:name => "건설환경종합연구소앞", :stop_id => "36960"}));
stops.push(Stop.create({:name => "제2공학관", :stop_id => "35864"}));

# Clockwise 5516
stops = sections[5][:stops]
stops.push(Stop.create({:name => "관악산입구.관악문화관도서관", :stop_id => "3448"}));
stops.push(Stop.create({:name => "서울대학교", :stop_id => "34554"}));
stops.push(Stop.create({:name => "서울대정문", :stop_id => "3446"}));
stops.push(Stop.create({:name => "경영대", :stop_id => "33753"}));
stops.push(Stop.create({:name => "수의대입구.보건대학원앞", :stop_id => "34741"}));
stops.push(Stop.create({:name => "국제대학원", :stop_id => "33744"}));
stops.push(Stop.create({:name => "관악사삼거리", :stop_id => "10456"}));
stops.push(Stop.create({:name => "공동기기원", :stop_id => "10452"}));
stops.push(Stop.create({:name => "유전공학연구소.반도체공동연구소", :stop_id => "33356"}));
stops.push(Stop.create({:name => "에너지자원연구소", :stop_id => "34733"}));
stops.push(Stop.create({:name => "공대입구", :stop_id => "33748"}));
stops.push(Stop.create({:name => "농생대", :stop_id => "33749"}));
stops.push(Stop.create({:name => "자연대.행정관입구", :stop_id => "33750"}));
stops.push(Stop.create({:name => "서울대본부앞", :stop_id => "32870"}));
stops.push(Stop.create({:name => "법대입구", :stop_id => "34043"}));
stops.push(Stop.create({:name => "서울대정문", :stop_id => "34731"}));

# Counterclockwise 5516
stops = sections[6][:stops]
stops.push(Stop.create({:name => "관악산입구.관악문화관도서관", :stop_id => "3448"}));
stops.push(Stop.create({:name => "서울대학교", :stop_id => "34554"}));
stops.push(Stop.create({:name => "서울대정문", :stop_id => "3446"}));
stops.push(Stop.create({:name => "법대입구", :stop_id => "33353"}));
stops.push(Stop.create({:name => "자연대.행정관입구", :stop_id => "34552"}));
stops.push(Stop.create({:name => "농생대", :stop_id => "33352"}));
stops.push(Stop.create({:name => "공대입구", :stop_id => "33351"}));
stops.push(Stop.create({:name => "신소재", :stop_id => "33354"}));
stops.push(Stop.create({:name => "건설환경종합연구소앞", :stop_id => "36960"}));
stops.push(Stop.create({:name => "제2공학관", :stop_id => "33712"}));
stops.push(Stop.create({:name => "제1공학관", :stop_id => "33711"}));
stops.push(Stop.create({:name => "유전공학연구소.반도체공동연구소", :stop_id => "33355"}));
stops.push(Stop.create({:name => "교수회관입구", :stop_id => "10459"}));
stops.push(Stop.create({:name => "관악사삼거리", :stop_id => "10455"}));
stops.push(Stop.create({:name => "국제대학원", :stop_id => "33709"}));
stops.push(Stop.create({:name => "수의대입구.보건대학원앞", :stop_id => "36591"}));
stops.push(Stop.create({:name => "경영대", :stop_id => "33707"}));

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
