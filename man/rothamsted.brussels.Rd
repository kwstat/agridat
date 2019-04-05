\name{rothamsted.brussels}
\alias{rothamsted.brussels}
\docType{data}
\title{
  RCB experiment of brussels sprouts, 9 fertilizer treatments
}
\description{
  RCB experiment of brussels sprouts, 9 fertilizer treatments
}

\format{
  A data frame with 48 observations on the following 5 variables.
  \describe{
    \item{\code{row}}{row}
    \item{\code{col}}{column}
    \item{\code{yield}}{yield of saleable sprouts, pounds}
    \item{\code{trt}}{treatment, 9 levels}
    \item{\code{block}}{block, 4 levels}
  }
}
\details{
  The block numbers are arbitrary, and may not match the orignal source.

  Plots were 10 yards x 14 yards.  Plot orientation is not clear.
  
}

\source{
  Rothamsted Experimental Station Report 1934-36.
  Brussels sprouts: effect of sulphate of ammonia, poultry manure, soot
  and rape dust, pp. 191-192. Harpenden: Lawes Agricultural Trust.
}

\references{
  McCullagh, P. and Clifford, D., (2006).
  Evidence for conformal invariance of crop yields,
  \emph{Proceedings of the Royal Society A: Mathematical, Physical and
    Engineering Science}, 462, 2119--2143.
  http://doi.org/10.1098/rspa.2006.1667 
}

\examples{

data(rothamsted.brussels)
dat <- rothamsted.brussels

require(lattice)
bwplot(yield~trt, dat, main="rothamsted.brussels")

if(require(desplot)){
  desplot(yield~col*row, data=dat,
          num=trt, out1=block, cex=1, # aspect unknown
          main="rothamsted.brussels")
}

}

