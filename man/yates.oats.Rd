\name{yates.oats}
\alias{yates.oats}
\docType{data}
\title{
  Yield of oats in a split-block experiment
}
\description{
  The yield of oats from a split-plot field trial using three varieties
  and four levels of manurial treatment. The experiment was laid out in
  6 blocks of 3 main plots, each split into 4 sub-plots. The varieties
  were applied to the main plots and the manurial (nitrogen) treatments
  to the sub-plots.
}

\format{
  \describe{
    \item{\code{block}}{block factor with 6 levels}
    \item{\code{nitro}}{nitrogen treatment in hundredweight per acre}
    \item{\code{gen}}{genotype factor, 3 levels}
    \item{\code{yield}}{yield in 1/4 lbs per sub-plot, each 1/80 acre.}
    \item{\code{col}}{column}
    \item{\code{row}}{row}
  }
}

\source{
  Yates, Frank (1935) Complex experiments,
  \emph{Journal of the Royal Statistical Society Suppl}. 2, 181-247.
  http://doi.org/10.2307/2983638
}

\references{
  Venables, W. N. and Ripley, B. D. (2002)
  \emph{Modern Applied Statistics with S}. Fourth edition. Springer.
}

\examples{

data(yates.oats)
dat <- yates.oats

if(require(desplot)){
  desplot(yield ~ col*row, dat,
          out1=block, text=gen, col=nitro, cex=1,
          main="yates.oats")
}


# Roughly linear gradient across the field.  The right-half of each
# block has lower yield.  The blocking is inadequate!
require("lattice")
xyplot(yield ~ col|factor(nitro), dat,
       type = c('p', 'smooth'), xlab='col', span=1, as.table = TRUE,
       main="yates.oats")

# Typical split-plot analysis
if(require(lme4)){
m3 <- lmer(yield ~ nitro * gen + (1|block/gen), data=dat)
# Residuals still show structure
xyplot(resid(m3) ~ dat$col, xlab='col', type=c('p','smooth'),
       main="yates.oats")

# Add a linear trend for column
m4 <- lmer(yield ~ col + nitro * gen + (1|block/gen), data=dat)
# xyplot(resid(m4) ~ dat$col, type=c('p','smooth'), xlab='col')

## Compare fits
## AIC(m3,m4)
##    df      AIC
## m3  9 581.2372
## m4 10 557.9424
}

\dontrun{

  # Demonstrate the use of the lsmeans package and asreml::predict

  # --- nlme ---
  require(nlme)
  require(lsmeans)
  dat2 <- yates.oats[-c(1,2,3,5,8,13,21,34,55),]
  m5l <- lme(yield ~ factor(nitro) + gen, random = ~1 | block/gen,
             data = dat2)

  # --- asreml ---
  require(asreml)
  m5a <- asreml(yield ~ factor(nitro) + gen,
                random = ~ block + block:gen, data=dat2)

  require(lucid)
  vc(m5l)
  vc(m5a)

  lsmeans(m5l, "gen")
  predict(m5a, classify="gen")$predictions$pvals

}

}
