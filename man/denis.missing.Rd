\name{denis.missing}
\alias{denis.missing}
\docType{data}
\title{
Multi-environment trial with structured missing values
}
\description{
  Grain yield was measured on 5 genotypes in 26 environments.  Missing
  values were non-random, but structured.
}

\format{
  \describe{
    \item{\code{env}}{Environment factor, 26 levels}
    \item{\code{gen}}{Genotype factor, 5 levels}
    \item{\code{yield}}{Yield}
  }
}

\source{
  Denis, J. B. and C P Baril, 1992, Sophisticated models with numerous missing
  values: The multiplicative interaction model as an example.
  \emph{Biul. Oceny Odmian}, 24--25, 7--31.

  Used with permission of Jean-Baptists Denis.
}
\references{
  H P Piepho, (1999) Stability analysis using the SAS system,
  \emph{Agron Journal}, 91, 154--160.
}

\examples{

data(denis.missing)
dat <- denis.missing

# View missingness structure
require(reshape2)
acast(dat, env~gen, value.var='yield')
require(lattice)
levelplot(yield ~ gen*env, data=dat,
          col.regions=RedGrayBlue,
          main="denis.missing - incidence heatmap")

# Stability variance (Table 3 in Piepho)
require("nlme")
m1 <- lme(yield ~ -1 + gen, data=dat, random= ~ 1|env,
          weights = varIdent(form= ~ 1|gen),
          na.action=na.omit)
svar <- m1$sigma^2 * c(1, coef(m1$modelStruct$varStruct, unc = FALSE))^2
round(svar, 2)
##          G5    G3    G1    G2
## 39.25 22.95 54.36 12.17 23.77
}

