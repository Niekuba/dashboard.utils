icon_sidebar <- function() {
runjs({'
        var element = document.querySelector(".skin-blue");
        element.className = "skin-blue sidebar-mini";
        var clicker = document.querySelector(".sidebar-toggle");
        clicker.id = "switchState";
    '})

onclick('switchState', runjs({'
        var container = document.getElementById("tohide");
        var title = document.querySelector(".logo")
        if (container.style.visibility == "hidden") {
          container.style.visibility = "visible";
          title.style.visibility = "visible";
        } else {
          container.style.visibility = "hidden";
          title.style.visibility = "hidden";
        }
  '}))
}
