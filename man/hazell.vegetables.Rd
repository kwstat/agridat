\name{hazell.vegetables}
\alias{hazell.vegetables}
\docType{data}
\title{
  Gross profit for four vegetable crops in six years
}
\description{
  Gross profit for four vegetable crops in six years
}
\usage{data(hazell.vegetables)}
\format{
  A data frame with 6 observations on the following 5 variables.
  \describe{
    \item{\code{year}}{year factor, 6 levels}
    \item{\code{carrot}}{Carrot profit, dollars/acre}
    \item{\code{celery}}{Celery profit, dollars/acre}
    \item{\code{cucumber}}{Cucumber profit, dollars/acre}
    \item{\code{pepper}}{Pepper profit, dollars/acre}
  }
}
\details{
  The values in the table are gross profits (loss) in dollars per acre.
  The criteria in the example below are (1) total acres < 200, (2) total
  labor < 10000, (3) crop rotation.
}

\source{
  P.B.R. Hazell, (1971).
  A linear alternative to quadratic and semivariance programming for farm planning
  under uncertainty.
  \emph{Am. J. Agric. Econ.}, 53, 53-62.
  http://doi.org/10.2307/3180297
}
\references{
  Carlos Romero, Tahir Rehman. (2003).
  \emph{Multiple Criteria Analysis for Agricultural Decisions}. Elsevier.
}

\examples{

data(hazell.vegetables)
dat <- hazell.vegetables

\dontrun{

require(linprog)
# colMeans(dat[ , -1])
# 252.8333 442.6667 283.8333 515.8333

# Maximize c'x for Ax=b
A <- rbind(c(1,1,1,1), c(25,36,27,87), c(-1,1,-1,1))
cvec <- c(253, 443, 284, 516) # avg profit per acre
colnames(A) <- names(cvec) <- c("carrot","celery","cucumber","pepper")
rownames(A) <- c('land','labor','rotation')
bvec <- c(200,10000,0)
const.dir <- c("<=","<=","<=")

m1 <- solveLP(cvec, bvec, A, maximum=TRUE, const.dir=const.dir, lpSolve=TRUE)
# m1$solution # optimal number of acres for each crop
#   carrot    celery  cucumber    pepper
#  0.00000  27.45098 100.00000  72.54902

# Average income for this plan
## sum(cvec * m1$solution)
## [1] 77996.08

# Year-to-year income for this plan
## as.matrix(dat[,-1]) %*% m1$solution
##           [,1]
## [1,]  80492.16
## [2,]  80431.37
## [3,]  81884.31
## [4,] 106868.63
## [5,]  37558.82
## [6,]  80513.73

# Brute-force search for optimum allocation that minimizes year-to-year
# income variability.

# For generality, assume we have unequal probabilities for each year.
probs <- c(.15, .20, .20, .15, .15, .15)
# Randomly allocate crops to 200 acres, 100,000 times
mat <- matrix(runif(4*100000), ncol=4)
mat <- 200*sweep(mat, 1, rowSums(mat), "/")
profit <- mat %*% t(dat[,-1]) # Each row is profit for each of the six years
ix <- apply(profit, 1, function(x) cov.wt(as.data.frame(x), wt=probs)$cov)
ix <- which.max(ix)
mat[ix,] # Optimal planting allocation that minimizes the weighted variance
## carrot celery cucumber pepper
## 71.67002 27.90306 84.69966 15.72726

}

}
\keyword{datasets}
