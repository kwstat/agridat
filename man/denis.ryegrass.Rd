\name{denis.ryegrass}
\alias{denis.ryegrass}
\docType{data}
\title{
  Multi-environment trial of perennial ryegrass in France
}
\description{
  Plant strength of perennial ryegrass in France for 21 genotypes at 7
  locations.
}

\format{
  A data frame with 147 observations on the following 3 variables.
  \describe{
    \item{\code{gen}}{genotype, 21 levels}
    \item{\code{loc}}{location, 7 levels}
    \item{\code{strength}}{average plant strength * 100}
  }
}
\details{
  INRA conducted a breeding trial in western France with 21 genotypes at
  7 locations.  The observed data is 'strength' averaged over 7-10
  plants per plot and three plots per location (after adjusting for
  blocking effects).  Each plant was scored on a scale 0-9.

  The original data had a value of 86.0 for genotype G1 at location
  L4--this was replaced by an additive estimated value of 361.2 as in
  Gower and Hand (1996).
}
\source{
  Jean-Baptiste Denis and John C. Gower, 1996.
  Asymptotic confidence regions for biadditive models:
  interpreting genotype-environment interaction,
  \emph{Applied Statistics}, 45, 479-493.
  http://doi.org/10.2307/2986069
}
\references{
  Gower, J.C. and Hand, D.J., 1996.  Biplots.
  Chapman and Hall.
}

\examples{

data(denis.ryegrass)
dat <- denis.ryegrass

# biplots (without ellipses) similar to Denis figure 1 
if(require(gge)){
  m1 <- gge(strength ~ gen*loc, dat, scale=FALSE)
  biplot(m1, title="denis.ryegrass biplot")
}

# anova(aov(strength ~ gen + loc, dat))

}
\keyword{datasets}
