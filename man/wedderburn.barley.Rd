\name{wedderburn.barley}
\alias{wedderburn.barley}
\docType{data}
\title{
  Percent of barley leaves affected by leaf blotch
}
\description{
  Percent of leaf area affected by leaf blotch on 10 varieties of barley
  at 9 sites.
}
\usage{data(wedderburn.barley)}

\format{
  A data frame with 90 observations on the following 3 variables.
  \describe{
    \item{\code{y}}{Percent of leaf area affected, 0-100.}
    \item{\code{site}}{Site factor, 9 levels}
    \item{\code{gen}}{Variety factor, 10 levels}
  }
}
\details{
  Incidence of Rhynchosporium secalis (leaf blotch) on the leaves of
  10 varieties of barley grown at 9 sites in 1965.
}
\source{
  Wedderburn, R W M (1974).
  Quasilikelihood functions, generalized linear models and the
  Gauss-Newton method. \emph{Biometrika}, 61, 439--47. 
}
\references{
  McCullagh, P and Nelder, J A (1989).
  \emph{Generalized Linear Models} (2nd ed).
}
\examples{

dat <- wedderburn.barley
dat$y <- dat$y/100

dotplot(gen~y|site, dat)

# Use the variance function mu(1-mu).  McCullagh page 330
m1 <- glm(y ~ gen + site, data=dat, family="binomial")
summary(m1)

# Same shape (different scale) as McCullagh fig 9.1a
plot(m1, which=1)

# Compare data and model
dat$pbin <- predict(m1, type="response")
dotplot(gen~pbin+y|site, dat)

\dontrun{
# Wedderburn suggested variance function mu^2 * (1-mu)^2
# which is the 'wedderburn' family in the gnm package
library(gnm)
m2 <- glm(y ~ gen + site, data=dat, family="wedderburn")
summary(m2)
# Similar to McCullagh fig 9.2
plot(m2, which=1)

# Compare data and model
dat$pwed <- predict(m2, type="response")
dotplot(gen~pwed+y|site, dat)
}

}