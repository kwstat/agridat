\name{fisher.barley}
\alias{fisher.barley}
\docType{data}
\title{
  Multi-environment trial of 5 barley varieties, 6 locations, 2 yeas
}
\description{
  Multi-environment trial of 5 barley varieties, 6 locations, 2 yeas
}
\usage{data("fisher.barley")}
\format{
  A data frame with 60 observations on the following 4 variables.
  \describe{
    \item{\code{yield}}{yield, bu/ac}
    \item{\code{gen}}{genotype/variety, 5 levels}
    \item{\code{env}}{environment/location, 2 levels}
    \item{\code{year}}{year, 1931/1932}
  }
}

\details{
  Trials of 5 varieties of barley were conducted at 6 stations in
  Minnesota during the years 1931-1932.
  
  This is a subset of Immer's barley data.  The yield values here are
  totals of 3 reps (Immer gave the average yield of 3 reps).
}
\source{
  
  R. Fisher (1935).
  \emph{The Design of Experiments}.
  
}
\references{

  F. Yates & W. G. Cochran (1938).
  The Analysis of Groups of Experiments.
  \emph{Journal of Agricultural Science}, 28, 556-580, table 1.
  http://doi.org/10.1017/S0021859600050978

  G. K. Shukla, 1972.
  Some statistical aspects of partitioning of genotype-environmental
  components of variability.
  \emph{Heredity}, 29, 237-245. Table 1.
  http://doi.org/10.1038/hdy.1972.87
  
}
\examples{
data(fisher.barley)
dat <- fisher.barley

if(require(dplyr) & require(lattice)) {
  # Yates 1938 figure 1. Regression on env mean
  # Sum years within loc
  dat2 <- aggregate(yield ~ gen + env, data=dat, FUN=sum)
  # Avg within env
  emn <- aggregate(yield ~ env, data=dat2, FUN=mean)
  dat2$envmn <- emn$yield[match(dat2$env, emn$env)]
  xyplot(yield ~ envmn, dat2, group=gen, type=c('p','r'),
         main="fisher.barley - stability regression",
         xlab="Environment total", ylab="Variety mean",
         auto.key=list(columns=3))
}

\dontrun{

  require(dplyr)
  # calculate stability according to Shukla (1972), eqn 11
  # matches Shukla, Table 4, M.S. column
  dat2 <- dat
  dat2 <- dat2 %>% group_by(gen,env) %>% summarize(yield=sum(yield))
  dat2 <- dat2 %>% group_by(env) %>% mutate(envmn=mean(yield))
  dat2 <- dat2 %>% group_by(gen) %>% mutate(genmn=mean(yield))
  dat2 <- dat2 %>% group_by() %>% mutate(grandmn=mean(yield))
  # correction factor overall
  dat2 <- dat2 %>% mutate(cf = sum((yield - genmn - envmn + grandmn)^2))
  t=5; s=6 # t genotypes, s environments
  dat2 <- dat2 %>% group_by(gen) %>% mutate(ss=sum((yield-genmn-envmn+grandmn)^2))
  # divide by 6 to scale down to plot-level
  dat2 <- dat2 %>% mutate( sig2i = 1/((s-1)*(t-1)*(t-2)) * (t*(t-1)*ss-cf)/6)
  dat2[!duplicated(dat2$gen),c('gen','sig2i')]        gen     sig2i
  ##       <chr>     <dbl>
  ## 1 Manchuria  25.87912
  ## 2  Peatland  75.68001
  ## 3  Svansota  19.59984
  ## 4     Trebi 225.52866
  ## 5    Velvet  22.73051
}

\dontrun{
  # mixed model approach gives similar results
  library(asreml)
  dat2 <- dat2[order(dat2$gen),]

  # R-side
  m.sv <- asreml(yield ~ gen, data=dat2,
                 random = ~ env,
                 rcov = ~ at(gen):units)
  m.sv <- update(m.sv)
  summary(m.sv)$varcomp
  ##   summary(m.sv)$varcomp[-1,1:2]/6
  ##                            gamma component
  ## gen_Manchuria!variance  34.03643  34.03643
  ## gen_Peatland!variance   70.72723  70.72723
  ## gen_Svansota!variance   25.38494  25.38494
  ## gen_Trebi!variance     231.84662 231.84662
  ## gen_Velvet!variance     14.05591  14.05591

  # G-side
  m.sv2 <- asreml(yield ~ gen, data=dat,
                  random = ~ env + diag(gen):units,
                  family=asreml.gaussian(dispersion=1.0))
  m.sv2 <- update(m.sv2)
  summary(m.sv2)$varcomp[-1,1:2]/6
}

}
\keyword{datasets}
