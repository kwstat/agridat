\name{yates.oats}
\alias{yates.oats}
\docType{data}
\title{
  Yield of oats in a split-plot experiment
}
\description{
  
  The yield of oats from a split-plot field trial.

  Varieties were applied to the main plots.

  Manurial (nitrogen) treatments were applied to the sub-plots.

  Each plot is 1/80 acre = 28.4 links * 44 links.
  
  Field length: 18 rows * 28.4 links = 511 links

  Field width: 4 plots * 44 links = 176 links
}

\format{
  \describe{
    \item{\code{block}}{block, 6 levels}
    \item{\code{nitro}}{nitrogen treatment in hundredweight per acre}
    \item{\code{gen}}{genotype, 3 levels}
    \item{\code{yield}}{yield in 1/4 lbs per sub-plot, each 1/80 acre.}
    \item{\code{col}}{column}
    \item{\code{row}}{row}
  }
}

\source{
  
  Yates, Frank (1935) Complex experiments,
  \emph{Journal of the Royal Statistical Society Suppl}
  2, 181-247. Figure 2.
  
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
          out1=block, text=gen, col=nitro,
          cex=1, aspect=511/176, # true aspect
          main="yates.oats")
}


# Roughly linear gradient across the field.  The right-half of each
# block has lower yield.  The blocking is inadequate!
require("lattice")
xyplot(yield ~ col|factor(nitro), dat,
       type = c('p', 'r'), xlab='col', as.table = TRUE,
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
  AIC(m3,m4)
  ##    df      AIC
  ## m3  9 581.2372
  ## m4 10 557.9424 # Substantially better
}

\dontrun{

  # Marginal predictions from lsmeans package and asreml::predict

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
  predict(m5a, data=dat, classify="gen")$predictions$pvals

}

\dontrun{

  # Demonstrate use of regress package, compare to lme

  library(regress)
  dat$nitrof <- factor(dat$nitro)
  m6 <- regress(yield ~ nitrof + gen, ~block + I(block:gen), identity=TRUE,
                verbose=1, data=dat)
  summary(m6)
  ## Variance Coefficients:
  ##                Estimate Std. Error
  ##   block         214.468    168.794
  ##   I(block:gen)  109.700     67.741
  ##   In            162.558     32.189

  # ordinal causes clash with VarCorr
  if(is.element("package:ordinal", search())) detach(package:ordinal)
  
  m7 <- lme(yield ~ nitrof + gen, random = ~ 1|block/gen, data=dat)
  VarCorr(m7)
  ##             Variance     StdDev  
  ## block =     pdLogChol(1)         
  ## (Intercept) 214.4716     14.64485
  ## gen =       pdLogChol(1)         
  ## (Intercept) 109.6929     10.47344
  ## Residual    162.5591     12.74987

}

}
