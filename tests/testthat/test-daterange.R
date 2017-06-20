context('Daterange module')

test_that('date_origin is date vector', {
  expect_equal(class(date_origin), 'Date')
  expect_equal(length(date_origin[is.na(date_origin)]), 0)
})

test_that('daterange consists of jscode, htmlcode and set_date', {
  expect_true(exists('jscode'))
  expect_true(exists('htmlcode'))
  expect_true(exists('set_date'))
})
