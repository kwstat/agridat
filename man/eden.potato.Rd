\name{eden.potato}
\alias{eden.potato}
\docType{data}
\title{
  Potato yields in response to potash and nitrogen fertilizer
}
\description{
  Potato yields in response to potash and nitrogen fertilizer.
  Data from Fisher's 1929 paper \emph{Studies in Crop Variation 6}.
  A different design was used each year.
}

\format{
  A data frame with 225 observations on the following 9 variables.
  \describe{
    \item{\code{year}}{Factor for year/type}
    \item{\code{yield}}{Yield in pounds per plot}
    \item{\code{block}}{Block factor}
    \item{\code{row}}{Row}
    \item{\code{col}}{Column}
    \item{\code{trt}}{Treatment factor}
    \item{\code{nitro}}{Nitrogen fertilizer, cwt/acre}
    \item{\code{potash}}{Potash fertilizer, cwt/acre}
    \item{\code{ptype}}{Potash type}
  }
}
\details{
  The data is of interest to show the gradual development of
  experimental designs in agriculture.

  In 1925/1926 the potato variety was Kerr's Pink.  In 1927 Arran
  Comrade.

  In the 1925a/1926a qualitative experiments, the treatments are
  O=None, S=Sulfate, M=Muriate, P=Potash manure salts.
  The design was a Latin Square.

  The 1925/1926b/1927 experiments were RCB designs with treatment codes
  defining the amount and type of fertilizer used.  Note: the 't'
  treatment was not defined in the original paper.
}
\source{
  T Eden and R A Fisher, 1929.
  Studies in Crop Variation. VI. Experiments on the response of the
  potato to potash and nitrogen.
  \emph{Journal of Agricultural Science}, 19: 201-213.
}
\references{
  McCullagh, P. and Clifford, D., (2006).
  Evidence for conformal invariance of crop yields,
  \emph{Proceedings of the Royal Society A: Mathematical, Physical and
  Engineering Science}, 462, 2119--2143.
}

\examples{

data(eden.potato)
dat <- eden.potato

# 1925 qualitative
d5a <- subset(dat, year=='1925a')
desplot(trt~col*row, d5a, text=yield, cex=1, shorten='no',
        main="eden.potato: 1925 qualitative")
anova(m5a <- aov(yield~trt+factor(row)+factor(col), d5a)) # table 2

# 1926 qualitative
d6a <- subset(dat, year=='1926a')
desplot(trt~col*row, d6a, text=yield, cex=1, shorten='no',
        main="eden.potato: 1926 qualitative")
anova(m6a <- aov(yield~trt+factor(row)+factor(col), d6a)) # table 4

# 1925 quantitative
d5 <- subset(dat, year=='1925b')
desplot(yield ~ col*row, d5, out1=block, text=trt, cex=1,
        main="eden.potato: 1925 quantitative")
# Trt 't' not defined, seems to be the same as 'a'
require(lattice)
dotplot(trt~yield|block, d5,
        main="eden.potato: 1925 quantitative")
anova(m5 <- aov(yield~trt+block, d5)) # table 6

# 1926 quantitative
d6 <- subset(dat, year=='1926b')
desplot(yield ~ col*row, d6, out1=block, text=trt, cex=1,
        main="eden.potato: 1926 quantitative")
anova(m6 <- aov(yield~trt+block, d6)) # table 7

# 1927 qualitative + quantitative
d7 <- droplevels(subset(dat, year==1927))
desplot(yield ~ col*row, d7, out1=block, text=trt, cex=1, col=ptype,
        main="eden.potato: 1927 qualitative + quantitative")

# Table 8.  Anova, mean yield tons / acre
anova(m7 <- aov(yield~trt+block+ptype + ptype:potash, d7))
require(reshape2)
me7 <- melt(d7, measure.vars='yield')
acast(me7, potash~nitro, fun=mean) * 40/2240 # English ton = 2240 lbs
acast(me7, potash~ptype, fun=mean) * 40/2240
}
\keyword{datasets}
