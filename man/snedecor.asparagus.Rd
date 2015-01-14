\name{snedecor.asparagus}
\alias{snedecor.asparagus}
\docType{data}
\title{
  Asparagus yields for different cutting treatments
}
\description{
  Asparagus yields for different cutting treatments, in 4 years.
}

\format{
  A data frame with 64 observations on the following 4 variables.
  \describe{
    \item{\code{block}}{block factor, 4 levels}
    \item{\code{year}}{year, numeric}
    \item{\code{trt}}{treatment factor of final cutting date}
    \item{\code{yield}}{yield, ounces}
  }
}
\details{
  Planted in 1927.  Cutting began in 1929.  Yield is the weight of
  asparagus cuttings up to Jun 1 in each plot.  Some plots received continued
  cuttings until Jun 15, Jul 1, and Jul 15.
}
\source{
  Snedecor and Cochran, 1989. \emph{Statistical Methods}.
}
\references{
  Mick O'Neill, 2010. \emph{A Guide To Linear Mixed Models In An
    Experimental Design Context}.
  Statistical Advisory & Training Service Pty Ltd.
}

\examples{

data(snedecor.asparagus)
dat <- snedecor.asparagus

dat <- transform(dat, year=factor(year))
dat$trt <- factor(dat$trt,
                  levels=c("Jun-01", "Jun-15", "Jul-01", "Jul-15"))
# Continued cutting reduces plant vigor and yield
require(lattice)
dotplot(yield ~ trt|year, data=dat,
        xlab="Cutting treatment", main="snedecor.asparagus")

# Split-plot
if(require(lme4)){
m1 <- lmer(yield ~ trt + year + trt:year + (1|block) + (1|block:trt), data=dat)
}

\dontrun{
# Split-plot with asreml
require(asreml)
  m2 <- asreml(yield ~ trt + year + trt:year, data=dat,
             random = ~ block + block:trt)

require(lucid)
vc(m2)
##               effect component std.error z.ratio constr
##      block!block.var     476.7     518.2    0.92    pos
##  block:trt!block.var     499.7     287.4    1.7     pos
##           R!variance     430.2     101.4    4.2     pos

# Antedependence with asreml.  See O'Neill (2010).
dat <- dat[order(dat$block, dat$trt), ]
m3 <- asreml(yield ~ year * trt, data=dat,
             random = ~ block,
             rcov = ~ block:trt:ante(year,1))

# Extract the covariance matrix for years and convert to correlation
covmat <- diag(4)
covmat[upper.tri(covmat,diag=TRUE)] <- m3$R.param$R$year$initial
covmat[lower.tri(covmat)] <- t(covmat)[lower.tri(covmat)]
round(cov2cor(covmat),2) # correlation among the 4 years
#      [,1] [,2] [,3] [,4]
# [1,] 1.00 0.45 0.39 0.31
# [2,] 0.45 1.00 0.86 0.69
# [3,] 0.39 0.86 1.00 0.80
# [4,] 0.31 0.69 0.80 1.00

# We can also build the covariance Sigma by hand from the estimated
# variance components via: Sigma^-1 = U D^-1 U'
vv <- vc(m3)
print(vv)
##            effect component std.error z.ratio constr
##   block!block.var  86.56    156.9        0.55    pos
##        R!variance   1              NA      NA    fix
##  R!year.1930:1930   0.00233   0.00106    2.2   uncon
##  R!year.1931:1930  -0.7169    0.4528    -1.6   uncon
##  R!year.1931:1931   0.00116   0.00048    2.4   uncon
##  R!year.1932:1931  -1.139     0.1962    -5.8   uncon
##  R!year.1932:1932   0.00208   0.00085    2.4   uncon
##  R!year.1933:1932  -0.6782    0.1555    -4.4   uncon
##  R!year.1933:1933   0.00201   0.00083    2.4   uncon

U <- diag(4)
U[1,2] <- vv[4,2] ; U[2,3] <- vv[6,2] ; U[3,4] <- vv[8,2]
Dinv <- diag(c(vv[3,2], vv[5,2], vv[7,2], vv[9,2]))
solve(U %*% Dinv %*% t(U)) # same as 'covmat' above
##          [,1]      [,2]      [,3]      [,4]
## [1,] 428.4310  307.1478  349.8152  237.2453
## [2,] 307.1478 1083.9717 1234.5516  837.2751
## [3,] 349.8152 1234.5516 1886.5150 1279.4378
## [4,] 237.2453  837.2751 1279.4378 1364.8446

}

}
\keyword{datasets}
