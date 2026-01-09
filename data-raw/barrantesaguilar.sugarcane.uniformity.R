# barrantesaguilar.sugarcane.uniformity.R
# Time-stamp: <2026-01-09 11:45 wrightkevi>


libs(dplyr, readxl, reshape2, tibble)

setwd("c:/drop/rpack/agridat/data-raw/")

# ----------------------------------------------------------------------------

dat <- read_excel("barrantesaguilar.sugarcane.uniformity.xlsx", 
                  sheet="data", col_names=FALSE)

# Remove empty columns
dat <- dat[, colSums(is.na(dat)) < nrow(dat)]

# Only keep rows with data (first 40 rows)
dat <- dat[1:40, ]

# Convert to matrix and melt
dat <- as.matrix(dat)
colnames(dat) <- 1:ncol(dat)
dat <- melt(dat)
dat <- rename(dat, row=Var1, col=Var2, yield=value)

barrantesaguilar.sugarcane.uniformity <- dat

# ----------------------------------------------------------------------------

# Data checks and visualization

if(FALSE) {
  
  dat <- barrantesaguilar.sugarcane.uniformity
  
  # Check mean yield
  mean(dat$yield) # Should be around 20
  
  libs(desplot)
  desplot(dat, yield ~ col*row,
          flip=TRUE, tick=TRUE,
          main="barrantesaguilar.sugarcane.uniformity")
  
}
