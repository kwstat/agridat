\name{holshouser.splitstrip}
\alias{holshouser.splitstrip}
\docType{data}
\title{
  Split strip plot on soybeans
}
\description{
  Split strip plot on soybeans
}

\format{
  A data frame with 160 observations on the following 8 variables.
  \describe{
    \item{\code{block}}{block factor, 4 levels}
    \item{\code{plot}}{plot number}
    \item{\code{cultivar}}{cultivar factor, 4 levels}
    \item{\code{spacing}}{row spacing, numeric}
    \item{\code{pop}}{population, numeric (thousand per acre)}
    \item{\code{yield}}{yield, a numeric vector}
    \item{\code{row}}{row number}
    \item{\code{col}}{column number}
  }
}
\details{
  Within each block, cultivars were whole plots.  Withing whole plots,
  spacing was applied in strips vertically, and population was applied
  in strips horizontally.
}

\source{
  Schabenberger, Oliver and Francis J. Pierce. 2002.
  \emph{Contemporary Statistical Models for the Plant and Soil
    Sciences}. CRC Press, Boca Raton, FL.  Page 493.

  Used with permission of David Holshouser at Virginia Polytechnic.
}

\examples{

data(holshouser.splitstrip)
dat <- holshouser.splitstrip
dat$spacing <- factor(dat$spacing)
dat$pop <- factor(dat$pop)

# Experiment layout and field trends
desplot(spacing ~ col*row, data=dat, out1=block, out2=cultivar,
        col=cultivar, text=pop, cex=.8, shorten='none', col.regions=c('wheat','white'),
        main="holshouser.splitstrip experiment design")
desplot(yield ~ col*row, data=dat, out1=block,
        main="holshouser.splitstrip")

# Overall main effects and interactions
if(require(HH)){
  interaction2wt(yield~cultivar*spacing*pop, dat,
                 main="holshouser.splitstrip")
}

## Schabenberger's SAS model, page 497
## proc mixed data=splitstripplot;
##   class block cultivar pop spacing;
##   model yield = cultivar spacing spacing*cultivar pop pop*cultivar
##                 spacing*pop spacing*pop*cultivar / ddfm=satterth;
##   random block block*cultivar block*cultivar*spacing block*cultivar*pop;
## run;

## Now lme4. This design has five error terms--four are explicitly given.
if(require(lme4) & require(lucid)){
  m1 <- lmer(yield ~ cultivar * spacing * pop +
               (1|block) + (1|block:cultivar) + (1|block:cultivar:spacing) +
                 (1|block:cultivar:pop), data=dat)
  vc(m1) ## Variances match Schabenberger, page 498.
##                    grp        var1 var2   vcov  sdcor
##     block:cultivar:pop (Intercept) <NA> 2.421  1.556
## block:cultivar:spacing (Intercept) <NA> 1.244  1.116
##         block:cultivar (Intercept) <NA> 0.4523 0.6725
##                  block (Intercept) <NA> 3.037  1.743
##               Residual        <NA> <NA> 3.928  1.982

}

}
\keyword{datasets}
