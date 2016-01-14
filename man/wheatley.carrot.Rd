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
    \item{\code{depth}}{a numeric vector}
    \item{\code{rep}}{block}
    \item{\code{damaged}}{number of damaged palnts}
    \item{\code{total}}{total number of plants}
  }
}
\details{
  
  In 1964 an experiment was conducted with microplots to evaluate the effectiveness of treatments against carrot fly larvae.

  Famoye (1995) used the same data to fit a generalized binomial regression model.
  Hardin & Hilbe also fit a generalized binomial model.

}
\source{
  
  G A Wheatley & H Freeman. (1982).
  A method of using the proportions of undamaged carrots or parsnips to
  estimate the relative population densities of carrot fly (Psila rosae)
  larvae, and its practical applications.
  \emph{Annals of Applied Biology}, 100, 229-244.
  http://doi.org/10.1111/j.1744-7348.1982.tb01935.x.
}
\references{

  James William Hardin, Joseph M. Hilbe.
  \emph{Generalized Linear Models and Extensions}, 2nd ed.

  F Famoye (1995). Generalized Binomial Regression.
  \emph{Biom J}, 37, 581-594.  

}
\examples{

data(wheatley.carrot)

dat <- wheatley.carrot

# Observed proportions of damage
dat <- transform(dat, prop=damaged/total)
require(lattice)
xyplot(prop~depth|insecticide, data=dat, subset=treatment!="T11",
       cex=1.5, main="wheatley.carrot", ylab="proportion damaged")

# GLM of Hardin & Hilbe p. 161 (note, they used T11 as base, R uses T01)
m1 <- glm(cbind(damaged,total-damaged) ~ rep + treatment,
          data=dat, family=binomial("cloglog"))
summary(m1)

# Comment.  This model is rather unsatisfactory in that the depth variable
# only comes into the model through the factor treatment, when it is very
# clear from the scatterplot that depth should be continuous.

}
\keyword{datasets}
