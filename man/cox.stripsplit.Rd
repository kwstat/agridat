\name{cox.stripsplit}
\alias{cox.stripsplit}
\docType{data}
\title{
  Strip-split-plot of barley with fertilizer, calcium, and soil factors.
}
\description{
  Strip-split-plot of barley with fertilizer, calcium, and soil factors.
}

\format{
  A data frame with 96 observations on the following 5 variables.
  \describe{
    \item{\code{rep}}{replicate, 4 levels}
    \item{\code{soil}}{soil, 3 levels}
    \item{\code{fert}}{fertilizer, 4 levels}
    \item{\code{calcium}}{calcium, 2 levels}
    \item{\code{yield}}{yield of winter barley}
  }
}
\details{
  Four different fertilizer treatments are laid out in vertical
  strips, which are then split into subplots with different levels of
  calcium. Soil type is stripped across the split-plot experiment, and the
  entire experiment is then replicated three times.

  Sometimes called a split-block design.
}
\source{
  Comes from the notes of Gertrude Cox and A. Rotti.
}
\references{
  SAS/STAT(R) 9.2 User's Guide, Second Edition.
  Example 23.5 Strip-Split Plot.
  http://support.sas.com/documentation/cdl/en/statug/63033/HTML/default/viewer.htm#statug_anova_sect030.htm
}

\examples{

data(cox.stripsplit)
dat <- cox.stripsplit

# Raw means
aggregate(yield ~ calcium, data=dat, mean)
aggregate(yield ~ soil, data=dat, mean)
aggregate(yield ~ calcium, data=dat, mean)

if(require(HH)) {
  interaction2wt(yield ~ rep + soil + fert + calcium, dat,
                 x.between=0, y.between=0,
                 main="cox.stripsplit")
}

# Traditional AOV
m1 <- aov(yield~ fert*calcium*soil +
          Error(rep/(fert+soil+calcium:fert+soil:fert)),
          data=dat)
summary(m1)

# With balanced data, the following are all basically identical

if(require(lme4)){
  # The 'rep:soil:fert' term causes problems...so we drop it.
  m2 <- lmer(yield ~ fert*soil*calcium + (1|rep) + (1|rep:fert) +
               (1|rep:soil) + (1|rep:fert:calcium), data=dat)
}

# ----------------------------------------------------------------------------

\dontrun{

  # afex uses Kenword-Rogers approach for denominator d.f.
  if(require(afex)){
    mixed(yield ~ fert*soil*calcium + (1|rep) + (1|rep:fert) +
            (1|rep:soil) + (1|rep:fert:calcium) + (1|rep:soil:fert), data=dat,
          control=lmerControl(check.nobs.vs.rankZ="ignore"))
    ##              Effect      stat ndf     ddf F.scaling p.value
    ## 1       (Intercept) 1350.8113   1  3.0009         1  0.0000
    ## 2              fert    3.5619   3  9.0000         1  0.0604
    ## 3              soil    3.4659   2  6.0000         1  0.0999
    ## 4           calcium    1.8835   1 12.0000         1  0.1950
    ## 5         fert:soil    1.2735   6 18.0000         1  0.3179
    ## 6      fert:calcium    4.4457   3 12.0000         1  0.0255
    ## 7      soil:calcium    0.2494   2 24.0000         1  0.7813
    ## 8 fert:soil:calcium    0.3504   6 24.0000         1  0.9027
  }
}

}

