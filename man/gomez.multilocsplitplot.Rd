\name{gomez.multilocsplitplot}
\alias{gomez.multilocsplitplot}
\docType{data}
\title{
Rice multilocation Split-Plot
}
\description{
  Grain yield was measured at 3 locations with 3 reps per location.
  Within each rep, the main plot was 6 nitrogen fertilizer treatments
  and the sub plot was 2 rice varieties.
}
\usage{data(gomez.multilocsplitplot)}
\format{
  A data frame with 108 observations on the following 5 variables.
  \describe{
    \item{\code{loc}}{Location factor, 3 levels}
    \item{\code{nitro}}{Nitrogen in kg/ha}
    \item{\code{rep}}{Rep factor, 3 levels}
    \item{\code{gen}}{Genotype factor, 2 levels}
    \item{\code{yield}}{Yield in kg/ha}
  }
}

\source{
  Gomez, K.A. and Gomez, A.A.. 1984,
  \emph{Statistical Procedures for Agricultural Research}.
  Wiley-Interscience. Page 339.
  
  Used with permission of Kwanchai Gomez.
}
\examples{
dat <- gomez.multilocsplitplot

# Gomez figure 8.3
xyplot(yield~nitro, dat, group=loc, type=c('p','smooth'), auto.key=TRUE)

# AOV
# Be careful to use the right stratum, 'nf' appears in both strata.
# Still not quite the same as Gomez table 8.21
dat$nf <- factor(dat$nitro)
t1 <- terms(yield ~ loc * nf * gen + Error(loc:rep:nf),
            "Error", keep.order=TRUE)
m1 <- aov(t1, data=dat)
summary(m1)

# F values are somewhat similar to Gomez Table 8.21
require(lme4)
m2 <- lmer(yield ~ loc*nf*gen + (1|loc/rep/nf), dat)
anova(m2)

}

