\name{besag.triticale}
\alias{besag.triticale}
\docType{data}
\title{
  Four-way factorial agronomic experiment in triticale
}
\description{
  Four-way factorial agronomic experiment in triticale
}
\usage{data("besag.triticale")}
\format{
  A data frame with 54 observations on the following 7 variables.
  \describe{
    \item{\code{yield}}{yield, g/m^2}
    \item{\code{row}}{row}
    \item{\code{col}}{column}
    \item{\code{gen}}{genotype / variety, 3 levels}
    \item{\code{rate}}{seeding rate, kg/ha}
    \item{\code{nitro}}{nitrogen rate, kw/ha}
    \item{\code{regulator}}{growth regulator, 3 levels}
  }
}
\details{
  Experiment conducted as a factorial on the yields of triticale.  Fully
  randomized.  Plots were 1.5m x 5.5m, but the orientation is not clear.

  Besag and Kempton show how accounting for neighbors changes
  non-significant genotype differences into significant differences.
}
\source{
  Julian Besag and Rob Kempton (1986).
  Statistical Analysis of Field Experiments Using Neighbouring Plots.
  \emph{Biometrics}, 42, 231-251. Table 2.

  http://doi.org/10.2307/2531047
}
\references{
  None.
}
\examples{

data(besag.triticale)
dat <- besag.triticale

if(require(desplot)){
  desplot(yield ~ col*row, data=dat,
          # aspect unknown
          main="besag.triticale")
}

# Besag & Kempton are not perfectly clear on the model, but
# indicate that there was no evidence of any two-way interactions.
# A reduced, main-effect model had genotype effects that were
# "close to significant" at the five percent level.
# The model below has p-value of gen at .04, so must be slightly
# different than their model.
dat <- transform(dat, rate=factor(rate), nitro=factor(nitro))
dat <- transform(dat, xf=factor(col), yf=factor(row))
m2 <- lm(yield ~ gen + rate + nitro + regulator + yf, data=dat)
anova(m2)

# Similar, but not exact, to Besag figure 5
dat$res <- resid(m2)
require(lattice)
xyplot(res ~ col|as.character(row), data=dat,
       as.table=TRUE, type="s", layout=c(1,3),
       main="besag.triticale")

# ----------------------------------------------------------------------------

\dontrun{
  ## require(asreml)

  ## # Besag uses an adjustment based on neighboring plots.
  ## # This analysis fits the standard AR1xAR1 residual model

  ## dat <- dat[order(dat$xf, dat$yf), ]
  ## m3 <- asreml(yield ~ gen + rate + nitro + regulator +
  ##                gen:rate + gen:nitro + gen:regulator +
  ##                rate:nitro + rate:regulator +
  ##                nitro:regulator + yf, data=dat,
  ##              rcov = ~ ar1(xf):ar1(yf))
  ## anova(m3) # Strongly significant gen, rate, regulator

}

# ----------------------------------------------------------------------------

\dontrun{
  require(asreml4)

  # Besag uses an adjustment based on neighboring plots.
  # This analysis fits the standard AR1xAR1 residual model

  dat <- dat[order(dat$xf, dat$yf), ]
  m3 <- asreml(yield ~ gen + rate + nitro + regulator +
                 gen:rate + gen:nitro + gen:regulator +
                 rate:nitro + rate:regulator +
                 nitro:regulator + yf, data=dat,
               resid = ~ ar1(xf):ar1(yf))
  wald(m3) # Strongly significant gen, rate, regulator
  ##                 Df Sum of Sq Wald statistic Pr(Chisq)    
  ## (Intercept)      1   1288255        103.971 < 2.2e-16 ***
  ## gen              2    903262         72.899 < 2.2e-16 ***
  ## rate             1    104774          8.456  0.003638 ** 
  ## nitro            1       282          0.023  0.880139    
  ## regulator        2    231403         18.676 8.802e-05 ***
  ## yf               2      3788          0.306  0.858263    
  ## gen:rate         2      1364          0.110  0.946461    
  ## gen:nitro        2     30822          2.488  0.288289    
  ## gen:regulator    4     37269          3.008  0.556507    
  ## rate:nitro       1      1488          0.120  0.728954    
  ## rate:regulator   2     49296          3.979  0.136795    
  ## nitro:regulator  2     41019          3.311  0.191042    
  ## residual (MS)          12391                             

}

}
\keyword{datasets}
