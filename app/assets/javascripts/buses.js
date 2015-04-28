$(function (){
  /*
    정류장의 위치 정보 필요
  */
  var stop_locations = {
    "33712": {"top": 9, "left": 87}, //제 2 공학관(발)
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
      console.log(data)
      for (var key in data){
        for (var bus_info of data[key]){
          console.log()
          var bus = $('<div class="buses '+ key +'">'+ key +'</div>');
          console.log(bus_info.from);
          rate = 1 - (bus_info.remaining_time / bus_info.edge_time);
          $(bus).css("top", (stop_locations[bus_info.from].top
            + (stop_locations[bus_info.to].top - stop_locations[bus_info.from].top) * rate) + "%")
          $(bus).css("left", (stop_locations[bus_info.from].left
            + (stop_locations[bus_info.to].left - stop_locations[bus_info.from].left) * rate) + "%");
          $("#buses-wrapper").append(bus);
        }
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
