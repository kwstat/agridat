\name{kempton.slatehall}
\alias{kempton.slatehall}
\docType{data}
\title{
  Slate Hall Farm 1976 spring wheat
}
\description{
  Yields for a trial at Slate Hall Farm in 1976.
}

\format{
  A data frame with 150 observations on the following 5 variables.
  \describe{
    \item{\code{rep}}{Rep factor, 6 levels}
    \item{\code{row}}{Row}
    \item{\code{col}}{Column}
    \item{\code{gen}}{Genotype factor, 25 levels}
    \item{\code{yield}}{Yield (grams/plot)}
  }
}
\details{
  The trial was a balanced lattice with 25 varieties in 6 replicates,
  10 ranges of 15 columns.  The plot size was 1.5 meters by 4 meters.
  Each row within a rep is an (incomplete) block.
}
\source{
  R A Kempton and P N Fox. (1997).
  \emph{Statistical Methods for Plant Variety Evaluation},
  Chapman and Hall.   Page 84.
}
\references{
  Gilmour, Arthur R and Robin Thompson and Brian R Cullis. (1994).
  Average Information REML: An Efficient Algorithm for Variance
  Parameter Estimation in Linear Mixed Models, \emph{Biometrics},
  51, 1440-1450.
}
\examples{
dat <- kempton.slatehall
dat <- transform(dat, xf=factor(col), yf=factor(row))

desplot(yield ~ col * row, dat, num=gen, out1=rep,
        main="kempton.slatehall")

# Incomplete block model of Gilmour et al 1995
if(require(lme4)){
m1 <- lmer(yield ~ gen + (1|rep) + (1|rep:yf) + (1|rep:xf), data=dat)
print(VarCorr(m1), comp=c("Variance","Std.Dev."))
## Groups   Name        Variance Std.Dev.
## rep:xf   (Intercept) 14811.6  121.703
## rep:yf   (Intercept) 15595.0  124.880
## rep      (Intercept)  4262.4   65.287
## Residual              8061.8   89.788
}

\dontrun{
# Incomplete block model of Gilmour et al 1995
require("asreml")
m2 <- asreml(yield ~ gen, random = ~ rep/(xf+yf), data=dat)
summary(m2)$varcomp
# Table 4
predict(m2, classify="gen")$predictions$pvals
}
}
\keyword{datasets}
