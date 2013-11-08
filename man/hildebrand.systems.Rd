\name{hildebrand.systems}
\alias{hildebrand.systems}
\docType{data}
\title{
  Maize yields for four cropping systems
}
\description{
  Maize yields for four cropping systems at 14 on-farm trials.
}

\format{
  A data frame with 56 observations on the following 4 variables.
  \describe{
    \item{\code{village}}{Village factor, 2 levels}
    \item{\code{farm}}{Farm factor, 14 levels}
    \item{\code{system}}{Cropping system factor, levels \code{LM} \code{LMF} \code{CCA} \code{CCAF}}
    \item{\code{yield}}{Yield, t/ha}
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
  \url{https://www.agronomy.org/publications/aj/abstracts/76/2/AJ0760020271}.
}
\references{
  H. P. Piepho, 1998.
  Methods for Comparing the Yield Stability of Cropping Systems.
  \emph{Journal of Agronomy and Crop Science}, 180, 193--213.
}
\examples{
dat <- hildebrand.systems

# Piepho 1998 Fig 1
dotplot(yield ~ system, dat, groups=village, auto.key=TRUE,
        main="hildebrand.systems", xlab="cropping system by village")

\dontrun{
require("asreml")

# Environmental variance model, unstructured correlations
dat <- dat[order(dat$system, dat$farm),]
m1 <- asreml(yield ~ system, data=dat, rcov = ~us(system):farm)
# Means, table 5
p1 <- predict(m1, classify="system")$predictions$pvals
# system Predicted Std Err    Status
#     LM     1.35   0.1463 Estimable
#    LMF     2.7    0.2561 Estimable
#    CCA     1.164  0.2816 Estimable
#   CCAF     2.657  0.3747 Estimable
# Variances, table 5
summary(m1)$var[c(2,4,7,11),]
#                    component std.error z.ratio constraint
# R!system.LM:LM          0.30      0.12    2.55   Positive
# R!system.LMF:LMF        0.92      0.36    2.55   Positive
# R!system.CCA:CCA        1.11      0.44    2.55   Positive
# R!system.CCAF:CCAF     1.966      0.77    2.55   Positive

# Stability variance model
m2 <- asreml(yield ~ system, data=dat,
             random = ~ farm,
             rcov = ~ at(system):units)
p2 <- predict(m2, classify="system")$predictions$pvals
# Variances, table 6
# vc(m2)
#               Effect  Estimate Std Err Z Ratio Con
#        farm!farm.var 0.2996     0.1175     2.5 Pos
#   system_LM!variance 0.0000002      NA      NA Bnd
#  system_LMF!variance 0.5304     0.208      2.5 Pos
#  system_CCA!variance 0.4136     0.1622     2.5 Pos
# system_CCAF!variance 1.267      0.4969     2.5 Pos

}

# Plot of risk of 'failure' of System 2 vs System 1. Fig 2
s11 = .30;  s22 <- .92; s12 = .34
mu1 = 1.35; mu2 = 2.70
lambda <- seq(from=0, to=5, length=20)
system1 <- pnorm((lambda-mu1)/sqrt(s11))
system2 <- pnorm((lambda-mu2)/sqrt(s22))
plot(system1, system2, xlim=c(0,1), ylim=c(0,1), type="l",
     main="hildebrand.systems")

# A simpler view
plot(lambda, system1, type="l", xlim=c(0,5), ylim=c(0,1),
     xlab="Yield level", ylab="Prob(yield < level)",
     main="hildebrand.systems")
lines(lambda, system2, col="red")

# Prob of system 1 outperforming system 2. Table 8
pnorm((mu1-mu2)/sqrt(s11+s22-2*s12))
# .0331

}

