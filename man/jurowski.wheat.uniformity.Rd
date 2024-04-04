\name{jurowski.wheat.uniformity}
\alias{jurowski.wheat.uniformity}
\docType{data}
\title{
  Uniformity trial of wheat in Russia
}
\description{
  Uniformity trial of wheat in Russia
}
\usage{data("jurowski.wheat.uniformity")}
\format{
  A data frame with 480 observations on the following 3 variables.
  \describe{
    \item{\code{row}}{row ordinate}
    \item{\code{col}}{column ordinate}
    \item{\code{yield}}{yield, Pud per plot}
  }
}
\details{
  The experiment was conducted in Russia at Ofrossimowka. This word
  "Ofrossimowka" appeared in the German text of Sapehin, but is
  otherwise extremely difficult to find.  There may be alternate ways
  the actual Russian name is translated into German/English.

  Likewise, the name "Jurowski" is very difficult to find and may have
  other transliterations.
  
  Sapehin gives the original source as:
  Arbeiten d. Vers.-St. d. Russ. Ges. f. Zuckerind. 1913.
  which may expand to
  Arbeiten der Versuchsstationen der Russ. Ges. f. Zuckerindustrie. 1913.

  Sepehin appendix says the plot size is "4 x 12 m^2".
  It is not clear which plot dimension is 4 m and which is 12 m.
  If 4m wide 12m tall, then field is 48m wide x 480m long.
  If 4m tall 12m wide, then field is 144m wide x 160m long. This seems
  much more likely.

  Sapehin says the std dev is "21.8 pud".  A "pud" is a Russian unit of
  weight equal to 16.38 kilograms.
  
  Data converted by OCR from Sapehin and hand-checked by K.Wright.
  
}
\source{
  Sapěhin, A. A. (1927).
  Beiträge zur Methodik des Feldversuches.
  Die Landwirtschaflichen Versuchsstationen, 105, 243-259.
  https://www.google.com/books/edition/Die_Landwirthschaftlichen_Versuchs_Stati/cLZGAAAAYAAJ?hl=en&pg=PA243
}
\references{
  None
}
\examples{
\dontrun{
  library(agridat)
  data(jurowski.wheat.uniformity)
  dat <- jurowski.wheat.uniformity
  
  sd(dat$yield)
  libs(desplot)
  desplot(dat, yield~col*row,
          aspect=(40*4)/(12*12), flip=TRUE, tick=TRUE,
          main="jurowski.wheat.uniformity")
}
}
\keyword{datasets}
