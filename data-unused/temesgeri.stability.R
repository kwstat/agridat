# temesgeri.R
# Time-stamp: <11 Jan 2023 15:31:48 c:/drop/rpack/agridat/data-unused/temesgeri.stability.R>

# Reason not used:
# These are the means of four reps.  The rep-level data would
# have been needed to compute the stability statistics like
# Tai's alpha/lambda. Decided not to use.

# Source: Temesgeri at al 2015.
# Yield stability and relationships among stability
# parameters in faba bean (Vicia faba L.) genotypes


library(asreml)
library(kw)
library(Hmisc)
library(lattice)
library(rio)

dat <- scan(text="3.08 5.36 3.34 5.70 4.41 3.58 3.49 5.50 2.40 2.46 3.57 2.85 3.44 3.78
3.55 4.79 2.94 5.58 4.44 3.05 3.50 5.16 2.70 2.70 3.90 3.35 2.67 3.72
3.80 4.89 3.28 5.58 4.49 3.13 3.33 4.88 2.43 2.11 3.27 3.45 1.77 3.57
2.75 4.82 2.92 5.18 4.31 2.62 3.40 4.82 2.47 3.04 3.60 3.79 2.45 3.55
3.02 5.20 3.75 5.11 4.30 2.98 2.39 4.61 2.33 2.72 3.53 3.28 2.80 3.54
3.44 4.78 3.35 5.12 4.40 2.57 3.22 4.57 2.53 2.69 3.30 3.34 3.06 3.57
3.54 5.33 3.54 5.07 3.77 3.06 2.84 4.18 2.41 2.40 2.69 3.50 2.73 3.47
3.55 4.66 3.52 4.80 3.89 2.74 2.79 4.52 2.16 2.94 2.69 3.43 2.64 3.41
3.33 5.08 2.60 5.26 3.73 2.84 2.55 4.24 2.17 2.91 2.97 3.88 2.12 3.36
3.70 5.30 4.20 5.42 4.21 3.60 3.04 4.46 2.01 2.54 3.14 3.17 2.76 3.66
2.82 4.19 2.27 4.76 4.04 3.25 2.81 4.54 1.95 2.80 2.72 3.50 2.00 3.20
4.02 5.06 3.87 5.67 4.52 3.70 3.30 4.66 2.54 2.93 3.62 4.30 2.21 3.88
3.43 5.29 4.14 4.78 4.31 3.17 2.98 4.29 2.49 2.98 3.38 3.83 2.53 3.66
2.90 4.69 3.90 5.12 4.23 3.31 3.39 4.70 2.00 2.84 3.50 3.11 2.69 3.57
4.06 4.84 4.36 5.05 4.42 3.57 3.11 4.24 2.19 2.56 3.23 3.60 3.42 3.74
3.62 4.87 4.49 5.57 3.93 2.48 3.09 5.17 2.14 2.66 3.59 3.61 2.54 3.67")

dat <- matrix(dat, nrow=16, byrow=TRUE)
dat <- dat[,-14] # mean column
rownames(dat) <- paste0("G",pad(1:16))
colnames(dat) <- paste0("E",pad(1:13))

# ----------------------------------------------------------------------------

round(huehn(dat),2) # Matches table 4

# GY mean
round(apply(dat, 1, mean),3)
# CV matches
round(100*apply(dat, 1, function(x) sd(x)/mean(x)),2)
