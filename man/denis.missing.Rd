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
\usage{data(denis.missing)}
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
dat <- denis.missing

# View missingness structure
require("reshape2")
m1 <- melt(dat, measure.var='yield')
acast(m1, env~gen)

# Stability variance (Table 3 in Piepho)
library("nlme")
dat.lme <- lme(yield ~ -1 + gen, data=dat, random= ~ 1|env,
               weights = varIdent(form= ~ 1|gen),
               na.action=na.omit)
dat.lme$sigma^2 * c(1, coef(dat.lme$modelStruct$varStruct, unc = FALSE))^2

}

