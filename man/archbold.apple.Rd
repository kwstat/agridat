\name{archbold.apple}
\alias{archbold.apple}
\docType{data}
\title{
  Split-split plot experiment on apple trees
}
\description{
  Split-split plot experiment on apple trees with different spacing,
  root stock, and cultivars.
}

\format{
  A data frame with 120 observations on the following 10 variables.
  \describe{
    \item{\code{rep}}{Block factor, 5 levels}
    \item{\code{row}}{Row}
    \item{\code{pos}}{Position within each row}
    \item{\code{spacing}}{Spacing between trees, 6,10,14 feet}
    \item{\code{stock}}{Rootstock factor, 4 levels}
    \item{\code{gen}}{Genotype factor, 2 levels}
    \item{\code{yield}}{Yield total in kg/tree from 1975-1979}
    \item{\code{trt}}{Treatment code}
  }
}
\details{
  In rep 1, the 10-foot-spacing main plot was split into two
  non-contiguous pieces.  This also happened in rep 4.  In the analysis
  of Cornelius and Archbold, they consider each row x within-row-spacing
  to be a distinct main plot.  (Also true for the 14-foot row-spacing,
  even though the 14-foot spacing plots were contiguous.)

  The treatment code is defined as 100 * spacing + 10 * stock + gen,
  where stock=0,1,6,7 for Seedling,MM111,MM106,M0007 and gen=1,2 for
  Redspur,Golden, respectively.
}
\source{
  D Archbold and G. R. Brown and P. L. Cornelius. (1987).
  Rootstock and in-row spacing effects on growth and yield of spur-type
  delicious and Golden delicious apple.
  \emph{Journal of the American Society for Horticultural Science},
  112, 219--222.
}
\references{
  Cornelius, PL and Archbold, DD, 1989.
  Analysis of a split-split plot experiment with missing data using
  mixed model equations.
  \emph{Applications of Mixed Models in Agriculture and Related
    Disciplines}.  Pages 55-79.
}
\examples{
dat <- archbold.apple

# Define main plot and subplot
dat <- transform(dat, rep=factor(rep), spacing=factor(spacing), trt=factor(trt),
                 mp = factor(paste(row,spacing,sep="")),
                 sp = factor(paste(row,spacing,stock,sep="")))

# Due to 'spacing', the plots are different sizes, but the following layout
# shows the relative position of the plots and treatments. Note that the
# 'spacing' treatments are not contiguous in some reps.
desplot(spacing~row*pos, dat, col=stock, cex=1, num=gen,
        main="archbold.apple")

if(require(lme4)){
m1 <- lmer(yield ~ -1 + trt + (1|rep/mp/sp), dat)
print(VarCorr(m1), comp=c("Variance","Std.Dev.")) # Variances/means on page 59
## Random effects:
##  Groups      Name        Variance Std.Dev.
##  sp:(mp:rep) (Intercept)  193.31  13.903
##  mp:rep      (Intercept)  203.78  14.275
##  rep         (Intercept)  197.32  14.047
##  Residual                1015.28  31.863
}

## library(HH)
## interaction2wt(yield~spacing+stock+gen, dat)

}
\keyword{datasets}
