\name{talbot.potato}
\alias{talbot.potato}
\alias{talbot.potato.traits}
\alias{talbot.potato.yield}

\docType{data}
\title{
  Multi-environment trial of potato in UK, yields and trait scores at 12 locations
}
\description{
  Yield and 14 trait scores for each of 9 potato varieties at 12
  locations in UK.
}

\usage{
data("talbot.potato.traits")
data("talbot.potato.yield")
}

\format{

  The \code{talbot.potato.yield} dataframe has 126 observations on the following 3 variables.
  \describe{
    \item{\code{gen}}{genotype/variety}
    \item{\code{trait}}{trait}
    \item{\code{score}}{trait score, 1-9}
  }

  The \code{talbot.potato.yield} dataframe has 108 observations on the following 3 variables.
  \describe{
    \item{\code{gen}}{genotype/variety}
    \item{\code{loc}}{location/center}
    \item{\code{yield}}{yield, t/ha}
  }

}

\details{
  
  The \code{talbot.potato.yield} dataframe contains mean tuber yields
  (t/ha) of 9 varieties of potato at 12 centers in the United Kingdom
  over five years 1983-1987.  The following abbreviations are used for
  the centers.

  \tabular{ll}{
    BU \tab Bush \cr
    CA \tab Cambridge \cr
    CB \tab Conon Bridge \cr
    CC \tab Crossacreevy \cr
    CP \tab Cockle Park \cr
    CR \tab Craibstone \cr
    GR \tab Greenmount \cr
    HA \tab Harper Adams \cr
    MO \tab Morley \cr
    RO \tab Rosemaund \cr
    SB \tab Sutton Bonnington \cr
    TE \tab Terrington \cr
  }

}

\source{
  Mike Talbot and A V Wheelwright, 1989,
  The analysis of genotype x analysis interactions by partial
  least squares regression.
  \emph{Biuletyn Oceny Odmian}, 21/22, 19--25.

  Used with permission of Mike Talbot.
}

\examples{
\dontrun{

library(agridat)

libs(pls, reshape2)

data(talbot.potato.traits)
datt <- talbot.potato.traits
data(talbot.potato.yield)
daty <- talbot.potato.yield

datt <- acast(datt, gen ~ trait, value.var='score')
daty <- acast(daty, gen ~ loc, value.var='yield')  

# Transform columns to zero mean and unit variance
datt <- scale(datt)
daty <- scale(daty)

m1 <- plsr(daty ~ datt, ncomp=3)
summary(m1)

# Loadings factor 1
lo <- loadings(m1)[,1,drop=FALSE]
round(-1*lo[order(-1*lo),1,drop=FALSE],2)

biplot(m1, main="talbot.potato - biplot")

}
}

