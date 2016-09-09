\name{mead.cauliflower}
\alias{mead.cauliflower}
\docType{data}
\title{
  Leaves for cauliflower plants at different times
}
\description{
  Leaves for cauliflower plants at different times in two years.
}

\format{
  A data frame with 14 observations on the following 4 variables.
  \describe{
    \item{\code{year}}{year factor}
    \item{\code{degdays}}{degree days above 32F}
    \item{\code{leaves}}{number of leaves}
  }
}
\details{
  Numbers of leaves for 10 cauliflower plants in each of two years, and
  temperature degree-days above 32F, divided by 100.)

  The year is 1956-57 or 1957-58.

  Over the data range shown, the number of leaves is increasing
  linearly.  Extrapolating backwards shows that a linear model is
  inappropriate, and so a glm is used.
}
\source{
  Roger Mead, Robert N Curnow, Anne M Hasted. 2002.
  Statistical Methods in Agriculture and Experimental Biology, 3rd ed.
  Chapman and Hall. Page 251.
}
\references{
  Mick O'Neill. Regression & Generalized Linear (Mixed) Models.
  STatistical Advisory & Training Service Pty Ltd.
}

\examples{

data(mead.cauliflower)
dat <- mead.cauliflower

dat <- transform(dat, year=factor(year))

m1 <- glm(leaves ~ degdays + year, data=dat, family=poisson)
coef(m1)
## (Intercept)     degdays    year1957
##  3.49492453  0.08512651  0.21688760

dat$pred <- predict(m1, type="response")
require(lattice)
if(require(latticeExtra)){
xyplot(leaves~degdays, data=dat, groups=year, type=c('p'),
       auto.key=list(columns=2), main="mead.cauliflower - observed (symbol) & fitted (line)",
       xlab="degree days", ylab="Number of leaves", ) +
  xyplot(pred~degdays, data=dat, groups=year, type=c('l'), col="black")
}

}
\keyword{datasets}
