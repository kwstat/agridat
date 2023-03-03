\name{heath.raddish.uniformity}
\alias{heath.raddish.uniformity}
\docType{data}
\title{
  Uniformity trial of raddish
}
\description{
  Uniformity trial of raddish in four containers.
}
\usage{data("heath.raddish.uniformity")}
\format{
  A data frame with 400 observations on the following 4 variables.
  \describe{
    \item{\code{row}}{row}
    \item{\code{col}}{column}
    \item{\code{block}}{block}
    \item{\code{yield}}{weight per plant, grams}
  }
}
\details{
  Weight of 399 radish plants grown at 1in x 1in spacing in four plastic basins.
  Seed wetted 1968-02-15, planted 1968-02-17, harvested 1968-03-26.

  Heath said, Most of the large plants were round the edges...one
  important source of variation might have been competition for light.
}
\source{
  O.V.S. Heath (1970).
  Investigation by Experiment. Table 1, p 24-25.
  https://archive.org/details/investigationbye0000heat
}
\references{
  None
}
\examples{
\dontrun{
  require(agridat)
  data(heath.raddish.uniformity)
  dat <- heath.raddish.uniformity
  libs(desplot, dplyr)
  desplot(dat, yield ~ col*row|block,
          aspect=1,
          main="heath.raddish.uniformity")

  # Indicator for border/interior plants
  dat <- mutate(dat,
                inner = row > 1 & row < 10 & col >  1 & col < 10)
  # Heath has 5.80 and 9.63 (we assume this is a typo of 9.36)
  dat <- group_by(dat, inner)
  summarize(dat, mean=mean(yield, na.rm=TRUE))
  # Interior plots are significantly lower yielding
  anova(aov(yield ~ block + inner, dat))
  # lattice::bwplot(yield ~ inner, dat, horiz=0)
  # similar to Heath fig 2-2
  # lattice::histogram( ~ yield|inner, dat, layout=c(1,2), n=20)
}
}
\keyword{datasets}
