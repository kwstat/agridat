\name{foulley.calving}
\alias{foulley.calving}
\docType{data}
\title{
  Calving difficulty by calf sex and age of dam
}
\description{
  Calving difficulty by calf sex and age of dam
}
\usage{data(foulley.calving)}
\format{
  A data frame with 54 observations on the following 4 variables.
  \describe{
    \item{\code{sex}}{calf gender}
    \item{\code{age}}{dam age factor, 9 levels}
    \item{\code{score}}{score for birthing difficulty, S1 < S2 < S3}
    \item{\code{count}}{count of births for each category}
  }
}
\details{
  These data are calving difficulty scores for purebred US Simmental
  cows.

  The raw data show that the greatest calving difficulty is for male
  calves with young dams.
  Differences between male/female calving decreased with age of the dam.

  The goodness of fit can be improved by using a scaling effect for age
  of dam.

  Note: The paper by Foulley and Gianola has '21943' as the count for
  score 1, F, >8.  This data uses '20943' so that the marginal totals
  from this data match the marginal totals given in the paper.
}
\source{
  JL Foulley, D Gianola (1996).
  Statistical Analysis of Ordered Categorical Data via a Structured
  Heteroskedastic Threshold Model. \emph{Gent Sel Evol}, 28, 249--273.

  Used with permission of Jean-Louis Foulley.
}

\examples{

dat <- foulley.calving

## Plot
d2 <- transform(dat, age=ordered(age, levels=c("0.0-2.0","2.0-2.5","2.5-3.0","3.0-3.5","3.5-4.0",
                                         "4.0-4.5","4.5-5.0","5.0-8.0","8.0+")),
                 score=ordered(score, levels=c('S1','S2','S3')))
d2 <- acast(dat, sex+age~score, value.var='count')
d2 <- prop.table(d2, margin=1)
require(lattice)
thm <- simpleTheme(col=c('skyblue','gray','pink'))
barchart(d2, par.settings=thm, main="foulley.calving",
         xlab="Frequency of calving difficulty", ylab="Calf gender and dam age",
         auto.key=list(columns=3, text=c("Easy","Assited","Difficult")))

## Ordinal multinomial model



## Note 1.0196-.3244 = 0.6952 matches Foulley's '2-3' threshold estimate

## Coefficients:
##                     Value Std. Error t value
## sexF            -0.500605    0.01518 -32.982
## age2.0-2.5      -0.234609    0.01350 -17.383
## age2.5-3.0      -0.758325    0.01803 -42.059
## age3.0-3.5      -1.037794    0.01649 -62.920
## age3.5-4.0      -1.218294    0.02218 -54.926
## age4.0-4.5      -1.271138    0.01960 -64.856
## age4.5-5.0      -1.374209    0.02589 -53.080
## age5.0-8.0      -1.416112    0.01529 -92.589
## age8.0+         -1.454782    0.02088 -69.680
## sexF:age2.0-2.5 -0.003035    0.01933  -0.157
## sexF:age2.5-3.0  0.076677    0.02611   2.937
## sexF:age3.0-3.5  0.080657    0.02464   3.274
## sexF:age3.5-4.0  0.135774    0.03293   4.124
## sexF:age4.0-4.5  0.124303    0.02982   4.169
## sexF:age4.5-5.0  0.198897    0.03831   5.192
## sexF:age5.0-8.0  0.135524    0.02280   5.943
## sexF:age8.0+     0.131033    0.03185   4.114

## Intercepts:
##       Value    Std. Error t value
## S1|S2   0.3244   0.0107    30.2148
## S2|S3   1.0196   0.0111    91.9371

## Residual Deviance: 216176.90
## AIC: 216214.90

\dontrun{
  require(ordinal)
  m2 <- clm(score ~ sex*age, data=dat, weights=count, link='probit')
  summary(m2) # same as polr model
  predict(m2) # probability of each category
}

}
\keyword{datasets}
