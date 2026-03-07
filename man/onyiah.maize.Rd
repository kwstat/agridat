\name{onyiah.maize}
\alias{onyiah.maize}
\docType{data}
\title{
  Graeco-Latin experiment with maize
}
\description{
  Graeco-Latin experiment with maize
}
\usage{data("onyiah.maize")}
\format{
  A data frame with 20 observations on the following 5 variables.
  \describe{
    \item{\code{loc}}{location}
    \item{\code{gen}}{maize genotype}
    \item{\code{greek}}{spacing}
    \item{\code{latin}}{fertilizer level}
    \item{\code{yield}}{yield per hectare}
  }
}
\details{
  In a multi-location variety trial of maize, there were two additional
  treatment factors: spacing (greek) and fertilizer (Latin).

  Data provenance: Typed by K.Wright.
}
\source{
  Leonard C. Onyiah (2008).
  Design and Analysis of Experiments: Classical and Regression Approaches with SAS.
  https://books.google.com/books?id=_P3LBQAAQBAJ&pg=PA334
}
\references{
  None
}
\examples{
\dontrun{
  library(agridat)
  data(onyiah.maize)
  dat <- onyiah.maize
  
  # anova
  dat <- transform(dat, loc=factor(loc), gen=factor(gen),
                   greek=factor(greek), latin=factor(latin))
  m1 <- aov(yield ~ loc + gen + greek + latin, data=dat)
  anova(m1)
  
}
}
\keyword{datasets}
