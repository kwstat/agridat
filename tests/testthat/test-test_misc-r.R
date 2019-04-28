
# dumb example just to prove we use testthat

test_that("Data lods", {
  data("mercer.wheat.uniformity")
  expect_equal(sum(mercer.wheat.uniformity$grain), 1974.32)
})
