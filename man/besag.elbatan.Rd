\name{besag.elbatan}
\alias{besag.elbatan}
\docType{data}
\title{
  RCB experiment of 50 varieties of wheat in 3 blocks with strong
  spatial trend.
}
\description{
  RCB experiment of 50 varieties of wheat in 3 blocks with strong
  spatial trend.
}

\format{
  A data frame with 150 observations on the following 4 variables.
  \describe{
    \item{\code{yield}}{Yield of wheat}
    \item{\code{gen}}{Genetic variety, factor with 50 levels}
    \item{\code{block}}{Block/column (numeric)}
    \item{\code{row}}{Row (numeric)}
  }
}
\details{
  RCB experiment on wheat at El Batan, Mexico.  There are three
  single-column replicates with 50 varieties in each replicate.
}
\source{
  Julian Besag and D Higdon, 1999.
  Bayesian Analysis of Agricultural Field Experiments,
  \emph{Journal of the Royal Statistical Society: Series B (Statistical
    Methodology)},61, 691--746. Table 1.

  Retrieved from
  \url{http://web.archive.org/web/19991008143232/www.stat.duke.edu/~higdon/trials/elbatan.dat}.

  Used with permission of David Higdon.
}

\examples{
dat <- besag.elbatan

# Besag figure 1
xyplot(yield~row, dat, groups=block, type=c('l'),
       main="besag.elbatan")

desplot(yield~block*row, dat, main="besag.elbatan")

# RCB
m1 <- lm(yield ~ 0 + gen + block, dat)
p1 <- coef(m1)[1:50]

# Add smooth trend with GAM
require(gam)
m2 <- gam(yield ~ 0 + gen + block + lo(row), data=dat)
plot(m2, residuals=TRUE, se=TRUE, col=dat$block)
p2 <- coef(m2)[1:50]

# Compare estimates
plot(p1, p2, xlab="RCB", ylab="RCB with smooth trend", type='n')
text(p1, p2, 1:50, cex=.5)
abline(0,1,col="gray")
}

