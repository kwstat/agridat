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

desplot(yield~block*row, dat, main="besag.elbatan wheat yields",
num=gen)

# Besag figure 1
# xyplot(yield~row|block, dat, groups=block, type=c('l'),
#        layout=c(1,3), main="besag.elbatan wheat yields")

# RCB
m1 <- lm(yield ~ 0 + gen + factor(block), dat)
p1 <- coef(m1)[1:50]

# Add smooth trend with GAM
require(gam)
m2 <- gam(yield ~ -1 + gen + factor(block) + lo(row), data=dat)
plot(m2, residuals=TRUE, se=TRUE,,
     terms="lo(row)", main="besag.elbatan")
pred <- cbind(dat, predict(m2, dat, type="terms"))
# Need to correct for the average loess effect, which is like
# an overall intercept term.
adjlo <-  mean(pred$"lo(row)")
p2 <- coef(m2)[1:50] + adjlo

# Compare estimates
lims <- range(c(p1,p2))
plot(p1, p2, xlab="RCB prediction",
     ylab="RCB with smooth trend (predicted)",
     type='n', xlim=lims, ylim=lims,
     main="besag.elbatan")
text(p1, p2, 1:50, cex=.5)
abline(0,1,col="gray")
}

