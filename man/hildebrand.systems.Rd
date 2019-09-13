\name{hildebrand.systems}
\alias{hildebrand.systems}
\docType{data}
\title{
  Multi-environment trial of maize for four cropping systems
}
\description{
  Maize yields for four cropping systems at 14 on-farm trials.
}

\format{
  A data frame with 56 observations on the following 4 variables.
  \describe{
    \item{\code{village}}{village, 2 levels}
    \item{\code{farm}}{farm, 14 levels}
    \item{\code{system}}{cropping system}
    \item{\code{yield}}{yield, t/ha}
  }
}
\details{
  Yields from 14 on-farm trials in Phalombe Project region of
  south-eastern Malawi.  The farms were located near two different
  villages.

  On each farm, four different cropping systems were tested.  The
  systems were:
  LM = Local Maize, LMF = Local Maize with Fertilizer,
  CCA = Improved Composite, CCAF = Improved Composite with Fertilizer.
}
\source{
  P. E. Hildebrand, 1984.
  Modified Stability Analysis of Farmer Managed, On-Farm Trials.
  \emph{Agronomy Journal}, 76, 271--274.
  https://doi.org/10.2134/agronj1984.00021962007600020023x
}
\references{
  H. P. Piepho, 1998.
  Methods for Comparing the Yield Stability of Cropping Systems.
  \emph{Journal of Agronomy and Crop Science}, 180, 193--213.
  http://doi.org/10.1111/j.1439-037X.1998.tb00526.x
}

\examples{

library(agridat)
data(hildebrand.systems)
dat <- hildebrand.systems

# Piepho 1998 Fig 1
libs(lattice)
dotplot(yield ~ system, dat, groups=village, auto.key=TRUE,
        main="hildebrand.systems", xlab="cropping system by village")


# Plot of risk of 'failure' of System 2 vs System 1
s11 = .30;  s22 <- .92; s12 = .34
mu1 = 1.35; mu2 = 2.70
lambda <- seq(from=0, to=5, length=20)
system1 <- pnorm((lambda-mu1)/sqrt(s11))
system2 <- pnorm((lambda-mu2)/sqrt(s22))

# A simpler view
plot(lambda, system1, type="l", xlim=c(0,5), ylim=c(0,1),
     xlab="Yield level", ylab="Prob(yield < level)",
     main="hildebrand.systems - risk of failure for each system")
lines(lambda, system2, col="red")

# Prob of system 1 outperforming system 2. Table 8
pnorm((mu1-mu2)/sqrt(s11+s22-2*s12))
# .0331

# ----------------------------------------------------------------------------

\dontrun{
  # asreml3
  libs(asreml)
  # Environmental variance model, unstructured correlations
  
  dat <- dat[order(dat$system, dat$farm),]
  m1 <- asreml(yield ~ system, data=dat, rcov = ~us(system):farm)
  
  # Means, table 5
  p1 <- predict(m1, data=dat, classify="system")$predictions$pvals
  ##  system pred.value std.error  est.stat
  ##     CCA      1.164    0.2816 Estimable
  ##    CCAF      2.657    0.3747 Estimable
  ##      LM      1.35     0.1463 Estimable
  ##     LMF      2.7      0.2561 Estimable
  
  # Variances, table 5
  libs(lucid)
  vc(m1)[c(2,4,7,11),]
  ##              effect component std.error z.ratio constr
  ##    R!system.CCA:CCA    1.11      0.4354     2.5    pos
  ##  R!system.CCAF:CCAF    1.966     0.771      2.5    pos
  ##      R!system.LM:LM    0.2996    0.1175     2.5    pos
  ##    R!system.LMF:LMF    0.9185    0.3603     2.5    pos
  
  # Stability variance model
  m2 <- asreml(yield ~ system, data=dat,
               random = ~ farm,
               rcov = ~ at(system):units)
  p2 <- predict(m2, data=dat, classify="system")$predictions$pvals
  
  # Variances, table 6
  vc(m2)
  ##                effect component std.error z.ratio constr
  ##         farm!farm.var 0.2996       0.1175     2.5    pos
  ##   system_CCA!variance 0.4136       0.1622     2.5    pos
  ##  system_CCAF!variance 1.267        0.4969     2.5    pos
  ##    system_LM!variance 0.0000002        NA      NA  bound
  ##   system_LMF!variance 0.5304       0.208      2.5    pos
}

# ----------------------------------------------------------------------------

\dontrun{
  ## libs(asreml4)
  ## # Environmental variance model, unstructured correlations
  
  ## dat <- dat[order(dat$system, dat$farm),]
  ## m1 <- asreml(yield ~ system, data=dat,
  ##              resid = ~us(system):farm)
  
  ## # Means, table 5
  ## p1 <- predict(m1, data=dat, classify="system")$pvals
  ## ##  system pred.value std.error  est.stat
  ## ##     CCA      1.164    0.2816 Estimable
  ## ##    CCAF      2.657    0.3747 Estimable
  ## ##      LM      1.35     0.1463 Estimable
  ## ##     LMF      2.7      0.2561 Estimable
  
  ## # Variances, table 5
  ## libs(lucid)
  ## vc(m1)[c(2,4,7,11),]
  ## ##              effect component std.error z.ratio constr
  ## ##    R!system.CCA:CCA    1.11      0.4354     2.5    pos
  ## ##  R!system.CCAF:CCAF    1.966     0.771      2.5    pos
  ## ##      R!system.LM:LM    0.2996    0.1175     2.5    pos
  ## ##    R!system.LMF:LMF    0.9185    0.3603     2.5    pos
  
  ## # Stability variance model
  ## m2 <- asreml(yield ~ system, data=dat,
  ##              random = ~ farm,
  ##              resid = ~ dsum( ~ units|system))
  ## m2 <- update(m2)
  ## p2 <- predict(m2, data=dat, classify="system")$pvals
  
  ## # Variances, table 6
  ## vc(m2)
  ## ##                effect component std.error z.ratio constr
  ## ##         farm!farm.var 0.2996       0.1175     2.5    pos
  ## ##   system_CCA!variance 0.4136       0.1622     2.5    pos
  ## ##  system_CCAF!variance 1.267        0.4969     2.5    pos
  ## ##    system_LM!variance 0.0000002        NA      NA  bound
  ## ##   system_LMF!variance 0.5304       0.208      2.5    pos
}


}

