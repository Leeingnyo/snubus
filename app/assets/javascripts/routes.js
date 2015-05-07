$(function() {
  lastRoutes = JSON.parse(localStorage.getItem("lastRoutes"));
  if (!lastRoutes) {
    return;
  }

  inputIndex = 0;
  for (i = lastRoutes.length - 1; i >= 0; --i) {
    $("input[name=from" + inputIndex + "]").val(lastRoutes[i].from.name);
    $("input[name=to" + inputIndex + "]").val(lastRoutes[i].to.name);

    inputIndex++;
  }
})
