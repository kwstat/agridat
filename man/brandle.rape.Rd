\name{brandle.rape}
\alias{brandle.rape}
\docType{data}
\title{
  Three-way table of rape seed yields
}
\description{
  Rape seed yields for 5 genotypes, 2 years, 9 locations.
}

\format{
  A data frame with 135 observations on the following 4 variables.
  \describe{
    \item{\code{gen}}{genotype factor, 5 levels}
    \item{\code{year}}{year, numeric}
    \item{\code{loc}}{loc factor, 9 levels}
    \item{\code{yield}}{yield, kg/ha}
  }
}
\details{
  The yields are the mean of 4 reps.

  Note, in table 2 of Brandle, the value of Triton in 1985 at Bagot is
  shown as 2355.  This should be changed to 2555 to match the means reported
  in the paper.
}
\source{
  Brandle, JE and McVetty, PBE. (1988).
  Genotype x environment interaction and stability analysis of seed
  yield of oilseed rape grown in Manitoba.
  \emph{Canadian Journal of Plant Science}, 68, 381--388.

  Used with permission of P. McVetty.
}

\examples{

dat <- brandle.rape

# Matches table 4 of Brandle
round(tapply(dat$yield, dat$gen, mean),0)

# Brandle reports variance components:
# sigma^2_gl: 9369  gy: 14027 g: 72632 resid: 150000
# Brandle analyzed rep-level data, so the residual variance is different.
# The other components are matched by the following analysis.
if(require(lme4)){
dat$year <- factor(dat$year)
m1 <- lmer(yield ~ year + loc + year:loc + (1|gen) +
           (1|gen:loc) + (1|gen:year), data=dat)
print(VarCorr(m1), comp=c('Variance','Std.Dev.'))
## Groups   Name        Variance Std.Dev.
## gen:loc  (Intercept)  9362.9   96.762
## gen:year (Intercept) 14030.0  118.448
## gen      (Intercept) 72628.5  269.497
## Residual             75008.1  273.876
}

}
\keyword{datasets}
