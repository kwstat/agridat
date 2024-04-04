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
    \item{\code{oats}}{yield of oat hay, pounds per acre}
    \item{\code{wheat}}{yield of wheat grain, bu}
  }
}
\details{

  Each plot was 68 feet x 21 feet. After discarding a 3.5 foot border on
  all sides, the harvested area was 61 feet x 14 feet. The plots were
  laid out in doubles with a 14-foot roadway between the plots.
  
  Note: The orientation of the plots (68x21) is an educated guess.
  If the orientation was 21x68, the field would be extremely narrow and
  long.
  
  Field width: 6 plots * 68 feet + 14 ft/roadway * 2 = 436 feet

  Field length: 45 plots * 21 feet/plot = 945 feet
  
  Garber said: "Plots 211 to 214, and 261 to 264, [note, these are rows
  11-14, columns 5-6] inclusive, were eliminated from this study because
  of the fact that a few years ago a straw stack had stood on or in the
  vicinity...which undoubtedly accounts for the relatively high yields
  on plots 261 to 264, inclusive."

  
  1923 results

  In 1923 the field was planted to oats and harvested as hay.

  The data for the oat hay was given in Table 5 as mean-subtracted
  yields in pounds per acre for each plot. The oat
  yield in row 22, column 5 was given as +59.7.  This is obviously
  incorrect, since the negative yields all end in '.7' and positive
  yields all ended in '.3'.  We used -59.7 as the centered yield value
  and added the mean of 1883.7 (p. 259) to all centered yields to obtain
  absolute yields.

  
  1924 results
  
  In 1924 the field was planted to winter wheat and harvested for grain.

  The data for the wheat was given in bushels per acre, expressed as
  deviations from the mean yield (15.6 bu).
  We added the mean to all plot data.
  

  Note, Garber et al (1926) and Garber et al (1931) describe uniformity
  trials from the same field, but the experimental plot numbers in the
  two papers are different, indicating different parts of the field.
    
}
\source{
  Garber, R.J. and Mcllvaine, T.C. and Hoover, M.M. 1926.
  A study of soil heterogeneity in experiment plots.
  Jour Agr Res, 33, 255-268. Tables 3, 5.
  https://naldc.nal.usda.gov/download/IND43967148/PDF
}
\references{
  Garber, R. J. and T. C. McIlvaine and M. M. Hoover (1931).
  A Method of Laying Out Experimental Plats.
  Journal of the American Society of Agronomy, 23, 286-298,
  https://archive.org/details/in.ernet.dli.2015.229753/page/n299
}
\examples{
\dontrun{

library(agridat)
  
  data(garber.multi.uniformity)
  dat <- garber.multi.uniformity

  libs(desplot)
  desplot(dat, oats ~ col*row,
          flip=TRUE, tick=TRUE, aspect=945/436, # true aspect
          main="garber.multi.uniformity oats")

  desplot(dat, wheat ~ col*row,
          flip=TRUE, tick=TRUE, aspect=945/436, # true aspect
          main="garber.multi.uniformity wheat")

  with(dat, cor(oats, wheat)) # = .37 matches Garber

}  
}
\keyword{datasets}
