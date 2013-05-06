\name{snedecor.asparagus}
\alias{snedecor.asparagus}
\docType{data}
\title{
  Asparagus yields for different cutting treatments
}
\description{
  Asparagus yields for different cutting treatments, in 4 years.
}
\usage{data(snedecor.asparagus)}
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
  STatistical Advisory & Training Service Pty Ltd.
}
\examples{
data(snedecor.asparagus)

dat <- snedecor.asparagus

dat <- transform(dat, year=factor(year))
dat$trt <- factor(dat$trt,
                  levels=c("Jun-01", "Jun-15", "Jul-01", "Jul-15"))
# Continued cutting reduces plant vigor and yield
dotplot(yield ~ trt|year, data=dat,
        main="Yield in each year for different cutting treatments")

# Split-plot
require(lme4)
m1 <- lmer(yield ~ trt + year + trt:year + (1|block) + (1|block:trt), data=dat)

\dontrun{
# Split-plot with asreml
m2 <- asreml(yield ~ trt + year + trt:year, data=dat,
             random = ~ block + block:trt)
summary(m2)$varcomp

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
vc <- summary(m3)$varcomp
#                         gamma    component    std.error    z.ratio
# block!block.var  86.561895082 86.561895082 1.568621e+02  0.5518344
# R!variance        1.000000000  1.000000000           NA         NA
# R!year.1930:1930  0.002334098  0.002334098 1.056378e-03  2.2095294
# R!year.1931:1930 -0.716912985 -0.716912985 4.528335e-01 -1.5831713
# R!year.1931:1931  0.001157711  0.001157711 4.802921e-04  2.4104308
# R!year.1932:1931 -1.138914965 -1.138914965 1.961619e-01 -5.8059955
# R!year.1932:1932  0.002081314  0.002081314 8.514173e-04  2.4445288
# R!year.1933:1932 -0.678201750 -0.678201750 1.554912e-01 -4.3616722
# R!year.1933:1933  0.002011556  0.002011556 8.305976e-04  2.4218174
U <-  diag(4)
U[1,2] <- vc[4,2] ; U[2,3] <- vc[6,2] ; U[3,4] <- vc[8,2]
Dinv <- diag(c(vc[3,2], vc[5,2], vc[7,2], vc[9,2]))
solve(U %*% Dinv %*% t(U)) # same as 'covmat' above
}

}
\keyword{datasets}
