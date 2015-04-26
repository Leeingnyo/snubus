# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Line.create({:name => "관악02", :line_id => "3920400"});
Line.create({:name => "5511", :line_id => "4551100"});
Line.create({:name => "5513", :line_id => "4551300"});
Line.create({:name => "5516", :line_id => "4551600"});

Stop.create({:name => "제 2 공학관(발)", :stop_id => "33712"});
Stop.create({:name => "제 2 공학관(착)", :stop_id => "35864"});
Stop.create({:name => "기숙사 삼거리(상)", :stop_id => "10560"});
Stop.create({:name => "기숙사 삼거리(하)", :stop_id => "10135"});
Stop.create({:name => "관악사 삼거리(상)", :stop_id => "10456"});
Stop.create({:name => "관악사 삼거리(하)", :stop_id => "10455"});
Stop.create({:name => "농생대 입구(상)", :stop_id => "33352"});
Stop.create({:name => "농생대 입구(하)", :stop_id => "33749"});
Stop.create({:name => "서울대학교 정문(상)", :stop_id => "3446"});
Stop.create({:name => "서울대학교 정문(하)", :stop_id => "34731"});
Stop.create({:name => "서울대학교(상)", :stop_id => "34554"});
Stop.create({:name => "서울대학교(하)", :stop_id => "3447"});

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
