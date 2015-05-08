$(function() {
  lastRoutes = JSON.parse(localStorage.getItem("lastRoutes"));
  if (!lastRoutes) {
    return;
  }

  formIndex = 0;
  for (i = lastRoutes.length - 1; i >= 0; --i) {
    $("#last-routes-" + formIndex + " > input[name=departure-name]").val(lastRoutes[i].from.name);
    $("#last-routes-" + formIndex + " > input[name=departure]").val(lastRoutes[i].from.id);
    $("#last-routes-" + formIndex + " > input[name=destination-name]").val(lastRoutes[i].to.name);
    $("#last-routes-" + formIndex + " > input[name=destination]").val(lastRoutes[i].to.id);

    formIndex++;
  }
})
