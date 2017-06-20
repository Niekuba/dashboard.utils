context('Dashboard body module')

test_that('Module file exists and contains necessary elements', {
  expect_true(file.exists('../../R/dashboard_body.R'))

  expect_true(exists('dashboard_bodyUI'))
  expect_true(exists('dashboard_body'))
})
