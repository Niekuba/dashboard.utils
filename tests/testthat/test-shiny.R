context('Shiny app')

test_that('Main elements of shiny app do exist', {
  expect_equal(class(sidebar),'shiny.tag')
  expect_equal(typeof(sidebar), 'list')

  expect_equal(class(body),'shiny.tag')
  expect_equal(typeof(body), 'list')

  expect_equal(class(shiny_server), 'function')
})
