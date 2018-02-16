\name{kempton.slatehall}
\alias{kempton.slatehall}
\docType{data}
\title{
  Slate Hall Farm 1976 spring wheat
}
\description{
  Yields for a Slate Hall Farm 1976 spring wheat trial.
}

\format{
  A data frame with 150 observations on the following 5 variables.
  \describe{
    \item{\code{rep}}{rep, 6 levels}
    \item{\code{row}}{row}
    \item{\code{col}}{column}
    \item{\code{gen}}{genotype, 25 levels}
    \item{\code{yield}}{yield (grams/plot)}
  }
}
\details{
  The trial was a balanced lattice with 25 varieties in 6 replicates,
  10 ranges of 15 columns.  The plot size was 1.5 meters by 4 meters.
  Each row within a rep is an (incomplete) block.

  Field width: 15 columns * 1.5m = 22.5m

  Field length: 10 ranges * 4m = 40m
}
\source{
  R A Kempton and P N Fox. (1997).
  \emph{Statistical Methods for Plant Variety Evaluation},
  Chapman and Hall.  Page 84.

  Julian Besag and David Higdon. 1993.
  Bayesian Inference for Agricultural Field Experiments.
  Bull. Int. Statist. Table 4.1.
}

\references{
  Gilmour, Arthur R and Robin Thompson and Brian R Cullis. (1994).
  Average Information REML: An Efficient Algorithm for Variance
  Parameter Estimation in Linear Mixed Models, \emph{Biometrics},
  51, 1440-1450.
}

\examples{

data(kempton.slatehall)
dat <- kempton.slatehall

# Besag 1993 figure 4.1 (left panel)
if(require(desplot)){
  grays <- colorRampPalette(c("#d9d9d9","#252525"))
  desplot(yield ~ col * row, dat,
          aspect=40/22.5, # true aspect
          num=gen, out1=rep, col.regions=grays, # unknown aspect
          main="kempton.slatehall - spring wheat yields")
}

# ----------------------------------------------------------------------------

\dontrun{
  # Incomplete block model of Gilmour et al 1995
  require(lme4)
  require(lucid)
  dat <- transform(dat, xf=factor(col), yf=factor(row))
  m1 <- lmer(yield ~ gen + (1|rep) + (1|rep:yf) + (1|rep:xf), data=dat)
  vc(m1)
  ##    groups        name variance stddev
  ##  rep:xf   (Intercept)    14810 121.7
  ##  rep:yf   (Intercept)    15600 124.9
  ##  rep      (Intercept)     4262  65.29
  ##  Residual                 8062  89.79
}

# ----------------------------------------------------------------------------

\dontrun{
  # Incomplete block model of Gilmour et al 1995
  # asreml3
  require(asreml)
  m2 <- asreml(yield ~ gen, random = ~ rep/(xf+yf), data=dat)
  
  vc(m2)
  ##          effect component std.error z.ratio constr
  ##     rep!rep.var      4262      6890    0.62    pos
  ##  rep:xf!rep.var     14810      4865    3       pos
  ##  rep:yf!rep.var     15600      5091    3.1     pos
  ##      R!variance      8062      1340    6       pos
  
  # Table 4
  predict(m2, data=dat, classify="gen")$predictions$pvals
}

# ----------------------------------------------------------------------------

\dontrun{
  # Incomplete block model of Gilmour et al 1995
  ## require(asreml4)
  ## require(lucid)
  ## m2 <- asreml(yield ~ gen, random = ~ rep/(xf+yf), data=dat)

  ## vc(m2)
  ## ##   effect component std.error z.ratio bound %ch
  ## ##      rep      4262      6890    0.62     P   0
  ## ##   rep:yf     15600      5091    3.1      P   0
  ## ##   rep:xf     14810      4865    3        P   0
  ## ## units(R)      8062      1340    6        P   0

  ## # Table 4
  ## predict(m2, data=dat, classify="gen")$pvals
  ## ##    gen predicted.value std.error    status
  ## ## 1  G01            1280      60.2 Estimable
  ## ## 2  G02            1550      60.2 Estimable
  ## ## 3  G03            1420      60.2 Estimable
  ## ## 4  G04            1450      60.2 Estimable
  ## ## 5  G05            1530      60.2 Estimable
}

# ----------------------------------------------------------------------------

}
\keyword{datasets}
