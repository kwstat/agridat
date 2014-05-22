\name{jansen.strawberry}
\alias{jansen.strawberry}
\docType{data}
\title{
  Ordered disease ratings on strawberry crosses.
}
\description{
  Ordered disease ratings on strawberry crosses.
}
\usage{data(jansen.strawberry)}
\format{
  A data frame with 144 observations on the following 5 variables.
  \describe{
    \item{\code{male}}{male parent}
    \item{\code{female}}{female parent}
    \item{\code{block}}{block factor, 4 levels}
    \item{\code{category}}{a factor with levels \code{C1} \code{C2} \code{C3}}
    \item{\code{count}}{number of plants in each category}
  }
}
\details{
  Red core disease is caused by a fungus, \emph{Phytophtora fragariae}.
  12 populations of strawberries were arranged in four blocks.  In each
  plot, 9 or 10 plants were assessed for damage from the fungus and
  rated as belonging to category C1, C2, or C3 (increasing damage).  The
  12 populations were created from a cross of 3 male parents and 4
  (different) female parents.
}
\source{
  J. Jansen, 1990. On the statistical analysis of ordinal data when
  extravariation is present. \emph{Applied Statistics}, 39, 75-84,
  Table 1. \url{http://www.jstor.org/stable/2347813}
}

\examples{

dat <- jansen.strawberry
dat <- transform(dat, category=ordered(category, levels=c('C1','C2','C3')))

ftable(xtabs(count~male + female + category, data=dat))
mosaicplot(xtabs(count~male + female + category, data=dat),
           color=c("lemonchiffon1","moccasin","lightsalmon1","indianred"),
           main="jansen.strawberry disease ratings",
           xlab="Male parent", ylab="Female parent")

}
\keyword{datasets}
