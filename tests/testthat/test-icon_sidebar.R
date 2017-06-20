context('Mini icon sidebar')

test_that('icon_sidebar throws error when incorrect parameters values are provided', {
  expect_error(icon_sidebar(id = NULL))
  expect_error(icon_sidebar(id = c('test', 'test2')))
  expect_error(icon_sidebar(id = list('test', 'test2')))

  expect_error(icon_sidebar(shiny_skin = NULL))
  expect_error(icon_sidebar(shiny_skin = c('test', 'test2')))
  expect_error(icon_sidebar(shiny_skin = list('test', 'test2')))
  expect_error(icon_sidebar(shiny_skin = 'pink'))
})
