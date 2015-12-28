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
  There were 3 male strawberry plants and 4 different female strawberry
  plants that were crossed to create 12 populations.

  The experiment had four blocks with 12 plots each (one for each
  population).  In each plot, 9 or 10 plants were assessed for damage
  from fungus and rated as belonging to category C1, C2, or C3
  (increasing damage).
  
  Red core disease is caused by a fungus, \emph{Phytophtora fragariae}.

}
\source{
  J. Jansen, 1990. On the statistical analysis of ordinal data when
  extravariation is present. \emph{Applied Statistics}, 39, 75-84,
  Table 1.
  \url{http://doi.org/10.2307/2347813}

  Used with permission of Hans Jansen.
}

\examples{

data(jansen.strawberry)
dat <- jansen.strawberry
dat <- transform(dat, category=ordered(category, levels=c('C1','C2','C3')))

ftable(xtabs(count~male + female + category, data=dat))
mosaicplot(xtabs(count~male + female + category, data=dat),
           color=c("lemonchiffon1","moccasin","lightsalmon1","indianred"),
           main="jansen.strawberry disease ratings",
           xlab="Male parent", ylab="Female parent")

# Todo: Need an example model

}
\keyword{datasets}
