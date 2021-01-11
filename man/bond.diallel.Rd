\name{bond.diallel}
\alias{bond.diallel}
\docType{data}
\title{
  Diallel cross of winter beans
}
\description{
  Diallel cross of winter beans
}

\format{
  A data frame with 36 observations on the following 3 variables.
  \describe{
    \item{\code{female}}{female parent}
    \item{\code{male}}{male parent}
    \item{\code{yield}}{yield, grams/plot}
    \item{\code{stems}}{stems per plot}
    \item{\code{nodes}}{podded nodes per stem}
    \item{\code{pods}}{pods per podded node}
    \item{\code{seeds}}{seeds per pod}
    \item{\code{weight}}{weight (g) per 100 seeds}
    \item{\code{height}}{height (cm) in April}
    \item{\code{width}}{width (cm) in April}
    \item{\code{flower}}{mean flowering date in May}
  }
}
\details{
  Yield in grams/plot for full diallel cross between 6 inbred lines
  of winter beans.  Values are means over two years.
}
\source{
  D. A. Bond (1966). Yield and components of yield in diallel crosses
  between inbred lines of winter beans (Viciafaba).
  \emph{The Journal of Agricultural Science}, 67, 325--336.
  https://doi.org/10.1017/S0021859600017329
}
\references{
  Peter John, \emph{Statistical Design and Analysis of Experiments}, p. 85.
}
\examples{
\dontrun{
  
  library(agridat)
  data(bond.diallel)
  dat <- bond.diallel
  
  # Because these data are means, we will not be able to reproduce
  # the anova table in Bond. More useful as a multivariate example.

  libs(corrgram)
  corrgram(dat[ , 3:11], main="bond.diallel",
           lower=panel.pts)

  # Multivariate example from sommer package
  corrgram(dat[,c("stems","pods","seeds")],
           lower=panel.pts, upper=panel.conf, main="bond.diallel")
  libs(sommer)           
  
  m1 <- mmer(cbind(stems,pods,seeds) ~ 1,
             random= ~ vs(female)+vs(male),
             rcov= ~ vs(units),
             dat)

  #### genetic variance covariance
  cov2cor(m1$sigma$`u:female`)
  cov2cor(m1$sigma$`u:male`)
  cov2cor(m1$sigma$`u:units`)

}
}
\keyword{datasets}
