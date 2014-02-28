\docType{methods}
\name{vc}
\alias{vc}
\alias{vc.asreml}
\alias{vc.default}
\alias{vc.lme}
\alias{vc.lmerMod}
\title{Extract variance components from mixed models}
\usage{
  vc(object, ...)

  \method{vc}{default} (object, ...)

  \method{vc}{lmerMod} (object, ...)

  \method{vc}{lme} (object, ...)

  \method{vc}{asreml} (object, gamma = FALSE, ...)
}
\arguments{
  \item{object}{A fitted model object}

  \item{...}{Not used. Extra arguments.}

  \item{gamma}{If gamma=FALSE, then the 'gamma' column is
  omitted from the results}
}
\value{
  A data frame or other object.
}
\description{
  Extract the variance components from a fitted model.
  Currently supports \code{asreml}, \code{lme4}, \code{nlme} objects.

  The extracted variance components are stored in a data frame with an
  additional 'vc.xxx' class that has an associated print method.

}
\examples{
\dontrun{

require("nlme")
data(Rail)
m3 <- lme(travel~1, random=~1|Rail, data=Rail)
vc(m3)
##       effect variance stddev
##  (Intercept)   615.3  24.81
##     Residual    16.17  4.021

require("lme4")
m4 <- lmer(travel~1 + (1|Rail), data=Rail)
vc(m4)
##    groups        name variance stddev
##  Rail     (Intercept)   615.3  24.81
##  Residual                16.17  4.021


require("asreml")
ma <- asreml(travel~1, random=~Rail, data=Rail)
vc(ma)
##         effect component std.error z.ratio constr
##  Rail!Rail.var    615.3      392.6     1.6    pos
##     R!variance     16.17       6.6     2.4    pos

}
}

