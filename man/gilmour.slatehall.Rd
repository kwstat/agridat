\name{gilmour.slatehall}
\alias{gilmour.slatehall}
\docType{data}
\title{
  Slate Hall Farm 1978
}
\description{
  Yields for a trial at Slate Hall Farm in 1978.
}

\format{
  A data frame with 150 observations on the following 5 variables.
  \describe{
    \item{\code{row}}{Row}
    \item{\code{col}}{Column}
    \item{\code{yield}}{Yield (grams/plot)}
    \item{\code{gen}}{Genotype factor, 25 levels}
    \item{\code{rep}}{Rep factor, 6 levels}
  }
}
\details{
  The trial was a balanced lattice with 25 varieties in 6 replicates.
  The plot size was 1.5 meters by 4 meters, so the total area was
  15 x 1.5 meters by 10 x 4 meters.  The 'rep' labels are arbitrary (no
  rep labels appeared in the source data).   Each row within a rep is an
  (incomplete) block.
}
\source{
  Arthur R Gilmour and Brian R Cullis and Arunas P Verbyla (1997).
  Accounting for natural and extraneous variation in the analysis
  of field experiments.  \emph{Journal of Agricultural, Biological, and
  Environmental Statistics}, 2, 269-293.
}

\references{
  None.
}

\examples{

data(gilmour.slatehall)
dat <- gilmour.slatehall

if(require(desplot)){
desplot(yield ~ col * row, dat, num=gen,
        out1=rep, main="gilmour.slatehall")
}

\dontrun{
# Model 4 of Gilmour et al 1997
require(asreml)
dat <- transform(dat, xf=factor(col), yf=factor(row))
dat <- dat[order(dat$xf, dat$yf), ]
m4 <- asreml(yield ~ gen + lin(row), data=dat,
             random = ~ dev(row) + dev(col),
             rcov = ~ ar1(xf):ar1(yf))
coef(m4)$fixed[1] # linear row
# [1] 31.72252 # (sign switch due to row ordering)

require(lucid)
vc(m4)
##      effect component std.error z.ratio constr
##    dev(row) 20290     10260         2      pos
##    dev(col)  2519      1959         1.3    pos
##  R!variance 23950      4616         5.2    pos
##    R!xf.cor     0.439     0.113     3.9  uncon
##    R!yf.cor     0.125     0.117     1.1  uncon

plot(variogram(m4))
}
}
\keyword{datasets}
