\name{turner.herbicide}
\alias{turner.herbicide}
\docType{data}
\title{
  Herbicide control of larkspur
}
\description{
  Herbicide control of larkspur
}
\usage{data(turner.herbicide)}
\format{
  A data frame with 12 observations on the following 4 variables.
  \describe{
    \item{\code{rep}}{rep factor}
    \item{\code{rate}}{rate of herbicide}
    \item{\code{live}}{number of live plants before application}
    \item{\code{dead}}{number of plants killed by herbicide}
  }
}
\details{
  Effectiveness of the herbicide Picloram on larkspur plants at 4 doses
  (0, 1.1, 2.2, 4.5) in 3 reps.  Experiment was done in 1986 at Manti,
  Utah.
}
\source{
  David L. Turner and Michael H. Ralphs and John O. Evans (1992).
  Logistic Analysis for Monitoring and Assessing Herbicide Efficacy.
  \emph{Weed Technology}, 6, 424-430.
  \url{http://www.jstor.org/stable/3987312}.
}

\examples{

data(turner.herbicide)
dat <- turner.herbicide

dat <- transform(dat, prop=dead/live)
# xyplot(prop~rate,dat, pch=20, main="turner.herbicide", ylab="Proportion killed")

m1 <- glm(prop~rate, data=dat, weights=live, family=binomial)
coef(m1) # -3.46, 2.6567  Same as Turner eqn 3

p1 <- expand.grid(rate=seq(0,to=5,length=50))
p1 <- cbind(p1, predict(m1, newdata=p1, type='response', se.fit=TRUE))
p1 <- transform(p1, lo = fit - 2*se.fit, up = fit + 2*se.fit)

# Figure 2 of Turner
if(require(latticeExtra)){
  foo1 <- xyplot(prop~rate,dat, cex=1.5,
                 main="turner.herbicide (model with 2*S.E.)",
                 xlab="Herbicide rate", ylab="Proportion killed")
  foo2 <- xyplot(fit~rate, p1, type='l')
  foo3 <- xyplot(lo+up~rate, p1, type='l', lty=1, col='gray')
  print(foo1 + foo2 + foo3)
}

}
\keyword{datasets}
