# icon_sidebar <- function(id = 'switchState',
#                          shiny_skin = 'blue') {
#
#   if (is.null(shiny_skin) | length(shiny_skin) != 1 | !is.atomic(shiny_skin)) {
#     stop('shiny_skin parameter must be non-empty character string')
#   }
#   if (!is.character(shiny_skin)) {
#     tryCatch(shiny_skin <- as.character(shiny_skin), error = function(c) {
#       stop(paste0('Coercing shiny_skin to character failed. Error message: \n', c))
#     })
#   }
#
#   if (is.null(id) | length(id) != 1 | !is.atomic(id)) {
#     stop('id parameter must be non-empty character string')
#   }
#   if (!is.character(id)) {
#     tryCatch(shiny_skin <- as.character(id), error = function(c) {
#       stop(paste('Coercing id to character failed. Error message: \n', c))
#     })
#   }
#
#   available_skins <- c('blue', 'black', 'purple', 'green', 'red', 'yellow')
#   if (!(shiny_skin %in% available_skins)) {
#     stop(
#       paste('Unsupported skin provided. Supported values are:', available_skins)
#     )
#   }
#
#   add_sidebar_id <- function(id = id, shiny_skin = shiny_skin) {
#     shinyjs::runjs(
#       sprintf('
#               var element = document.querySelector(".skin-%s");
#               element.className = "skin-%s sidebar-mini";
#               var clicker = document.querySelector(".sidebar-toggle");
#               clicker.id = "%s";', shiny_skin, shiny_skin, id)
#       )
#   }
#
# }
#
#
# shinyjs::onclick(id, runjs({'
#   var container = document.getElementById("to-hide");
#   var title = document.querySelector(".logo");
#   if (container.style.visibility == "hidden") {
#     container.style.visibility = "visible";
#     title.style.visibility = "visible";
#   } else {
#     container.style.visibility = "hidden";
#     title.style.visibility = "hidden";
#   }
#   '}))
