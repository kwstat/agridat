\name{johnson.blight}
\alias{johnson.blight}
\docType{data}
\title{
  Potato blight due to weather in Prosser, Washington
}
\description{
  Potato blight due to weather in Prosser, Washington
}
\usage{data(johnson.blight)}
\format{
  A data frame with 25 observations on the following 6 variables.
  \describe{
    \item{\code{year}}{Year}
    \item{\code{area}}{Area affected, hectares}
    \item{\code{blight}}{Blight detected, 0/1 numeric}
    \item{\code{rain.am}}{Number of rainy days in April and May}
    \item{\code{rain.ja}}{Number of rainy days in July and August}
    \item{\code{precip.m}}{Precipitation in May when temp > 5C, milimeters}
  }
}
\details{
  The variable 'blight detected' is 1 if 'area' > 0.  
}
\source{
  Johnson, D.A. and Alldredge, J.R. and Vakoch, D.L. (1996).
  Potato late blight forecasting models for the semiarid environment of
  south-central Washington. \emph{Phytopathology}, 86, 480--484.
}
\references{
  Vinayanand Kandala, Logistic Regression.
}
\examples{
data(johnson.blight)

dat <- johnson.blight

# Define indicator for blight in previous year
dat$blight.prev[2:25] <- dat$blight[1:24]
dat$blight.prev[1] <- 0 # Need this to match the results of Johnson
dat$blight.prev <- factor(dat$blight.prev)
dat$blight <- factor(dat$blight)

# Johnson et al developed two logistic models to predict outbreak of blight
m1 <- glm(blight ~ blight.prev + rain.am + rain.ja, data=dat, family=binomial)
m1
m2 <- glm(blight ~ blight.prev + rain.am + precip.m, data=dat, family=binomial)
m2

}
\keyword{datasets}
