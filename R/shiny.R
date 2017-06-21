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

  callModule(icon_sidebar, 'icon_sidebar')
  callModule(daterange, 'daterange')
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
