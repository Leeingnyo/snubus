$(function (){
  /*
    정류장의 위치 정보 필요
  */
  var stop_locations = {
    //관악02
    "10560": {"top": 15, "left": 42}, //기숙사삼거리(상)
    "10452": {"top": 12, "left": 62}, //공동기기원
    "33356": {"top": 13, "left": 73}, //유전공학연구소,반도체공동연구소(상)
    "34733": {"top": 21, "left": 72}, //에너지자원연구소
    "33354": {"top": 32, "left": 76}, //신소재
    "10565": {"top": 25, "left": 87}, //제2파워플랜트
    "10567": {"top": 12, "left": 95}, //건설환경종합연구소
    "33712": {"top": 9, "left": 87}, //제2공학관(발)
    "10214": {"top": 12, "left": 81}, //제1공학관
    "33355": {"top": 11, "left": 70}, //유전공학연구소,반도체공동연구소(하)
    "10459": {"top": 9, "left": 57}, //교수회관입구
    "10135": {"top": 13, "left": 39}, //기숙사삼거리(하)

    //5511 Going out
    "33712": {"top": 9, "left": 87}, //제2공학관(발)
    "33711": {"top": 13, "left": 82}, //제1공학관
    "34733": {"top": 21, "left": 72}, //에너지자원연구소
    "33748": {"top": 39, "left": 67}, //공대입구(하)
    "33749": {"top": 50, "left": 60}, //농생대(하)
    "33750": {"top": 61, "left": 49}, //자연대.행정관입구(하)
    "34732": {"top": 65, "left": 43}, //문화관입구
    "34043": {"top": 73, "left": 34}, //법대입구(하)
    "34731": {"top": 87, "left": 25}, //서울대정문(하)
    "3447": {"top": 92, "left": 17}, //서울대학교(하)

    //5511 Comming
    "34554": {"top": 95, "left": 19}, //서울대학교(상)
    "33753": {"top": 60, "left": 20}, //경영대(상)
    "34741": {"top": 43, "left": 18}, //수의대입구.보건대학원앞(상)
    "33744": {"top": 34, "left": 30}, //국제대학원(상)
    "10456": {"top": 21, "left": 39}, //관악사삼거리(상)
    "10452": {"top": 12, "left": 62}, //공동기기원
    "33356": {"top": 13, "left": 73}, //유전공학연구소.반도체공동연구소(상)
    "34733": {"top": 21, "left": 72}, //에너지자원연구소
    "33354": {"top": 32, "left": 76}, //신소재
    "36960": {"top": 14, "left": 93}, //건설환경종합연구소앞
    "35864": {"top": 8, "left": 90}, //제2공학관(착)

    //5513 Going out
    "33712": {"top": 9, "left": 87}, //제2공학관(발)
    "33711": {"top": 13, "left": 82}, //제1공학관
    "33355": {"top": 11, "left": 70}, //유전공학연구소,반도체공동연구소(하)
    "10459": {"top": 9, "left": 57}, //교수회관입구
    "10455": {"top": 16, "left": 37}, //관악사삼거리(하)
    "33709": {"top": 32, "left": 27}, //국제대학원(하)
    "36591": {"top": 51, "left": 17}, //수의대입구.보건대학원앞(하)
    "33707": {"top": 65, "left": 19}, //경영대(하)
    "3447": {"top": 92, "left": 17}, //서울대학교(하)

    //5513 Coming
    "34554": {"top": 95, "left": 19}, //서울대학교(상)
    "3446": {"top": 88, "left": 23}, //서울대정문(상)
    "33353": {"top": 75, "left": 35}, //법대입구(상)
    "34552": {"top": 66, "left": 48}, //자연대.행정관입구(상)
    "33352": {"top": 56, "left": 59}, //농생대(상)
    "33351": {"top": 41, "left": 69}, //공대입구(상)
    "33354": {"top": 32, "left": 76}, //신소재
    "36960": {"top": 14, "left": 93}, //건설환경종합연구소앞
    "35864": {"top": 8, "left": 90}, //제2공학관(착)

    //5516 Clockwise
    "32870": {"top": 59, "left": 44}, //서울대본부앞
  };
  $(".stops").each(function (){
    if (!stop_locations[$(this).val()]) {
      $(this).hide();
      return;
    }

    $(this).css("top", stop_locations[$(this).val()].top + "%");
    $(this).css("left", stop_locations[$(this).val()].left + "%");
  })
  $("#stop-controller").css("display")
  $("#map img").click(function (){
    $("#stop-controller").hide();
  });
  $(".stops").click(function (){
    $("#selected-stop-id").val($(this).val());
    $("#selected-stop-name").html($(this).data("stop"));
    $("header").outerHeight()
    /* 위치 지정 필요 */
    $("#stop-controller").css("top",
      parseInt($("header").outerHeight(true)) + parseInt($(this).css("top"))
        + (parseInt($(this).css("top")) < 410 ? 60 : -100)
    );
    $("#stop-controller").css("left",
      Math.min(910,
        Math.max(parseInt($("#map").css("margin-left")) + parseInt($(this).css("left")) - 115, 10) )
    );
    $("#stop-controller").show();
  });
  $("#show-stop-info").click(function (){
    location.href = "/stops/" + $("#selected-stop-id").val();
  });
  $("#set-departure").click(function (){
    $("input[name=departure]").val($("#selected-stop-id").val());
    $("input[name=departure-name]").val($("#selected-stop-name").html());
    $("#stop-controller").hide();
  });
  $("#set-destination").click(function (){
    $("input[name=destination]").val($("#selected-stop-id").val());
    $("input[name=destination-name]").val($("#selected-stop-name").html());
    $("#stop-controller").hide();
  });
  $.ajax({
    url : '/AllBuses'
    ,type : 'POST'
    ,contentType  : 'application/json; charset=utf-8'
    ,dataType : 'json'
    ,success  : function(data){
      for (var key in data){
        data[key].forEach(function (bus_info, index){
          var bus = $('<div class="buses '+ key +'">'+ key +'</div>');
          rate = 1 - (bus_info.remaining_time / bus_info.edge_time);
          $(bus).css("top", (stop_locations[bus_info.from].top
            + (stop_locations[bus_info.to].top - stop_locations[bus_info.from].top) * rate) + "%")
          $(bus).css("left", (stop_locations[bus_info.from].left
            + (stop_locations[bus_info.to].left - stop_locations[bus_info.from].left) * rate) + "%");
          $("#buses-wrapper").append(bus);
        })
      }
    }
    ,error  : function(request, status, error){
      console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    }
  })
  $(".line-checked").change(function (){
    if (this.checked)
      $("." + $(this).val()).show();
    else
      $("." + $(this).val()).hide();
  })
})
