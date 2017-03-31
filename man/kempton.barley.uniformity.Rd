 \name{kempton.barley.uniformity}
\alias{kempton.barley.uniformity}
\docType{data}
\title{
  Uniformity trial of barley
}
\description{
  Uniformity trial of barley at Cambridge, England, 1978.
}
\details{
  A uniformity trial of spring barley planted in 1978.  Conducted by the
  Plant Breeding Institute in Cambridge, England.

  Each plot is 5 feet wide, 14 feet long.

  Field width: 7 plots * 14 feet = 98 feet

  Field length: 28 plots * 5 feet = 140 feet
  
}

\format{
  A data frame with 196 observations on the following 3 variables.
  \describe{
    \item{\code{row}}{row}
    \item{\code{col}}{column}
    \item{\code{yield}}{grain yield, kg}
  }
}
\source{
  R. A. Kempton and C. W. Howes (1981).
  The use of neighbouring plot values in the analysis of variety trials.
  \emph{Applied Statistics}, 30, 59--70.
  http://doi.org/10.2307/2346657
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

if(require(desplot)){
  desplot(yield~col*row, dat,
          aspect=140/98, tick=TRUE, # true aspect
          main="kempton.barley.uniformity")
}

# ----------------------------------------------------------------------------

\dontrun{

  # Kempton estimated auto-regression coefficients b1=0.10, b2=0.91

  dat <- transform(dat, xf = factor(col), yf=factor(row))
  # asreml3
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

# ----------------------------------------------------------------------------

\dontrun{

  # Kempton estimated auto-regression coefficients b1=0.10, b2=0.91
  
  ## dat <- transform(dat, xf = factor(col), yf=factor(row))
  ## require(asreml4)
  ## m1 <- asreml(yield ~ 1, data=dat, residual = ~ar1(xf):ar1(yf))
  
  ## require(lucid)
  ## vc(m1)
  ## ##       effect component std.error z.ratio bound %ch
  ## ##     xf:yf(R)    0.1044   0.022       4.7     P   0
  ## ## xf:yf!xf!cor    0.2458   0.07484     3.3     U   0
  ## ## xf:yf!yf!cor    0.8186   0.03822    21       U   0

  ## # asreml estimates auto-regression correlations of 0.25, 0.82
  ## # Kempton estimated auto-regression coefficients b1=0.10, b2=0.91

}

# ----------------------------------------------------------------------------

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
rowMeans(out) # 826 1079

# ----------------------------------------------------------------------------

}
