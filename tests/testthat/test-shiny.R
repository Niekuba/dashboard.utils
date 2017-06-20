context('Shiny app')

test_that('Main elements of shiny app do exist', {
  expect_equal(class(shiny_ui), 'function')
  expect_equal(class(shiny_server), 'function')
})
