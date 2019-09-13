\name{garber.multi.uniformity}
\alias{garber.multi.uniformity}
\docType{data}
\title{
  Uniformity trials of oat hay and wheat grain
}
\description{
  Uniformity trials of oat hay and wheat grain, at West Virginia
  Agricultural Experiment Station, 1923-1924, on the same land.
}

\format{
  A data frame with 270 observations on the following 4 variables.
  \describe{
    \item{\code{row}}{row}
    \item{\code{col}}{column}
    \item{\code{oats}}{yield of oat hay}
    \item{\code{wheat}}{yield of wheat grain}
  }
}
\details{

  Each plot was 68 feet x 21 feet. After discarding a 3.5 foot border on
  all sides, the harvested area was 61 feet x 14 feet. The plots were
  laid out in doubles with a 14-foot roadway between the plots.
  
  Note: The orientation of the plots is a guess.
  
  Field width: 6 plots * 68 feet + 14 ft/roadway * 2 = 436 feet

  Field length: 45 plots * 21 feet/plot = 945 feet
  
  In 1923 the field was planted to oats and harvested as hay.

  In 1924 the field was planted to wheat and harvested for grain.

  Garber: "Plots 211 to 214, and 261 to 264, [note, these are rows
  11-14, columns 5-6] inclusive, were eliminated from this study because
  of the fact that a few years ago a straw stack had stood on or in the
  vicinity...which undoubtedly accounts for the relatively high yields
  on plots 261 to 264, inclusive."

  Note: The source document contained mean-subtracted yields.  The oat
  yield in row 22, column 5 was given as +59.7.  This is obviously
  incorrect, since the negative yields all end in '.7' and positive
  yields all ended in '.3'.  We used -59.7 as the centered yield value
  and added the mean of 1883.7 to all centered yields to obtain absolute
  yields.

  Note: Another paper by these authors,
  "A Method of Laying Out Experimental Plats", contains three additional
  years of uniformity trials, with each crop expressed as a percentage.
  https://archive.org/details/in.ernet.dli.2015.229753?q=method+of+laying+out+experiment+plats
}
\source{
  Garber, RJ and Mcllvaine, TC and Hoover, MM. 1926.
  A study of soil heterogeneity in experiment plots.
  \emph{Jour. Agr. Res}, 33, 255-268. Tables 3, 5.
  http://naldc.nal.usda.gov/download/IND43967148/PDF
}

\examples{
\dontrun{

library(agridat)
  
  data(garber.multi.uniformity)
  dat <- garber.multi.uniformity

  libs(desplot)
  desplot(oats ~ col*row, data=dat,
          flip=TRUE, tick=TRUE, aspect=945/436, # true aspect
          main="garber.multi.uniformity oats")

  desplot(wheat ~ col*row, data=dat,
          flip=TRUE, tick=TRUE, aspect=945/436, # true aspect
          main="garber.multi.uniformity wheat")

  with(dat, cor(oats, wheat)) # = .37 matches Garber

}  
}
\keyword{datasets}
