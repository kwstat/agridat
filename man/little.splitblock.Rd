\name{little.splitblock}
\alias{little.splitblock}
\docType{data}
\title{
  Split-block experiment of sugar beets
}
\description{
  Split-block experiment of sugar beets.
}
\usage{data("little.splitblock")}
\format{
  A data frame with 80 observations on the following 6 variables.
  \describe{
    \item{\code{row}}{row}
    \item{\code{col}}{column}
    \item{\code{yield}}{sugar beet yield, tons/acre}
    \item{\code{harvest}}{harvest date, weeks after planting}
    \item{\code{nitro}}{nitrogen, pounds/acre}
    \item{\code{block}}{block}
  }
}
\details{
  Four rates of nitrogen, laid out as a 4x4 Latin-square experiment.

  Within each column block, the sub-plots are strips (across 4 rows) of
  5 different harvest dates.

  The use of sub-plots a s strips necessitates care when determining the
  error terms in the ANOVA table.

  Note, Little has yield value of 22.3 for row 3, column I-H3. This data
  uses 23.3 in order to match the marginal totals given by Little.

}
\source{
  Thomas M. Little, F. Jackson Hills. (1978)
  \emph{Agricultural Experimentation}
}
\references{
  None.
}
\examples{

data(little.splitblock)
dat <- little.splitblock

# Match marginal totals given by Little.
## sum(dat$yield)
## with(dat, tapply(yield,col,sum))
## with(dat, tapply(yield,row,sum))

# Layout shown by Little figure 10.2
if(require(desplot)){
  desplot(yield ~ col*row, data=dat,
          out1=block, out2=col, col=nitro, cex=1, num=harvest,
          main="little.splitblock")
}

# Convert continuous traits to factors
dat <- transform(dat, R=factor(row), C=factor(block),
                 H=factor(harvest), N=factor(nitro))

if(FALSE){
  library(lattice)
  xyplot(yield ~ nitro|H,dat)
  xyplot(yield ~ harvest|N,dat)
}

# Anova table matches Little, table 10.3
m1 <- aov(yield ~ R + C + N + H + N:H +
            Error(R:C:N + C:H + C:N:H), data=dat)
summary(m1)

}
\keyword{datasets}
