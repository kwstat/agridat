\name{beall.webworms}
\alias{beall.webworms}
\docType{data}
\title{
  Counts of webworms in a beet field, with insecticide treatments.
}
\description{
  Counts of webworms in a beet field, with insecticide treatments.
}
\usage{data(beall.webworms)}
\format{
  A data frame with 1300 observations on the following 7 variables.
  \describe{
    \item{\code{row}}{row}
    \item{\code{col}}{column}
    \item{\code{y}}{count of webworms}
    \item{\code{block}}{block factor}
    \item{\code{trt}}{treatment factor}
    \item{\code{spray}}{spray treatment Yes/No}
    \item{\code{lead}}{lead treatment Yes/No}
  }
}
\details{

  The beet webworm lays egg masses as small as 1 egg, seldom exceeding 5
  eggs. The larvae can move freely, but usually mature on the plant on
  which they hatch.

  Each plot contained 25 unit areas, each 1 row by 3 feet long.

  Treatment 1 = None.  Treatment 2 = Contact spray. Treatment 3 = Lead
  arsenate. Treatment 4 = Both spray, lead arsenate.

}
\source{
  Beall, Geoffrey (1940).
  The fit and significance of contagious distributions when applied to
  observations on larval insects.
  \emph{Ecology}, 21, 460--474. Table 6.
  http://www.jstor.org/stable/1930285.  
}

\examples{

data(beall.webworms)
dat <- beall.webworms

# Match Beall table 1
with(dat, table(y,trt))
# histogram(~y|trt, data=dat, layout=c(1,4), as.table=TRUE)

# Visualize Beall tble 6.  Block effects may exist, but barely.
require("agrifun")
grays <- colorRampPalette(c("#d9d9d9","#252525"))
desplot(y ~ col*row, data=dat, out1=block, out2=trt, num=trt, flip=TRUE,
        main="beall.webworms (count of worms)",
        col.regions=grays(9))

# Following plot suggests interaction is needed
# with(dat, interaction.plot(spray, lead, y))

# Just a simple model here...
m1 <- glm(y ~ block+spray*lead, data=dat, family="poisson")
summary(m1)

}
\keyword{datasets}
