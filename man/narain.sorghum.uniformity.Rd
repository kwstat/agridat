\name{narain.sorghum.uniformity}
\alias{narain.sorghum.uniformity}
\docType{data}
\title{
  Uniformity trial of sorghum
}
\description{
  A uniformity trial of sorghum in Pakistan, 1936.
}
\usage{data("narain.sorghum.uniformity")}
\format{
  A data frame with 160 observations on the following 3 variables.
  \describe{
    \item{\code{row}}{row}
    \item{\code{col}}{column}
    \item{\code{yield}}{yield, maunds per 1/40 acre}
  }
}
\details{

  A uniformity trial with chari (sorghum) at Rawalpindi Agricultural
  Station (Pakistan) in kharif (monsoon season) in 1936. Each plot was
  36 feet by 30.25 feet.  The source document does not describe the
  orientation of the plots, but the fertility map shown in Narain figure
  1 shows the plots are taller than wide.

  Field width: 10 plots * 30.25 feet

  Field length: 16 plots * 36 feet
}
\source{
  R. Narain and A. Singh, (1940).
  A Note on the Shape of Blocks in Field Experiments.
  Ind. J. Agr. Sci., 10, 844-853. Page 845.
  https://archive.org/stream/in.ernet.dli.2015.271745
}
\references{
  None
}
\examples{
data(narain.sorghum.uniformity)
dat <- narain.sorghum.uniformity

# Narain figure 1
if(require(desplot)){
  desplot(yield ~ col*row, dat,
          flip=TRUE, aspect=(16*36)/(10*30.25),
          main="narain.sorghum.uniformity")
  }

}
\keyword{datasets}
