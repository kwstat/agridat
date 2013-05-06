\name{gathmann.bt}
\alias{gathmann.bt}
\docType{data}
\title{
  Impact of Bt Corn on non-target species
}
\description{
  Impact of Bt Corn on non-target species
}
\usage{data(gathmann.bt)}
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
dat <- gathmann.bt

# EDA suggests Bt vs ISO is significant for thysan, not for aranei
bwdot=function(x,y,...){
    panel.xyplot(jitter(as.numeric(x)),y,...)
    panel.bwplot(x,y,...)
}
bwplot(thysan~gen, dat, panel=bwdot)
bwplot(aranei~gen, dat, panel=bwdot)

\dontrun{
# ----- Parametric CI.  Thysan significant, aranei not significant.
require("equivalence")
tt <- with(dat, tost(thysan[1:8], thysan[9:16], epsilon=1))
lapply(tt[c("mean.diff","ci.diff")], round, 2)

ta <- with(dat, tost(aranei[1:8], aranei[9:16], alpha=.05, epsilon=.4))
lapply(ta[c("mean.diff","ci.diff")], round, 2)

# ----- Non-parametric exact CI.  Same result.
require("exactRankTests")
nont <- with(dat, wilcox.exact(thysan ~ gen, data=dat,
                               exact=TRUE, conf.int=TRUE, conf.level=0.9))
lapply(nont[c("estimate","conf.int")], function(x) round(x,1))

nona <- with(dat, wilcox.exact(aranei ~ gen, data=dat,
                               exact=TRUE, conf.int=TRUE, conf.level=0.9))
lapply(nona[c("estimate","conf.int")], function(x) round(x,2))


# ----- Log-transformed exact CI. Same result.
logt <- with(dat, wilcox.exact(log(thysan) ~ gen, data=dat, 
                             alternative=c("two.sided"), exact=TRUE,
                             conf.int=TRUE, conf.level=0.9))
lapply(logt[c("estimate","conf.int")], function(x) round(exp(x),1))

# ----- Log-transform doesn't work on aranei, but asinh(x/2) does
loga <- with(dat, wilcox.exact(asinh(aranei/2) ~ gen, data=dat, 
                             alternative=c("two.sided"), exact=TRUE,
                             conf.int=TRUE, conf.level=0.9))
lapply(loga[c("estimate","conf.int")], function(x) round(sinh(x)*2,1))

}
}
