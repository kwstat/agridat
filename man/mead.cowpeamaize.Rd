\name{mead.cowpeamaize}
\alias{mead.cowpeamaize}
\docType{data}
\title{
  Maize/Cowpea Intercropping experiment
}
\description{
  Maize/Cowpea Intercropping experiment with multiple nitrogen treatments.
}
\usage{data(mead.cowpeamaize)}
\format{
  A data frame with 72 observations on the following 6 variables.
  \describe{
    \item{\code{block}}{Block factor, 3 levels}
    \item{\code{nitro}}{Nitrogen factor, 4 levels}
    \item{\code{cowpea}}{Cowpea variety, 2 levels}
    \item{\code{maize}}{Maize variety, 3 levels}
    \item{\code{cyield}}{Cowpea yield, kg/ha}
    \item{\code{myield}}{Maize yield, kg/ha}
  }
}
\details{
  An intercropping experiment conducted in Nigeria.  The four nitrogen
  treatments were 0, 40, 80, 120 kg/ha.
}
\source{
  Roger Mead. 1990. A Review of Methodology For The Analysis of Intercropping
  Experiments.   Training Working Document No. 6.  CIMMYT.
  \url{http://repository.cimmyt.org/xmlui/handle/10883/868}.
}
\references{
  Roger Mead, 1992.
  Statistical Methods in Agriculture and Experimental Biology, 2nd ed.
  Chapman and Hall.  Page 364.
}
\examples{
dat <- mead.cowpeamaize

# Cowpea and maize yields are clearly in competition
require("latticeExtra")
useOuterStrips(xyplot(myield ~ cyield|maize*cowpea, dat, group=nitro,
                      auto.key=list(columns=4)))

# Mead Table 2 Cowpea yield anova...strongly affected by maize variety.
anova(aov(cyield ~ block + maize + cowpea + nitro +
          maize:cowpea + maize:nitro + cowpea:nitro +
          maize:cowpea:nitro, dat))
# Cowpea mean yields for nitro*cowpea
aggregate(cyield ~ nitro+cowpea, dat, FUN=mean)
# Cowpea mean yields for each maize variety
aggregate(cyield ~ maize, dat, FUN=mean)

# Bivariate analysis
aov.c <- anova(aov(cyield/1000 ~ block + maize + cowpea + nitro +
          maize:cowpea + maize:nitro + cowpea:nitro +
          maize:cowpea:nitro, dat))

aov.m <- anova(aov(myield/1000 ~ block + maize + cowpea + nitro +
          maize:cowpea + maize:nitro + cowpea:nitro +
          maize:cowpea:nitro, dat))

aov.cm <- anova(aov(cyield/1000 + myield/1000 ~ block + maize + cowpea + nitro +
          maize:cowpea + maize:nitro + cowpea:nitro +
          maize:cowpea:nitro, dat))

biv <- cbind(aov.m[,1:2], aov.c[,2], aov.cm[,2])
names(biv) <- c('df','maize ss','cowpea ss','ss for sum')
biv$'sum of prod' <- (biv[,4] - biv[,2] - biv[,3] ) /2
biv$cor <- biv[,5]/(sqrt(biv[,2] * biv[,3]))
signif(biv,2)
}
\keyword{datasets}
