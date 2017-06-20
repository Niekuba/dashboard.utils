shiny_ui <- function() {
  sidebar <- dashboardSidebar(sidebarMenu(id = 'tabs',
                                          menuItem(text = 'Dashboard', tabName = 'dashboard', icon = icon('dashboard')
                                          ),
                                          daterangeUI('daterange')
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
}

#' @export
run_app <- function() {
  shinyApp(ui = shiny_ui(), server = shiny_server)
}
