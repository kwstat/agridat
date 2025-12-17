\name{macdonald.cotton.uniformity}
\alias{macdonald.cotton.uniformity}
\docType{data}
\title{
  Uniformity trial of cotton in South Africa
}
\description{
  Uniformity trial of cotton in South Africa
}
\usage{data("macdonald.cotton.uniformity")}
\format{
  A data frame with 1152 observations on the following 4 variables.
  \describe{
    \item{\code{row}}{row ordinate}
    \item{\code{col}}{column ordinate}
    \item{\code{yield}}{yield, grams per plot}
    \item{\code{field}}{field identifier}
  }
}
\details{
  Experiments conducted at Cotton Experiment Station, Barberton, South
  Africa 1935-1936. Planted Dec 6. Yield was about 400 pounds per
  acre. (Plot yields are given in grams). Yields were low due to late
  planting 6-8 weeks. Severe damage by aphids unevenly. Severe drought
  in Feb/Mar. Both fields represent extreme variation in soil fertility
  at the station and are not typical. 

  Field A: 144 rows 3 ft 6 in apart, 18 in between plants. Rows divided
  into 30 ft units. In Rothamsted documents, this field is called "B5b". 

  Field B: 144 rows 3 ft 6 in apart, 2 ft between plants. Rows divided
  into 40 ft units. In the Rothamsted documents, this field is called
  "B2a". 

  This data was made available with special help from the staff at
  Rothamsted Research Library. Data were typed by K.Wright.

}
\source{
  Rothamsted Research Library, Box STATS17  WG Cochran, Folder 8.
}
\references{
  MacDonald, D. and Fielding, W. L. and Ruston, D. F. (1939).
  Experimental methods with cotton: I. The design of plots for variety trials.
  The Journal of Agricultural Science, 29, 35-47.
  http://dx.doi.org/10.1017/S0021859600051534
  https://archive.org/details/in.ernet.dli.2015.26648/page/n45/
}
\examples{
\dontrun{
  library(agridat)
  data(macdonald.cotton.uniformity)
  dat <- macdonald.cotton.uniformity

  libs(desplot)
  desplot(dat, yield ~ col*row, subset=field=="A",
          flip=TRUE, tick=TRUE, aspect=(144*3.5)/(4*30),
          main="macdonald.cotton.uniformity - field A")
  desplot(dat, yield ~ col*row, subset=field=="B",
          flip=TRUE, tick=TRUE, aspect=(144*3.5)/(4*40),
          main="macdonald.cotton.uniformity - field B")

  # Match MacDonald 1939 Figure 1
  #libs(dplyr)
  #d2 <- subset(dat, field=="B")
  #d2 <- mutate(d2, block=rep(rep(1:36, each=4), 4))
  #d2 <- group_by(d2, block, col)
  #d2 <- summarize(d2, yield=mean(yield))
  #d2 <- ungroup(d2)
  #desplot(d2, yield~col*block, flip=TRUE)
}
}
\keyword{datasets}
