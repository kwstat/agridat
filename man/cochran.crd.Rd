\name{cochran.crd}
\alias{cochran.crd}
\docType{data}
\title{
  Potato scab infection with sulfur treatments
}
\description{
  Potato scab infection with sulfur treatments
}

\format{
  A data frame with 32 observations on the following 5 variables.
  \describe{
    \item{\code{inf}}{Numeric, infection percent}
    \item{\code{trt}}{Treatment factor}
    \item{\code{row}}{Row}
    \item{\code{col}}{Column}
  }
}
\details{
The experiment was conducted to investigate the effect of sulfur on
controlling scab disease in potatoes. There were seven treatments.
Control, plus spring and fall application of 300, 600, 1200 lbs/acre of
sulfur.  The response variable was infection as a percent of the surface
area covered with scab.  A completely randomized design was used with 8
replications of the control and 4 replications of the other treatments.

Although the original analysis did not show significant differences in
the sulfur treatments, including a polynomial trend in the model
uncovered significant differences (Tamura, 1988).
}
\source{
  W.G. Cochran and G. Cox, 1957.  \emph{Experimental Designs}, 2nd
  ed. John Wiley, New York.
}
\references{
  Tamura, R.N. and Nelson, L.A. and Naderman, G.C., (1988).
  An investigation of the validity and usefulness of trend analysis for field plot data.
  \emph{Agronomy Journal}, 80, 712-718.
}
\examples{

data(cochran.crd)
dat <- cochran.crd

# Field plan
require("agrifun")
desplot(inf~col*row, data=dat, text=trt, cex=1, main="cochran.crd")

# CRD anova.  Table 6 of Tamura 1988
contrasts(dat$trt) <- cbind(c1=c(1,1,1,-6,1,1,1),   # Control vs Sulf
                            c2=c(-1,-1,-1,0,1,1,1)) # Fall vs Sp
m1 <- aov(inf ~ trt, data=dat)
anova(m1)
summary(m1, split=list(trt=list("Control vs Sulf"=1, "Fall vs Spring"=2)))

# Quadratic polynomial for columns...slightly different than Tamura 1988
m2 <- aov(inf ~ trt + poly(col,2), data=dat)
anova(m2)
summary(m2, split=list(trt=list("Control vs Sulf"=1, "Fall vs Spring"=2)))

}
\keyword{datasets}
