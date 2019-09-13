\name{depalluel.sheep}
\alias{depalluel.sheep}
\docType{data}
\title{
  Latin square of four breeds of sheep with four diets
}
\description{
  Latin square of four breeds of sheep with four diets
}
\usage{data("depalluel.sheep")}
\format{
  A data frame with 32 observations on the following 5 variables.
  \describe{
    \item{\code{food}}{diet}
    \item{\code{animal}}{animal number}
    \item{\code{breed}}{sheep breed}
    \item{\code{weight}}{weight, pounds}
    \item{\code{date}}{months after start}
  }
}
\details{
  
  This may be the earliest known Latin Square experiment.

  Four sheep from each of four breeds were randomized to four feeds and
  four slaughter dates.

  Sheep that eat roots will eat more than sheep eating corn, but each
  acre of land produces more roots than corn.

  de Palleuel said: In short, by adopting the use of roots, instead of
  corn, for the fattening of all sorts of cattle, the farmers in the
  neighborhood of the capital will not only gain great profit
  themselves, but will also very much benefit the public by supplying
  this great city with resources, and preventing the sudden rise of meat
  in her markets, which is often considerable.

}
\source{
  M. Crette de Palluel (1788).
  On the advantage and economy of feeding sheep in the house with roots.
  \emph{Annals of Agriculture}, 14, 133-139.
  https://books.google.com/books?id=LXIqAAAAYAAJ&pg=PA133
}

\references{
  None
}

\examples{

library(agridat)

data(depalluel.sheep)
dat <- depalluel.sheep

# Not the best view...weight gain is large in the first month, then slows down
# and the linear line hides this fact
libs(lattice)
xyplot(weight ~ date|food, dat, group=animal, type='l', auto.key=list(columns=4),
       xlab="Months since start",
       main="depalluel.sheep")
}
\keyword{datasets}
