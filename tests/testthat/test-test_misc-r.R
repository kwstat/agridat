context("test-test_misc-r.R")

# dumb example to qualify as having tests...

test_that("Data lods", {
  data("mercer.wheat.uniformity")
  expect_equal(sum(mercer.wheat.uniformity$grain), 1974.32)
})
