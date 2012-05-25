\name{yates.oats}
\alias{yates.oats}
\docType{data}
\title{
  Yield of oats in a split-block experiment
}
\description{
  The yield of oats from a split-plot field trial using three varieties
  and four levels of manurial treatment. The experiment was laid out in
  6 blocks of 3 main plots, each split into 4 sub-plots. The varieties
  were applied to the main plots and the manurial (nitrogen) treatments
  to the sub-plots. 
}
\usage{data(yates.oats)}
\format{
  \describe{
    \item{\code{block}}{Factor with 6 levels}
    \item{\code{nitro}}{Nitrogen treatment in hundredweight per acre}
    \item{\code{gen}}{Genotype factor, 3 levels}
    \item{\code{yield}}{Yield in 1/4 lbs per sub-plot, each 1/80 acre.}
    \item{\code{x}}{Layout in field}
    \item{\code{y}}{Layout in field}
  }
}

\source{
  Yates, Frank (1935) Complex experiments,
  \emph{Journal of the Royal Statistical Society Suppl}. 2, 181--247.
}

\references{
  Venables, W. N. and Ripley, B. D. (2002)
  \emph{Modern Applied Statistics with S}. Fourth edition. Springer.
}

\seealso{
  This is the same as the \code{\link{oats}} data in the \code{MASS}
  package, but includes the coordinates of the field layout.
}

\examples{

dat <- yates.oats
desplot(yield ~ x*y, dat, out1=block, text=gen, col=nitro, cex=1)

# Roughly linear gradient across the field.  The right-half of each
# block has lower yield.  The blocking is inadequate!
require(lattice)
xyplot(yield ~ x|factor(nitro), dat, type = c('p', 'smooth'),
       xlab='x', span=1, as.table = TRUE)

# Typical split-plot analysis
library(lme4)
m3 <- lmer(yield ~ nitro * gen + (1|block/gen), data=dat)
# Residuals still show structure
xyplot(resid(m3) ~ dat$x, xlab='x', type=c('p','smooth'))

# Add a linear trend for x
m4 <- lmer(yield ~ x + nitro * gen + (1|block/gen), data=dat)
xyplot(resid(m4) ~ dat$x, type=c('p','smooth'), xlab='x')

# Compare fits
AIC(m3,m4)

}
