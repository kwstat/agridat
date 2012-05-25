\name{gilmour.serpentine}
\alias{gilmour.serpentine}
\docType{data}
\title{
  Wheat yield in South Australia with serpentine row/col effects
}
\description{
  An RCB experiment of wheat in South Australia, with strong spatial
  variation and serpentine row/column effects.
}
\usage{gilmour.serpentine}
\format{
  A data frame with 330 observations on the following 5 variables.
  \describe{
    \item{\code{column}}{Column, numeric}
    \item{\code{row}}{Row, numeric}
    \item{\code{rep}}{Replicate factor, 3 levels}
    \item{\code{gen}}{Wheat variety, 108 levels}
    \item{\code{yield}}{Yield}
  }
}
\details{
  A randomized complete block experiment.  There are 108 varieties in 3
  reps.  Plots are 6 meters long, 0.75 meters wide, trimmed to 4.2
  meters lengths before harvest. Trimming was done by spraying the wheat
  with herbicide.  The sprayer travelled in a serpentine pattern up and
  down columns.  The trial was sown in a serpentine manner with a
  planter that seeds three rows at a time (Left, Middle, Right).
}
\source{
  Arthur R Gilmour and Brian R Cullis and Arunas P Verbyla, 1997.
  Accounting for natural and extraneous variation in the analysis of
  field experiments. \emph{Journal of Agric Biol Env Statistics}, 2,
  269-293.

  Used with permission of Arthur Gilmour.
}

\examples{
dat <- gilmour.serpentine

desplot(yield~ column*row, data=dat, num=gen, out1=rep)

# Extreme field trend.  Blocking insufficient--needs a spline/smoother
xyplot(yield~column, data=dat)

\dontrun{
require(asreml)
dat <- transform(dat, rowf=factor(row), colf=factor(10*(column-8)))

mcb <- asreml(yield ~ gen, data=dat, random=~rep)

m1 <- asreml(yield ~ gen, data=dat, rcov = ~ar1(colf):ar1(rowf))

m2a <- asreml(yield ~ gen + column, data=dat,
             random= ~ spl(column) + colf,
             rcov = ~ar1(colf):ar1(rowf))

# Figure 4 shows serpentine spraying
p2 <- predict(m2a, classify="colf")$predictions$pvals
plot(p2$predicted, type='b', xlab="column number", ylab="BLUP")

# Define column code (due to serpentine spraying)
dat <- transform(dat, colcode = factor(1+(dat$column-1) %% 4))

m3a <- asreml(yield ~ gen + lin(colf) + colcode, data=dat,
             random= ~ colf + rowf + spl(colf),
             rcov = ~ar1(colf):ar1(rowf))
# Figure 6 shows serpentine row effects
p3 <- predict(m3a, classify="rowf")$predictions$pvals
plot(p3$predicted, type='l', xlab="row number", ylab="BLUP")
text(1:22, p3$predicted, c('L','L','M','R','R','M','L','L',
'M','R','R','M','L','L','M','R','R','M','L','L','M','R'))

# Define row code (due to serpentine planting). 1=middle, 2=left/right
dat <- transform(dat, rowcode = factor(row))
levels(dat$rowcode) <- c('2','2','1','2','2','1','2','2','1',
'2','2','1','2','2','1','2','2','1','2','2','1','2')
}
}

