$(function() {
  lastRoutes = JSON.parse(localStorage.getItem("lastRoutes"));
  if (!lastRoutes) {
    return;
  }
  numRoutes = lastRoutes.length;

  $(".last-route").each(function(formIndex) {
    if (formIndex >= numRoutes) {
      $(this).hide();
      return;
    }

    route = lastRoutes[numRoutes - formIndex - 1];
    $(this).find("input[name=departure-name]").val(route.from.name);
    $(this).find("input[name=departure]").val(route.from.id);
    $(this).find("input[name=destination-name]").val(route.to.name);
    $(this).find("input[name=destination]").val(route.to.id);
  });
})
