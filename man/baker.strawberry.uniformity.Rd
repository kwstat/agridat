\name{baker.strawberry.uniformity}
\alias{baker.strawberry.uniformity}
\docType{data}
\title{
  Uniformity trial of strawberry
}
\description{
  Uniformity trial of strawberry
}
\usage{data("baker.strawberry.uniformity")}
\format{
  A data frame with 700 observations on the following 4 variables.
  \describe{
    \item{\code{trial}}{a factor with levels \code{T1} \code{T2}}
    \item{\code{row}}{a numeric vector}
    \item{\code{col}}{a numeric vector}
    \item{\code{yield}}{a numeric vector}
  }
}
\details{
  In trial T1, 200 plants were grown in two double-row beds at Davis,
  CA, in 1946. The rows were 1 foot apart. The beds were 42 inches
  apart. The plants were 10 inches apart within a row, each row
  consisting of 50 plants.

  Field length: 50 plants * 10 inches = 500 inches.

  Field width: 12 in + 42 in + 12 in =

  In trial T2, 500 plants were grown in single beds. The beds were 30
  inches apart. Each bed was 50 plants long with 10 inches between
  plants.

  Field length: 50 plants * 10 in = 500 in.

  Field width: 10 beds * 30 in = 300 in.
}
\source{
  G. A. Baker and R. E. Baker (1953).
  Strawberry Uniformity Yield Trials.
  \emph{Biometrics}, 9, 412-421.
  http://doi.org/10.2307/3001713
}
\references{
  None
}
\examples{
data(baker.strawberry.uniformity)
dat <- baker.strawberry.uniformity
# Match mean and cv of Baker p 414.
require(dplyr)
dat <- group_by(dat, trial)
dat <- summarize(dat, mn=mean(yield), cv=sd(yield)/mean(yield))

\dontrun{
dat$col = ifelse(dat$trial=="T1" & dat$col==4, 7, dat$col)
dat$col = ifelse(dat$trial=="T1" & dat$col==3, 6, dat$col)

library(desplot)
desplot(yield ~ col*row, dat, subset=trial=="T1",
        flip=TRUE, aspect=500/(5*12),
        main="baker.strawberry.uniformity - trial T1")
desplot(yield ~ col*row, dat, subset=trial=="T2",
        flip=TRUE, aspect=500/300,
        main="baker.strawberry.uniformity - trial T2")
}
}
\keyword{datasets}
