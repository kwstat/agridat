\name{mead.turnip}
\alias{mead.turnip}
\docType{data}
\title{
  Density/spacing experiment for turnips in 3 blocks.
}
\description{
  Density/spacing experiment for turnips in 3 blocks.
}
\usage{data("mead.turnip")}
\format{
  A data frame with 60 observations on the following 4 variables.
  \describe{
    \item{\code{yield}}{log yield (pounds/plot)}
    \item{\code{block}}{block}
    \item{\code{spacing}}{row spacing, inches}
    \item{\code{density}}{density of seeds, pounds/acre}
  }
}
\details{
  An experiment with turnips, 3 blocks, 20 treatments in a factorial
  arrangement of 5 seeding rates (density) and 4 widths (spacing).
}
\source{
  Roger Mead. (1988).
  \emph{The Design of Experiments: Statistical Principles for Practical Applications}.
  Example 12.3. Page 323.
}
\references{
  H. P. Piepho, R. N. Edmondson. (2018).
  A tutorial on the statistical analysis of factorial experiments
  with qualitative and quantitative treatment factor levels.
  Jour Agronomy and Crop Science, 8, 1-27.
  https://doi.org/10.1111/jac.12267
}
\examples{
data(mead.turnip)
dat <- mead.turnip

dat$ratef <- factor(dat$density)
dat$widthf <- factor(dat$spacing)

m1 <- aov(yield ~ block + ratef + widthf + ratef:widthf, data=dat)
anova(m1) # table 12.10 in Mead

# Similar to Piepho fig 10
if(require(lattice)) {
  xyplot(yield ~ log(spacing)|ratef, data=dat,
         auto.key=list(columns=5),
         main="mead.turnip - log(yield) for each density",
         group=ratef)
}
}
\keyword{datasets}
