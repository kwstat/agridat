 \name{kempton.barley.uniformity}
\alias{kempton.barley.uniformity}
\docType{data}
\title{
  Uniformity trial of Spring Barley in 1978
}
\description{
  Uniformity trial of Spring Barley in 1978
}
\details{
  A uniformity trial of spring barley planted in 1978.  Conducted by the
  Plant Breeding Institute in Cambridge, England.

  Each plot is 5 feet wide, 14 feet long.
}

\format{
  A data frame with 196 observations on the following 3 variables.
  \describe{
    \item{\code{row}}{Row position}
    \item{\code{col}}{Column position}
    \item{\code{yield}}{Grain yield, kg}
  }
}
\source{
  R. A. Kempton and C. W. Howes (1981). The use of neighbouring plot
  values in the analysis of variety trials. \emph{Applied Statistics},
  30, 59--70.
}
\references{
  McCullagh, P. and Clifford, D., (2006).
  Evidence for conformal invariance of crop yields,
  Proceedings of the Royal Society A: Mathematical, Physical and
  Engineering Science. 462, 2119--2143.
}

\examples{

data(kempton.barley.uniformity)
dat <- kempton.barley.uniformity

require(lattice)
desplot(yield~col*row, dat, main="kempton.barley.uniformity")
asp <- (28*14)/(7*5) # aspect ratio (rows * ft)/(cols * ft)
desplot(yield~col*row, dat, aspect=asp,
        main="kempton.barley.uniformity (true aspect)") # true view

dat <- transform(dat, xf = factor(col), yf=factor(row))

\dontrun{

# Kempton estimated auto-regression coefficients b1=0.10, b2=0.91
require(asreml)
m1 <- asreml(yield ~ 1, data=dat, rcov=~ar1(xf):ar1(yf))

require(lucid)
vc(m1)
##      effect component std.error z.ratio constr
##  R!variance    0.1044   0.022       4.7    pos
##    R!xf.cor    0.2458   0.07484     3.3  uncon
##    R!yf.cor    0.8186   0.03822    21    uncon

# asreml estimates auto-regression correlations of 0.25, 0.82
# Kempton estimated auto-regression coefficients b1=0.10, b2=0.91

}

# Kempton defines 4 blocks, randomly assigns variety codes 1-49 in each block, fits
# RCB model, computes mean squares for variety and residual.  Repeat 40 times.
# Kempton's estimate: variety = 1032, residual = 1013
# Our estimate: variety = 825, residual = 1080
fitfun <- function(dat){
  dat <- transform(dat, block=factor(ceiling(row/7)),
                   gen=factor(c(sample(1:49),sample(1:49),sample(1:49),sample(1:49))))
  m2 <- lm(yield*100 ~ block + gen, dat)
  anova(m2)[2:3,'Mean Sq']
}
set.seed(251)
out <- replicate(50, fitfun(dat))
rowMeans(out)

}
