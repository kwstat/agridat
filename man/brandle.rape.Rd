\name{brandle.rape}
\alias{brandle.rape}
\docType{data}
\title{
  Multi-environment trial of rape in Manitoba
}
\description{
  Rape seed yields for 5 genotypes, 3 years, 9 locations.
}

\format{
  A data frame with 135 observations on the following 4 variables.
  \describe{
    \item{\code{gen}}{genotype}
    \item{\code{year}}{year, numeric}
    \item{\code{loc}}{location, 9 levels}
    \item{\code{yield}}{yield, kg/ha}
  }
}
\details{
  The yields are the mean of 4 reps.

  Note, in table 2 of Brandle, the value of Triton in 1985 at Bagot is
  shown as 2355, but should be 2555 to match the means reported
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
\dontrun{

library(agridat)
data(brandle.rape)
dat <- brandle.rape

libs(lattice)
dotplot(gen~yield|loc, dat, group=year, auto.key=list(columns=3),
        main="brandle.rape, yields per location", ylab="Genotype")

# Matches table 4 of Brandle
# round(tapply(dat$yield, dat$gen, mean),0)

# Brandle reports variance components:
# sigma^2_gl: 9369  gy: 14027 g: 72632 resid: 150000
# Brandle analyzed rep-level data, so the residual variance is different.
# The other components are matched by the following analysis.

libs(lme4)
libs(lucid)
dat$year <- factor(dat$year)
m1 <- lmer(yield ~ year + loc + year:loc + (1|gen) +
             (1|gen:loc) + (1|gen:year), data=dat)
vc(m1)
##      grp        var1 var2  vcov  sdcor
##  gen:loc (Intercept) <NA>  9363  96.76
## gen:year (Intercept) <NA> 14030 118.4
##      gen (Intercept) <NA> 72630 269.5
## Residual        <NA> <NA> 75010 273.9
  
}
}
\keyword{datasets}
