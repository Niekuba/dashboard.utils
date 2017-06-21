dashboard_bodyUI <- function(id) {
  ns <- NS(id)
  tagList(
    fluidRow(
      box(width = 6, collapsible = T,
          infoBoxOutput(ns('qm_quickest'), width = 6),
          infoBoxOutput(ns('longest_distance'), width = 6)
      ),
      box(width = 6, collapsible = T,
          column(width = 4, uiOutput(ns('ui_filter_cyl'))),
          column(width = 4, uiOutput(ns('ui_filter_gear'))),
          column(width = 4, uiOutput(ns('ui_group')))
      )
    ),
    fluidRow(
      box(width = 12,
          DT::dataTableOutput(ns('car_data'))
      )
    )
  )
}

dashboard_body <- function(input, output, session) {
  mtcars_filtered <- reactive({
    data <- mtcars
    data$car <- rownames(mtcars)
    if(!is.null(input$filter_cyl)) data <- data %>% dplyr::filter(cyl %in% input$filter_cyl)
    if(!is.null(input$filter_gear)) data <- data %>% dplyr::filter(gear %in% input$filter_gear)
    return(data)
  })

  output$ui_filter_cyl <- renderUI({
    ns <- session$ns
    selectizeInput(ns('filter_cyl'), label = 'Filter cylinders', choices = mtcars$cyl, multiple = T)
  })
  output$ui_filter_gear <- renderUI({
    ns <- session$ns
    selectizeInput(ns('filter_gear'), label = 'Filter number of gears', choices = mtcars$gear, multiple = T)
  })
  output$ui_group <- renderUI({
    ns <- session$ns
    selectizeInput(ns('group'), 'Parameters to group by', choices = c('cyl', 'gear'), multiple = T)
  })

  output$qm_quickest <- renderInfoBox({
    data <- mtcars_filtered()
    data2 <- data[data$qsec == min(data$qsec), ]

    infoBox('1/4 mile best', subtitle = data$car[1],
            value = data$qsec[1])
  })

  output$longest_distance <- renderInfoBox({
    data <- mtcars_filtered()
    data2 <- data[data$qsec == max(data$mpg), ]

    infoBox('Best mpg', subtitle = data$car[1],
            value = data$mpg[1])
  })

  output$car_data <- DT::renderDataTable({
    data <- mtcars_filtered()
    eval.string.dplyr = function(.data, .fun.name, ...) {
      args = list(...)
      args = unlist(args)
      code = paste0(.fun.name,"(.data,", paste0(args, collapse=","), ")")
      df = eval(parse(text=code,srcfile=NULL))
      df
    }
    s_group_by = function(.data, ...) {
      eval.string.dplyr(.data,"group_by", ...)
    }
    if(!is.null(input$group)) {
      data <- data %>% s_group_by(input$group) %>% summarise(count = n())
    }
    datatable(data,
              rownames = F,
              extensions = c('Buttons', 'ColReorder'),
              options = list(
                dom = 'Bfrtip',
                colReorder = list(realtime = F),
                buttons = list('colvis', list(extend = 'collection', buttons = list(
                  list(extend = 'csv', filename = 'export',exportOptions = list(columns = ':visible')),
                  list(extend = 'excel', filename = 'export',exportOptions = list(columns = ':visible')),
                  'copy'), text = 'Pobierz'))
              )
    )
  })
}
