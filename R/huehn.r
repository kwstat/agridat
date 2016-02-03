# huen.r
# Time-stamp: c:/x/rpack/agridat/R/huen.r

huehn <- function(mat, corrected=TRUE){
  # Gen in rows, Env in cols
  K <- nrow(mat) # genotypes
  N <- ncol(mat) # environments
  
  # Use corrected yield? Remove genotype effects
  if(corrected)
    mat <- sweep(mat, 1, rowMeans(mat)) + mean(mat)
  # Ranks in each environment
  rmat <- apply(mat, 2, rank)

  # Mean genotype rank across envts
  MeanRank <- apply(rmat, 1, mean)
  
  # Huehn S1
  gfun <- function(x){
    oo <- outer(x,x,"-")
    sum(abs(oo)) # sum of all absolute pairwise differences
  }
  s1 <- apply(rmat, 1, gfun)/(N*(N-1))
  es1 <- (K^2-1)/(3*K)
  # Lu 1995 incorrectly has vs1=(K^2)*...
  vs1 <- (K^2-1)*((K^2-4)*(N+3)+30)/(45*K^2*N*(N-1))
  z1 <- (s1-es1)^2/vs1
  
  # Huehn S2
  s2 <- apply((rmat-MeanRank)^2,1,sum)/(N-1)
  es2 <- (K^2-1)/12
  vs2 <- (K^2-1)*(2*(K^2-4)*(N-1)+5*(K^2-1))/(360*N*(N-1))
  z2 <- (s2-es2)^2/vs2

  out <- data.frame(MeanRank,S1=s1,Z1=z1, S2=s2, Z2=z2)
  attr(out, "95% ChiSq Z1,Z2") <- qchisq(1-.05/K,1)
  attr(out, "95% ChiSq Z1+Z2") <- qchisq(1-.05,K)
  
  rownames(out) <- rownames(mat)
  return(out)
}
