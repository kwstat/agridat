\name{mercer.mangold.uniformity}
\alias{mercer.mangold.uniformity}
\docType{data}
\title{
  Uniformity trial of mangolds
}
\description{
  Uniformity trial of mangolds at Rothamsted Experiment Station,
  England, 1910.
}
\usage{data(mercer.mangold.uniformity)}
\format{
  A data frame with 200 observations on the following 4 variables.
  \describe{
    \item{\code{roots}}{root yields, pounds}
    \item{\code{leaves}}{leaf yields, pounds}
    \item{\code{col}}{column, 1-10}
    \item{\code{row}}{row, 1-20}
  }
}
\details{
  Grown in 1910.
  Each plot was 3 "drills", each 2.4 feet wide.
  Plots were 1/200 acres, 7.2 feet by 30.25 feet long
}
\source{
  Mercer, WB and Hall, AD, 1911. The experimental error of field trials
  \emph{The Journal of Agricultural Science}, 4, 107-132. Table 1.
}

\references{
  McCullagh, P. and Clifford, D., (2006).
  Evidence for conformal invariance of crop yields,
  \emph{Proceedings of the Royal Society A: Mathematical, Physical and
  Engineering Science}, 462, 2119--2143.
}

\examples{

data(mercer.mangold.uniformity)
dat <- mercer.mangold.uniformity

# Show field in true aspect ratio
asp = (7.25 * 20) / (30.25 * 10)

if(require(desplot)){
desplot(roots~col*row, data=dat,
        main="mercer.mangold.uniformity roots", aspect=asp)
desplot(leaves~col*row, data=dat,
        main="mercer.mangold.uniformity leaves", aspect=asp)
}

# xyplot(roots~leaves, data=dat)

}
\keyword{datasets}
