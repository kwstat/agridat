\name{wheatley.carrot}
\alias{wheatley.carrot}
\docType{data}
\title{
  Insecticide treatments for carrot fly larvae
}
\description{
  Insecticide treatments for carrot fly larvae.
  Two insecticides with five depths.
}
\usage{data("wheatley.carrot")}
\format{
  A data frame with 36 observations on the following 6 variables.
  \describe{
    \item{\code{treatment}}{treatment factor, 11 levels}
    \item{\code{insecticide}}{insecticide factor}
    \item{\code{depth}}{depth}
    \item{\code{rep}}{block}
    \item{\code{damaged}}{number of damaged plants}
    \item{\code{total}}{total number of plants}
  }
}
\details{
  
  In 1964 an experiment was conducted with microplots to evaluate the
  effectiveness of treatments against carrot fly larvae.
  The treatment factor is a combination of insecticide and depth.
  
  Hardin & Hilbe used this data to fit a generalized binomial model.

  Famoye (1995) used the same data to fit a generalized binomial regression model.
  Results for Famoye are not shown.

}

\source{  
  G A Wheatley & H Freeman. (1982).
  A method of using the proportions of undamaged carrots or parsnips to
  estimate the relative population densities of carrot fly (Psila rosae)
  larvae, and its practical applications.
  \emph{Annals of Applied Biology}, 100, 229-244.  Table 2.
  
  https://doi.org/10.1111/j.1744-7348.1982.tb01935.x
}

\references{

  James William Hardin, Joseph M. Hilbe.
  \emph{Generalized Linear Models and Extensions}, 2nd ed.

  F Famoye (1995). Generalized Binomial Regression.
  \emph{Biom J}, 37, 581-594.  

}
\examples{
\dontrun{

library(agridat)

data(wheatley.carrot)
dat <- wheatley.carrot

# Observed proportions of damage
dat <- transform(dat, prop=damaged/total)
libs(lattice)
xyplot(prop~depth|insecticide, data=dat, subset=treatment!="T11",
       cex=1.5, main="wheatley.carrot", ylab="proportion damaged")

# Model for Wheatley. Deviance for treatment matches Wheatley, but other
# deviances do not.  Why?
# treatment:rep is the residual
m1 <- glm(cbind(damaged,total-damaged) ~ rep + treatment + treatment:rep,
          data=dat, family=binomial("cloglog"))
anova(m1)

# GLM of Hardin & Hilbe p. 161. By default, R uses T01 as the base,
# but Hardin uses T11. Results match.
m2 <- glm(cbind(damaged,total-damaged) ~ rep + C(treatment, base=11),
          data=dat, family=binomial("cloglog"))
summary(m2)
}
}
\keyword{datasets}
