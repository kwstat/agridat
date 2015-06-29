\name{cochran.lattice}
\alias{cochran.lattice}
\docType{data}
\title{
  Balanced lattice experiment in cotton
}
\description{
  Balanced lattice experiment in cotton
}
\usage{data("cochran.lattice")}
\format{
  A data frame with 80 observations on the following 5 variables.
  \describe{
    \item{\code{y}}{percent of affected flower buds}
    \item{\code{rep}}{replicate}
    \item{\code{row}}{row}
    \item{\code{col}}{column}
    \item{\code{trt}}{treatment factor}
  }
}
\details{

  The experiment is a balanced lattice square with 16 treatments in a 4x4
  layout in each of 5 replicates.  The treatments were applied to cotton
  plants.  Each plot was ten rows wide by 70 feet long
  (about 1/18 of an acre).  (Estimated plot width is 34.5 feet.)
  Data were collected from the middle 4 rows.
  The data are the percentages of squares showing attack by boll weevils.
  A 'square' is the name given to a young flower bud.

}
\source{

  William G. Cochran, Gertrude M. Cox. \emph{Experimental Designs}, 2nd
  Edition. Page 490.
  
}
\references{

  Walter Federer.
  Combining Standard Block Analyses With Spatial Analyses Under a Random
  Effects Model. Cornell Univ Tech Report BU-1373-MA.

}
\examples{

data(cochran.lattice)
dat <- cochran.lattice

desplot(y~row*col|rep, dat, text=trt, cex=2, main="cochran.lattice")

# Random rep,row,column model often used by Federer
if(require(lme4)){
  dat <- transform(dat, rowf=factor(row), colf=factor(col))
  m1 <-  lmer(y ~ trt + (1|rep) + (1|rep:row) + (1|rep:col), data=dat)
  summary(m1)
}

}
\keyword{datasets}
