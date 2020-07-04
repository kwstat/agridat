\name{chinloy.fractionalfactorial}
\alias{chinloy.fractionalfactorial}
\docType{data}
\title{
  Sugarcane fractional factorial 1/3 3^5
}
\description{
  Sugarcane fractional factorial 1/3 3^5.
}
\usage{data("chinloy.fractionalfactorial")}
\format{
  A data frame with 81 observations on the following 10 variables.
  \describe{
    \item{\code{yield}}{yield}
    \item{\code{block}}{block}
    \item{\code{row}}{row position}
    \item{\code{col}}{column position}
    \item{\code{trt}}{treatment code}
    \item{\code{N}}{nitrogen treatment: 0, 1, 2}
    \item{\code{P}}{phosphorous treatment: 0, 1, 2}
    \item{\code{K}}{potassium treatment: 0, 1, 2}
    \item{\code{B}}{bagasse treatment: 0, 1, 2}
    \item{\code{F}}{filter press mud treatment: 0, 1, 2}
  }
}
\details{

  An experiment grown in 1949 at the Worthy Park Estate in Jamaica.
  
  Nitrogen was applied as sulphate of ammonia at 0, 3, 6 hundred-weight
  per acre.

  Phosphorous was applied as superphosphate at 0, 4, 8 hundred-weight
  per acre.
  
  Potassium was applied as muriate of potash at 0, 1, 2 hundred-weight
  per acre.
  
  Bagasse applied pre-plant at 0, 20, 40 tons per acre.

  Filter press mud applied pre-plant at 0, 10, 20 tons per acre.
  
  Each plot was 18 yards long by 6 yards (3 rows) wide. Plots were
  arranged in nine columns of nine, a 2-yard space separating plots
  along the rows and two guard rows separating plots across the rows.
  
  Field width: 6 yards * 9 plots + 4 yards * 8 gaps = 86 yards

  Field length: 18 yards * 9 plots + 2 yards * 8 gaps = 178 yards

}
\source{
  T. Chinloy, R. F. Innes and D. J. Finney. (1953).
  An example of fractional replication in an experiment on sugar cane manuring.
  \emph{Journ Agricultural Science}, 43, 1-11.
  https://doi.org/10.1017/S0021859600044567
}
\references{
  None
}
\examples{
\dontrun{

library(agridat)
data(chinloy.fractionalfactorial)
dat <- chinloy.fractionalfactorial

# Treatments are coded with levels 0,1,2. Make sure they are factors
dat <- transform(dat,
                 N=factor(N), P=factor(P), K=factor(K), B=factor(B), F=factor(F))

# Experiment layout
libs(desplot)
desplot(dat, yield ~ col*row,
        out1=block, text=trt, shorten="no", cex=0.6,
        aspect=178/86,
        main="chinloy.fractionalfactorial")

# Main effect and some two-way interactions. These match Chinloy table 6.
# Not sure how to code terms like P^2K=B^2F
m1 <- aov(yield ~ block + N + P + K + B + F + N:P + N:K + N:B + N:F, dat)
anova(m1)

}
}
\keyword{datasets}
