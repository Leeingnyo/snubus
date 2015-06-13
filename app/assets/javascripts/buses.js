$(function (){
  /*
    정류장의 위치 정보 필요
  */
  var stop_locations = {
    //관악02
    "10541": {"top": 23, "left": 27, "direction": 0}, //서울대후문,연구공원
    "10548": {"top": 21, "left": 31, "direction": 1}, //기숙사신관(상)
    "10556": {"top": 21, "left": 34, "direction": 1}, //기숙사구관(상)
    "10560": {"top": 18, "left": 41, "direction": 1}, //기숙사삼거리(상)
    "21915": {"top": 22, "left": 46, "direction": 1}, //노천강당(상)
    "10452": {"top": 12, "left": 62, "direction": 0}, //공동기기원
    "33356": {"top": 13, "left": 73, "direction": 1}, //유전공학연구소,반도체공동연구소(상)
    "34733": {"top": 21, "left": 72, "direction": 0}, //에너지자원연구소
    "33354": {"top": 32, "left": 76, "direction": 0}, //신소재
    "10565": {"top": 25, "left": 87, "direction": 0}, //제2파워플랜트
    "10567": {"top": 12, "left": 95, "direction": 0}, //건설환경종합연구소
    "33712": {"top": 9, "left": 87, "direction": -1}, //제2공학관(발)
    "10214": {"top": 12, "left": 81, "direction": 0}, //제1공학관
    "33355": {"top": 11, "left": 70, "direction": -1}, //유전공학연구소,반도체공동연구소(하)
    "10459": {"top": 9, "left": 57, "direction": 0}, //교수회관입구
    "21916": {"top": 20, "left": 48, "direction": -1}, //노천강당(하)
    "10135": {"top": 14, "left": 39, "direction": -1}, //기숙사삼거리(하)
    "10117": {"top": 15, "left": 33, "direction": -1}, //기숙사구관(하)
    "12709": {"top": 16, "left": 29, "direction": -1}, //기숙사신관(하)

    //5511 Going out
    "33712": {"top": 9, "left": 87, "direction": -1}, //제2공학관(발)
    "33711": {"top": 13, "left": 82, "direction": 0}, //제1공학관
    "34733": {"top": 21, "left": 72, "direction": 0}, //에너지자원연구소
    "33748": {"top": 39, "left": 67, "direction": -1}, //공대입구(하)
    "33749": {"top": 50, "left": 60, "direction": -1}, //농생대(하)
    "33750": {"top": 61, "left": 49, "direction": -1}, //자연대.행정관입구(하)
    "34732": {"top": 65, "left": 43, "direction": 0}, //문화관입구
    "34043": {"top": 73, "left": 34, "direction": -1}, //법대입구(하)
    "34731": {"top": 87, "left": 25, "direction": -1}, //서울대정문(하)
    "3447": {"top": 92, "left": 17, "direction": -1}, //서울대학교(하)

    //5511 Comming
    "34554": {"top": 95, "left": 19, "direction": 1}, //서울대학교(상)
    "33753": {"top": 60, "left": 20, "direction": 1}, //경영대(상)
    "34741": {"top": 43, "left": 18, "direction": 1}, //수의대입구.보건대학원앞(상)
    "33744": {"top": 34, "left": 30, "direction": 1}, //국제대학원(상)
    "10456": {"top": 21, "left": 39, "direction": 1}, //관악사삼거리(상)
    "10452": {"top": 12, "left": 62, "direction": 0}, //공동기기원
    "33356": {"top": 13, "left": 73, "direction": 1}, //유전공학연구소.반도체공동연구소(상)
    "34733": {"top": 21, "left": 72, "direction": 0}, //에너지자원연구소
    "33354": {"top": 32, "left": 76, "direction": 0}, //신소재
    "36960": {"top": 14, "left": 93, "direction": 0}, //건설환경종합연구소앞
    "35864": {"top": 8, "left": 90, "direction": 1}, //제2공학관(착)

    //5513 Going out
    "33712": {"top": 9, "left": 87, "direction": -1}, //제2공학관(발)
    "33711": {"top": 13, "left": 82, "direction": -1}, //제1공학관
    "33355": {"top": 11, "left": 70, "direction": -1}, //유전공학연구소,반도체공동연구소(하)
    "10459": {"top": 9, "left": 57, "direction": 0}, //교수회관입구
    "10455": {"top": 16, "left": 37, "direction": -1}, //관악사삼거리(하)
    "33709": {"top": 32, "left": 27, "direction": -1}, //국제대학원(하)
    "36591": {"top": 51, "left": 17, "direction": -1}, //수의대입구.보건대학원앞(하)
    "33707": {"top": 65, "left": 19, "direction": -1}, //경영대(하)
    "3447": {"top": 92, "left": 17, "direction": -1}, //서울대학교(하)

    //5513 Coming
    "34554": {"top": 95, "left": 19, "direction": 1}, //서울대학교(상)
    "3446": {"top": 88, "left": 23, "direction": 1}, //서울대정문(상)
    "33353": {"top": 75, "left": 35, "direction": 1}, //법대입구(상)
    "34552": {"top": 66, "left": 48, "direction": 1}, //자연대.행정관입구(상)
    "33352": {"top": 56, "left": 59, "direction": 1}, //농생대(상)
    "33351": {"top": 41, "left": 69, "direction": 1}, //공대입구(상)
    "33354": {"top": 32, "left": 76, "direction": 0}, //신소재
    "36960": {"top": 14, "left": 93, "direction": 0}, //건설환경종합연구소앞
    "35864": {"top": 8, "left": 90, "direction": 1}, //제2공학관(착)

    //5516 Clockwise
    "32870": {"top": 59, "left": 44, "direction": 0}, //서울대본부앞

    //Spot
    "1000000": {"top": 50, "left": 51, "direction": 0}, //학생회관
    "1000001": {"top": 28, "left": 64, "direction": 0}, //공대신양학술정보관
    "1000002": {"top": 38, "left": 41, "direction": 0}, //인문대신양학술정보관
    "1000003": {"top": 60, "left": 30, "direction": 0}, //멀티미디어강의동
  };
  $(".stops").each(function (){
    if (!stop_locations[$(this).val()]) {
      $(this).hide();
      return;
    }

    $(this).css("top", stop_locations[$(this).val()].top + "%");
    $(this).css("left", stop_locations[$(this).val()].left + "%");
    if (stop_locations[$(this).val()].direction > 0)
      $(this).addClass("up");
    if (stop_locations[$(this).val()].direction < 0)
      $(this).addClass("down");
  })
  $("#stop-controller").css("display")
  $("#map img").click(function (){
    $("#stop-controller").hide();
    $("#stop-controller").removeClass("station");
    $("#stop-controller").removeClass("spot");
  });
  $(".stops").click(function (){
    $("#selected-stop-id").val($(this).val());
    var stopname = $(this).data("stop");
    if ($(this).hasClass("up"))
      stopname += " (상)";
    if ($(this).hasClass("down"))
      stopname += " (하)";
    $("#selected-stop-name").html(stopname);
    $("#stop-controller").removeClass("station");
    $("#stop-controller").removeClass("spot");
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
  $(".stations").click(function (){
    $("#selected-stop-id").val($(this).val());
    $("#selected-stop-name").html($(this).data("stop"));
    $("#stop-controller").removeClass("spot");
    $("#stop-controller").addClass("station");
    $("#stop-controller").css("top", "auto");
    $("#stop-controller").css("left", 120);
    $("#stop-controller").css("bottom", 70);
    //$("#stop-controller").css("bottom", $(this).index() * -30 + 130 + parseInt($("#stations-wrapper").css("bottom")));
    $("#stop-controller").show();
  });
  $(".spots").click(function (){
    $("#selected-stop-id").val($(this).val());
    $("#selected-stop-name").html($(this).data("stop"));
    $("#stop-controller").css("left",
      Math.min(910,
        Math.max(parseInt($("#map").css("margin-left")) + parseInt($(this).css("left")) - 90, 10) )
    );
    $("#stop-controller").addClass("spot");
  });
  $("#show-stop-info").click(function (){
    location.href = "/stops/" + $("#selected-stop-id").val();
  });
  $(".set-departure").click(function (){
    $("input[name=departure]").val($("#selected-stop-id").val());
    $("input[name=departure-name]").val($("#selected-stop-name").html());
    $("#stop-controller").hide();
  });
  $(".set-destination").click(function (){
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
          if (!stop_locations[bus_info.from] || !stop_locations[bus_info.to]) {
            return;
          }
          var bus = $('<div class="buses '+ key +'">'+ key +'</div>');
          rate = Math.min(1, Math.max(0, 1 - (bus_info.remaining_time / bus_info.edge_time)));
          $(bus).css("top", (stop_locations[bus_info.from].top
            + (stop_locations[bus_info.to].top - stop_locations[bus_info.from].top) * rate) + "%")
          $(bus).css("left", (stop_locations[bus_info.from].left
            + (stop_locations[bus_info.to].left - stop_locations[bus_info.from].left) * rate) + "%");
          if (stop_locations[bus_info.from].left > stop_locations[bus_info.to].left)
            $(bus).addClass("bus-left");
          else
            $(bus).addClass("bus-right");
          if (bus_info.from === "10455" || bus_info.to === "10456"){
            rate = 0.5;
            $(bus).css("top", (5 / ((30 + 8 * rate) - 38) + 33) + "%");
            $(bus).css("left", (30 + 8 * rate) + "%");
          }
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

  $("#search").click(function() {
    if (!($("input[name=departure]").val() &&
          $("input[name=departure-name]").val() &&
          $("input[name=destination]").val() &&
          $("input[name=destination-name]").val()))
      return;

    lastRoutes = JSON.parse(localStorage.getItem("lastRoutes"));
    if (!lastRoutes) {
      lastRoutes = new Array
    }

    newRoute = {
      from: {
        id: $("input[name=departure]").val(),
        name: $("input[name=departure-name]").val()
      },
      to: {
        id: $("input[name=destination]").val(),
        name: $("input[name=destination-name]").val()
      }
    };

    for (i = 0; i < lastRoutes.length; ++i) {
      if (lastRoutes[i].from.id == newRoute.from.id &&
          lastRoutes[i].to.id == newRoute.to.id) {
        lastRoutes.splice(i, 1);
        break;
      }
    }

    if (lastRoutes.push(newRoute) > 5) {
      lastRoutes.shift();
    }

    localStorage.setItem("lastRoutes", JSON.stringify(lastRoutes));
  });
})
