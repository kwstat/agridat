\name{lillemo.wheat}
\alias{lillemo.wheat}
\docType{data}
\title{
  Resistance of wheat to powdery mildew
}
\description{
  Resistance of wheat to powdery mildew
}
\usage{data("lillemo.wheat")}
\format{
  A data frame with 408 observations on the following 4 variables.
  \describe{
    \item{\code{gen}}{genotype, 24 levels}
    \item{\code{env}}{envionrment, 13 levels}
    \item{\code{score}}{score}
    \item{\code{scale}}{scale used for score}
  }
}
\details{

  The data are means across reps of the original scores.  Lower scores
  indicate better resistance to mildew.

  Each location used one of four different measurement scales for
  scoring resistance to powdery mildew: 0-5 scale, 1-9 scale, 0-9 scale,
  percent.

  Environment codes consist of two letters for the location name and two
  digits for the year of testing.  Location names: CA=Cruz Alta,
  Brazil. Ba= Bawburgh, UK. Aa=As, Norway. Ha=Hamar, Norway. Ch=Choryn,
  Poland. Ce=Cerekwica, Poland. Ma=Martonvasar, Hungary. Kh=Kharkiv,
  Ukraine. BT=Bila Tserkva, Ukraine. Gl=Glevakha, Ukraine. Bj=Beijing,
  China.

  In the examples below, the results do not quite match the
  results of Lillemo.  This could easily be the result of the original
  data table being rounded to 1 decimal place.  For example, environment
  'Aa03' had 3 reps and so the mean for genotype 1 was probably 16.333,
  not 16.3. 

}
\source{

  Morten Lillemo, Ravi Sing, Maarten van Ginkel. (2011).
  Identification of Stable Resistance to Powdery Mildew in Wheat Based
  on Parametric and Nonparametric Methods
  Crop Sci. 50:478-485.
  http://doi.org/10.2135/cropsci2009.03.0116
  
  Used with permission of Morten Lillemo.

  Electronic data supplied by Miroslav Zoric.
}
\references{
  None.
}
\examples{

data(lillemo.wheat)
dat <- lillemo.wheat

# Interesting look at different measurement scales by environment
require(lattice)
qqmath(~score|env, dat, group=scale,
       as.table=TRUE, scales=list(y=list(relation="free")),
       auto.key=list(columns=4),
       main="lillemo.wheat - QQ plots by environment")

\dontrun{
# Change data to matrix format
require(reshape2)
datm <- acast(dat, gen~env, value.var='score')

# Environment means. Matches Lillemo Table 3
apply(datm, 2, mean)

# Various transforms within envts to approximate 0-9 scale
datt <- datm
datt[,3] <- 1.8 * datt[,3]
datt[,c(4,6:8,11:17)] <- apply(datt[,c(4,6:8,11:17)],2,sqrt)

# Genotype means of transformed data. Matches Lillemo table 3.
round(rowMeans(datt),2)

# Biplot of transformed data like Lillemo Fig 2
require(gge)
biplot(gge(datt, scale=FALSE), title="lillemo.wheat")

# Median polish of transformed table
m1 <-medpolish(datt)
# Half-normal prob plot like Fig 1
require(faraway)
halfnorm(abs(as.vector(m1$resid)))

# Plot matrix of median-polish residuals
library(reshape2)
res1 <-as.matrix(m1$residuals)
res1 <- melt(res1)
library(ggplot2)
ggplot(res1, aes(Var2, Var1)) +
  geom_tile(aes(fill = value)) +
  scale_fill_gradient2(low="yellow", high="red", mid="white", midpoint=0) +
  xlab("") + ylab("") + ggtitle("lillemo.wheat - medpolish residuals") +
  geom_text(aes(Var2, Var1, label=round(res1$value,1)), size=2.5)

# Nonparametric stability statistics

# Lillemo table 4, Mean of ranks across envts
apply(apply(datm, 2, rank),1,mean)

# Table 4. Huhn non-parametric S1
huhn1 <- function(mat){
  # Gen in rows, Env in cols  
  nenv <- ncol(mat)
  # Ranks in each environment
  rmat <- apply(mat, 2, rank)
  gfun <- function(x){
    oo <- outer(x,x,"-")
    sum(abs(oo))
  }
  apply(rmat, 1, gfun)/(nenv*(nenv-1))
}
round(huhn1(datm),2)

# Table 4. Huhn non-parametric S2
huhn2 <- function(mat){
  # Gen in rows, Env in cols  
  nenv <- ncol(mat)
  # Ranks in each environment
  rmat <- apply(mat, 2, rank)

  mnrnk <- apply(rmat, 1, mean) # mean rank
  apply((rmat-mnrnk)^2,1,sum)/(nenv-1)
}
round(huhn2(datm),2)

} # dontrun

}
\keyword{datasets}
