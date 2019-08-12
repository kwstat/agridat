\name{gomez.multilocsplitplot}
\alias{gomez.multilocsplitplot}
\docType{data}
\title{
  Multi-environment trial of rice, split-plot design
}
\description{
  Grain yield was measured at 3 locations with 2 reps per location.
  Within each rep, the main plot was 6 nitrogen fertilizer treatments
  and the sub plot was 2 rice varieties.
}

\format{
  A data frame with 108 observations on the following 5 variables.
  \describe{
    \item{\code{loc}}{location, 3 levels}
    \item{\code{nitro}}{nitrogen in kg/ha}
    \item{\code{rep}}{replicate, 2 levels}
    \item{\code{gen}}{genotype, 2 levels}
    \item{\code{yield}}{yield, kg/ha}
  }
}

\source{
  Gomez, K.A. and Gomez, A.A.. 1984,
  \emph{Statistical Procedures for Agricultural Research}.
  Wiley-Interscience. Page 339.

  Used with permission of Kwanchai Gomez.
}

\examples{

data(gomez.multilocsplitplot)
dat <- gomez.multilocsplitplot
dat$nf <- factor(dat$nitro)

# Gomez figure 8.3
require(lattice)
xyplot(yield~nitro, dat, group=loc, type=c('p','smooth'), auto.key=TRUE,
       main="gomez.multilocsplitplot")

# AOV
# Be careful to use the right stratum, 'nf' appears in both strata.
# Still not quite the same as Gomez table 8.21
t1 <- terms(yield ~ loc * nf * gen + Error(loc:rep:nf),
            "Error", keep.order=TRUE)
m1 <- aov(t1, data=dat)
summary(m1)

\dontrun{
  # F values are somewhat similar to Gomez Table 8.21
  require(lme4)
  m2 <- lmer(yield ~ loc*nf*gen + (1|loc/rep/nf), dat)
  anova(m2)
  ## Analysis of Variance Table
  ##            Df   Sum Sq  Mean Sq F value
  ## loc         2   117942    58971  0.1525
  ## nf          5 72841432 14568286 37.6777
  ## gen         1  7557570  7557570 19.5460
  ## loc:nf     10 10137188  1013719  2.6218
  ## loc:gen     2  4270469  2135235  5.5223
  ## nf:gen      5  1501767   300353  0.7768
  ## loc:nf:gen 10  1502273   150227  0.3885
}

}

