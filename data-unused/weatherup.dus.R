# weatherup.R

# Reason not used:
# This is the variety-means data.  Really need plant-level data to
# get correct variances for comparing varieties.

# Source: Weatherup 1980, Statistical procedures for distinctness,
# uniformtiy and stability variety trials.

lib(readxl)
dat <- read_excel("c:/x/rpack/agridat/data-raw/weatherup.dus.xlsx")
lib(corrgram)
corrgram(dat[,-1], order=TRUE)

dat2 <- as.matrix(dat[,-1])
rownames(dat2) <- dat[[1]]
lib(gge)
biplot(gge(dat2))
