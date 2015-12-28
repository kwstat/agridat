\name{gathmann.bt}
\alias{gathmann.bt}
\docType{data}
\title{
  Impact of Bt Corn on non-target species
}
\description{
  Impact of Bt Corn on non-target species
}

\format{
  A data frame with 16 observations on the following 3 variables.
  \describe{
    \item{\code{gen}}{Maize type factor, \code{Bt} \code{ISO}}
    \item{\code{thysan}}{Numeric}
    \item{\code{aranei}}{Numeric}
  }
}
\details{
  The experiment involved comparing a Bt maize and a near-isogenic
  control variety.  Species abundances were measured for
  \emph{Thysanoptera} (thrips) and \emph{Araneida} (spiders)
  in 8 different plots.
  Each response is probably a mean across repeated measurements.
}
\source{
  L. A. Hothorn, 2005.
  Evaluation of Bt-Maize Field Trials by a Proof of Safety.
  \url{http://www.seedtest.org/upload/cms/user/presentation7Hothorn.pdf}

  Used with permission of Achim Gathmann.
}

\examples{

data(gathmann.bt)
dat <- gathmann.bt


# EDA suggests Bt vs ISO is significant for thysan, not for aranei
require(lattice)
if(require(reshape2)){
d2 <- melt(dat)
bwdot=function(x,y,...){
    panel.xyplot(jitter(as.numeric(x)),y,...)
    panel.bwplot(x,y,...)
}
bwplot(value ~ gen|variable, d2,
       main="gathmann.bt", ylab="Insect abundance", panel=bwdot,
       scales=list(relation="free"))
}


\dontrun{

# ----- Parametric CI.  Thysan significant, aranei not significant.
require(equivalence)
th0 <- with(dat, tost(thysan[1:8], thysan[9:16], epsilon=1))
lapply(th0[c("mean.diff","ci.diff")], round, 2)

ar0 <- with(dat, tost(aranei[1:8], aranei[9:16], alpha=.05, epsilon=.4))
lapply(ar0[c("mean.diff","ci.diff")], round, 2)


# ----- Non-parametric exact CI.  Same result.
require(coin)
th1 <- wilcox_test(thysan ~ gen, data=dat, conf.int=TRUE, conf.level=0.9)
lapply(confint(th1), round, 2)

ar1 <- wilcox_test(aranei ~ gen, data=dat, conf.int=TRUE, conf.level=0.9)
lapply(confint(ar1), round, 2)


# ----- Log-transformed exact CI. Same result.
th2 <- wilcox_test(log(thysan) ~ gen, data=dat, alternative=c("two.sided"),
                   conf.int=TRUE, conf.level=0.9)
lapply(confint(th2), function(x) round(exp(x),2))

# ----- Log-transform doesn't work on aranei, but asinh(x/2) does
ar2 <- wilcox_test(asinh(aranei/2) ~ gen, data=dat,
                   alternative=c("two.sided"),
                   conf.int=TRUE, conf.level=0.9)
lapply(confint(ar2), function(x) round(sinh(x)*2,1))

}
}
