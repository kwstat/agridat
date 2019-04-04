\name{lander.multi.uniformity}
\alias{lander.multi.uniformity}
\docType{data}
\title{
  Uniformity trials of wheat and chari, 4 years on the same land.
}
\description{
  Uniformity trials of wheat and chari, 4 years on the same land, in India.
}
\usage{data("lander.multi.uniformity")}
\format{
  A data frame with 780 observations on the following 5 variables.
  \describe{
    \item{\code{row}}{row}
    \item{\code{col}}{column}
    \item{\code{yield}}{yield, maunds per plot}
    \item{\code{year}}{year}
    \item{\code{crop}}{crop}
  }
}
\details{

  Note, "chari" in this paper is \emph{Andropogon Sorghum}, and "wheat"
  is \emph{Triticum vulgare}.
  
  Uniformity trials carried out at Rawalpindi, India.
  
  The area consisted of 5 fields (D4,D5,D6,D7,D8), each 5 acres in
  size. Each of these 5 fields was divided into three sub-divisions A,
  B, C, by means of two strong bunds each 5 feet wide. These 3
  sub-divisions were divided into 5 blocks, each consisting of 13
  experimental plots with 14 non-experiment strips 5 feet wide
  separating the plots from the other. The dimensions of the plot were
  207 ft 5 in by 19 ft 1 in.

  The same land was used for 4 consecutive crops. The first crop was
  wheat, followed by chari/sorghum, followed by wheat 2 times.
  
  Field width: 207.42 * 5 plots = 1037.1 feet

  Field length: (19.08+5)*39 rows = 939.12 feet
  
  Conclusions: It is evident, therefore, that soil heterogenity as
  revealed by any one  crop cannot be a true index of the subsequent
  behavior of that area with respect to other crops. Even the same crop
  raised in different seasons has not shown any constancy as regards
  soil heterogeneity.
  
}
\source{
  Lander, P. E. et al. (1938).
  Soil Uniformity Trials in the Punjab I.
  Ind. J. Agr. Sci. 8:271-307.
}
\references{
  None
}
\examples{
data(lander.multi.uniformity)
dat <- lander.multi.uniformity

# Yearly means, similar to Lander table 7
## filter(dat) %>% group_by(year) %>% summarise(yld=mean(yield))
## 1 1929   18.1
## 2 1930   58.3
## 3 1931   22.8
## 4 1932   14.1

# heatmaps for all years
if(require(desplot)){
  dat$year <- factor(dat$year)
  desplot(yield ~ col*row|year, dat,
          flip=TRUE, aspect=(1037.1/939.12),
          main="lander.multi.uniformity")
}

}
\keyword{datasets}
