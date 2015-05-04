$(function (){
  /*
    정류장의 위치 정보 필요
  */
  var stop_locations = {
    //관악02
    "10560": {"top": 13.5, "left": 42.5}, //기숙사삼거리(상)
    "10452": {"top": 14, "left": 65}, //공동기기원 (상)
    "33356": {"top": 13, "left": 73}, //유전공학연구소,반도체공동연구소(상)
    "34733": {"top": 21, "left": 72}, //에너지자원연구소
    "33354": {"top": 30, "left": 81}, //신소재
    "10565": {"top": 23, "left": 86}, //제2파워플랜트
    "10567": {"top": 12, "left": 95}, //건설환경종합연구소
    "33712": {"top": 9, "left": 87}, //제2공학관(발)
    "10214": {"top": 12, "left": 81}, //제1공학관
    "33355": {"top": 11, "left": 71}, //유전공학연구소,반도체공동연구소(하)
    "10459": {"top": 11, "left": 67}, //교수회관입구
    "10135": {"top": 14.5, "left": 39.5}, //기숙사삼거리(하)
    "35864": {"top": 8, "left": 90}, //제 2 공학관(착)
    //"제 1 공학관": {"top": 12, "left": 81},
    "10560": {"top": 13.5, "left": 42.5}, //기숙사 삼거리(상)
    "10135": {"top": 14.5, "left": 39.5}, //기숙사 삼거리(하)
    "10456": {"top": 14, "left": 42}, //관악사 삼거리(상)
    "10455": {"top": 15, "left": 39}, //관악사 삼거리(하)
    //"행정관 입구": {"top": 60, "left": 50},
    "33352": {"top": 56, "left": 59}, //농생대 입구(상)
    "33749": {"top": 49, "left": 61}, //농생대 입구(하)
    "3446": {"top": 80, "left": 25}, //서울대학교 정문(상)
    "34731": {"top": 83, "left": 23}, //서울대학교 정문(하)
    "34554": {"top": 87, "left": 16}, //서울대학교(상)
    "3447": {"top": 92, "left": 17} //서울대학교(하)
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
