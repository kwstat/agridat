\name{jenkyn.mildew}
\alias{jenkyn.mildew}
\docType{data}
\title{
  Yields from treatment for mildew control
}
\description{
    Yields from treatment for mildew control
}

\format{
  A data frame with 38 observations on the following 4 variables.
  \describe{
    \item{\code{plot}}{plot number}
    \item{\code{trt}}{treatment factor, 4 levels}
    \item{\code{block}}{block factor, 9 levels}
    \item{\code{yield}}{grain yield, tons/ha}
  }
}
\details{

  There were four spray treatments: 0 (none), 1 (early), 2 (late), R
  (repeated).

  Each treatment occurs once between each f the 9 ordered pairs of the
  other treatments.

  The first and last plot are not assigned to a block.
}
\source{
  Norman Draper and Irwin Guttman (1980).
  "Incorporating Overlap Effects from Neighboring Units into Response
  Surface Models".
  \emph{Appl Statist}, 29, 128--134.
}
\references{
  Maria Durban, Christine Hackett, Iain Currie.
  Blocks, Trend and Interference in Field Trials.
}
\examples{

dat <- jenkyn.mildew

require(lattice)
bwplot(yield ~ trt, dat, main="jenkyn.mildew")

# Residuals from treatment model show obvious spatial trends
m0 <- lm(yield ~ trt, dat)
xyplot(resid(m0)~plot, dat, ylab="Residual (treatment model)",
       main="jenkyn.mildew")

# The blocks explain most of the variation
m1 <- lm(yield ~ trt + block, dat)
xyplot(resid(m1)~plot, dat, ylab="Residual (block model)",
       main="jenkyn.mildew")

}
\keyword{datasets}
