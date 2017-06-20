context('Init')

test_that('required packages are installed and can be loaded', {
  required_packages <- c('shiny', 'shinydashboard', 'shinyjs')

  expect_true(
    all(required_packages %in% installed.packages())
    )
})
