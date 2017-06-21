context('Dataset')

mtcars_colsums <- dput(structure(c(642.9, 198, 7383.1, 4694, 115.09, 102.952, 571.16,
                                   14, 13, 118, 90), .Names = c("mpg", "cyl", "disp", "hp", "drat",
                                                                "wt", "qsec", "vs", "am", "gear", "carb")))

test_that('mtcars dataset always looks the same', {
  expect_true(exists('mtcars'))
  expect_equal(dim(mtcars), c(32L,11L))

  expect_equal(colSums(mtcars), mtcars_colsums)

  expect_equal(length(unique(rownames(mtcars))), 32) #no duplicate cars
})
