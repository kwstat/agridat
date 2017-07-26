\name{lonnquist.maize}
\alias{lonnquist.maize}
\docType{data}
\title{
  Multi-environment trial of maize, half diallel
}
\description{
  Half diallel of maize
}
\usage{data("lonnquist.maize")}
\format{
  A data frame with 78 observations on the following 3 variables.
  \describe{
    \item{\code{p1}}{parent 1 factor}
    \item{\code{p2}}{parent 2 factor}
    \item{\code{yield}}{yield}
  }
}
\details{

  Twelve hybrids were selfed/crossed in a half-diallel design planted in
  3 reps at 2 locations in 2 years.  The data here are means adjusted
  for block effects.

}

\source{
  J. H. Lonnquist, C. O. Gardner. (1961)
  Heterosis in Intervarietal Crosses in Maize and Its Implication in
  Breeding Procedures.
  \emph{Crop Science}, 1, 179-183.  Table 1.
}

\references{
  Mohring, Melchinger, Piepho. (2011).
  REML-Based Diallel Analysis.
  \emph{Crop Science}, 51, 470-478.
  http://doi.org/10.2135/cropsci2010.05.0272

  C. O. Gardner and S. A. Eberhart. 1966.
  Analysis and Interpretation of the Variety Cross Diallel and Related
  Populations. \emph{Biometrics}, 22, 439-452.
  http://doi.org/10.2307/2528181
}

\examples{

data(lonnquist.maize)
dat <- lonnquist.maize
dat <- transform(dat,
                 p1=factor(p1,
                   levels=c("C","L","M","H","G","P","B","RM","N","K","R2","K2")),
                 p2=factor(p2,
                   levels=c("C","L","M","H","G","P","B","RM","N","K","R2","K2")))
require(lattice)
redblue <- colorRampPalette(c("firebrick", "lightgray", "#375997"))
levelplot(yield ~ p1*p2, dat, col.regions=redblue,
          main="lonnquist.maize - yield of diallel cross")

# Calculate the F1 means in Lonnquist, table 1
if(require(reshape2)){
  mat <- acast(dat, p1~p2)
  mat[upper.tri(mat)] <- t(mat)[upper.tri(mat)] # make symmetric
  diag(mat) <- NA
  round(rowMeans(mat, na.rm=TRUE),1)
  ##    C     L     M     H     G     P     B    RM     N     K    R2    K2
  ## 94.8  89.2  95.0  96.4  95.3  95.2  97.3  93.7  95.0  94.0  98.9 102.4
}

# ----------------------------------------------------------------------------

\dontrun{
  # Mohring 2011 used 6 varieties to calculate GCA & SCA
  # Matches Table 3, column 2
  d2 <- subset(dat, is.element(p1, c("M","H","G","B","K","K2")) &
                      is.element(p2, c("M","H","G","B","K","K2")))
  d2 <- droplevels(d2)
  # asreml4
  require(asreml)
  m2 <- asreml(yield~ 1, data=d2, random = ~ p1 + and(p2))
  require(lucid)
  vc(m2)
  ##     effect component std.error z.ratio      con
  ##  p1!p1.var     3.865     3.774     1   Positive
  ## R!variance    15.93      5.817     2.7 Positive
  
  
  # Calculate GCA effects
  m3 <- asreml(yield~ p1 + and(p2), data=d2)
  coef(m3)$fixed-1.462
  # Matches Gardner 1966, Table 5, Griffing method
}

# ----------------------------------------------------------------------------

\dontrun{
  # Mohring 2011 used 6 varieties to calculate GCA & SCA
  # Matches Table 3, column 2
  ## d2 <- subset(dat, p1 %in% c("M","H","G","B","K","K2") &
  ##                     p2 %in% c("M","H","G","B","K","K2"))
  ## d2 <- droplevels(d2)
  ## require(asreml4)
  ## m2 <- asreml(yield~ 1, data=d2, random = ~ p1 + and(p2))
  ## require(lucid)
  ## vc(m2)
  ## ##     effect component std.error z.ratio      con
  ## ##  p1!p1.var     3.865     3.774     1   Positive
  ## ## R!variance    15.93      5.817     2.7 Positive
  
  
  ## # Calculate GCA effects
  ## m3 <- asreml(yield~ p1 + and(p2), data=d2)
  ## coef(m3)$fixed-1.462
  ## # Matches Gardner 1966, Table 5, Griffing method
}

# ----------------------------------------------------------------------------

}
\keyword{datasets}
