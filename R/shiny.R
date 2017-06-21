
shiny_ui <- function() {
  sidebar <- dashboardSidebar(sidebarMenu(id = 'tabs',
                                          menuItem(text = 'Dashboard', tabName = 'dashboard', icon = icon('dashboard')
                                          ),
                                          div(id = 'tohide',daterangeUI('daterange'))
  )
  )

  body <- dashboardBody(
    useShinyjs(),
    tabItems(
      tabItem(tabName = 'dashboard',
              'Test'

      )
    ))

  dashboardPage(
    dashboardHeader(title = 'Example shiny'),
    sidebar,
    body
  )
}


shiny_server <- function(input, output, session) {
  callModule(daterange, 'daterange')

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

#' Runs a shiny app.
#'
#' @return shiny app (in a new window/browser)
#'
#' @examples
#' run_app()
#'
#' @export
run_app <- function() {
  shinyApp(ui = shiny_ui(), server = shiny_server)



}
