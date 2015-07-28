# papcov.r
# Time-stamp: c:/x/rpack/agridat/R/papcov.r

papcov <- function(resid,x,y){

  # Author: Kevin Wright

  # Make sure x and y are numeric
  if(is.factor(x)) x <- as.numeric(as.character(x))
  if(is.factor(y)) y <- as.numeric(as.character(y))
  xy <- paste(x,y,sep=":")

  # Average neighboring residuals in up/down direction
  xym1 <- paste(x,y-1,sep=":")
  xyp1 <- paste(x,y+1,sep=":")
  rm1 <- resid[match(xym1,xy,NA)]
  rp1 <- resid[match(xyp1,xy,NA)]
  ud <- (rm1+rp1)/2
  # Average neighboring residuals in left/right direction
  ud <- ifelse(is.na(ud) & !is.na(rm1),rm1,ud)
  ud <- ifelse(is.na(ud) & !is.na(rp1),rp1,ud)

  # Left/Right residuals
  xm1y <- paste(x-1,y,sep=":")
  xp1y <- paste(x+1,y,sep=":")
  cm1 <- resid[match(xm1y,xy,NA)]
  cp1 <- resid[match(xp1y,xy,NA)]
  lr <- (cm1+cp1)/2
  # If only one neighboring residual is available, then just use it
  lr <- ifelse(is.na(lr) & !is.na(cm1),cm1,lr)
  lr <- ifelse(is.na(lr) & !is.na(cp1),cp1,lr)

  return(list(LR=lr, UD=ud))
}
