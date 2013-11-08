\name{talbot.potato}
\alias{talbot.potato}
\docType{data}
\title{
  Potato yields and trait scores at 12 UK locations
}
\description{
  Yield and 14 trait scores for each of 9 potato varieties at 12
  locations in UK.
}

\format{
  A list of two matrices, \code{yield} and \code{char}.
  See details below.
}
\details{
  The \code{yield} matrix contains mean tuber yields (t/ha) of 9 varieties
  of potato at 12 centers
  in the United Kingdom over five years 1983-1987.
  The following abbreviations are used for the centers.

  \tabular{ll}{
    BU \tab Bush \cr
    CA \tab Cambridge \cr
    CB \tab Conon Bridge \cr
    CC \tab Crossacreevy \cr
    CP \tab Cockle Park \cr
    CR \tab Craibstone \cr
    GR \tab Greenmount \cr
    HA \tab Harper Adams \cr
    MO \tab Morley \cr
    RO \tab Rosemaund \cr
    SB \tab Sutton Bonnington \cr
    TE \tab Terrington \cr
  }

  The \code{char} matrix contains the scores of 14 traits on
  each of the 9 varities.
}
\source{
  Mike Talbot and A V Wheelwright, 1989,
  The analysis of genotype x analysis interactions by partial
  least squares regression.
  \emph{Biuletyn Oceny Odmian}, 21/22, 19--25.

  Also: \url{http://www.bioss.ac.uk/smart/unix/mplsgxe/example/t2.g}

  Used with permission of Mike Talbot.
}
\references{
  \url{http://www.bioss.ac.uk/smart/unix/mplsgxe/slides/}
}
\examples{

\dontrun{
require(pls)

char <- talbot.potato$char
yield <- talbot.potato$yield

# Transform columns to zero mean and unit variance
char <- scale(char)
yield <- scale(yield)

m1 <- plsr(yield ~ char, ncomp=3)
summary(m1)

# Loadings factor 1
lo <- loadings(m1)[,1,drop=FALSE]
round(-1*lo[order(-1*lo),1,drop=FALSE],2)
}
}

