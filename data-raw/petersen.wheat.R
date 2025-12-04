# petersen.wheat.R
# Time-stamp: <04 Dec 2024>

# Source: Roger G Petersen (1994). Agricultural Field Experiments.
# Table 5.7, page 170.

library(dplyr)
library(tibble)

# Augmented design with 30 new durum wheat selections and 3 checks
# 6 blocks, 8 plots per block = 48 total plots
# Checks: St (Stork), Ci (Cimmaron), Wa (Waha)
# Layout: single line of 48 plots

petersen.wheat <- tibble::tribble(
  ~plot, ~block,   ~gen, ~yield,
      1,   "B1",   "St",   2972,
      2,   "B1",  "G14",   2405,
      3,   "B1",  "G26",   2855,
      4,   "B1",   "Ci",   2592,
      5,   "B1",  "G17",   2572,
      6,   "B1",   "Wa",   2608,
      7,   "B1",  "G22",   2705,
      8,   "B1",  "G13",   2391,
      9,   "B2",   "St",   3122,
     10,   "B2",   "Ci",   3023,
     11,   "B2",  "G04",   3018,
     12,   "B2",  "G15",   2477,
     13,   "B2",  "G30",   2955,
     14,   "B2",  "G03",   3055,
     15,   "B2",   "Wa",   2477,
     16,   "B2",  "G24",   2783,
     17,   "B3",   "St",   2260,
     18,   "B3",  "G18",   2603,
     19,   "B3",  "G27",   2857,
     20,   "B3",   "Ci",   2918,
     21,   "B3",  "G25",   2825,
     22,   "B3",  "G28",   1903,
     23,   "B3",  "G05",   2065,
     24,   "B3",   "Wa",   3107,
     25,   "B4",   "St",   3348,
     26,   "B4",  "G09",   2268,
     27,   "B4",  "G06",   2148,
     28,   "B4",   "Ci",   2940,
     29,   "B4",   "Wa",   2850,
     30,   "B4",  "G20",   2670,
     31,   "B4",  "G11",   3380,
     32,   "B4",  "G23",   2770,
     33,   "B5",   "St",   1315,
     34,   "B5",  "G02",   1055,
     35,   "B5",  "G21",   1688,
     36,   "B5",   "Wa",   1625,
     37,   "B5",   "Ci",   1398,
     38,   "B5",  "G10",   1293,
     39,   "B5",  "G08",   1253,
     40,   "B5",  "G16",   1495,
     41,   "B6",   "St",   3538,
     42,   "B6",  "G29",   2915,
     43,   "B6",  "G07",   3265,
     44,   "B6",   "Ci",   3483,
     45,   "B6",  "G01",   3013,
     46,   "B6",   "Wa",   3400,
     47,   "B6",  "G12",   2385,
     48,   "B6",  "G19",   3643
)

petersen.wheat <- as.data.frame(petersen.wheat)
petersen.wheat$block <- factor(petersen.wheat$block)
petersen.wheat$gen <- factor(petersen.wheat$gen)

# Verify check means match Petersen Table 5.8
dat_checks <- subset(petersen.wheat, gen %in% c("St", "Ci", "Wa"))
tapply(dat_checks$yield, dat_checks$gen, mean)
# Ci = 2726, St = 2759, Wa = 2678

# Verify MSE matches Petersen Table 5.10 (MSE = 91103)
m1 <- aov(yield ~ block + gen, data = dat_checks)
anova(m1)
# Residual Mean Sq = 91103

# Write to data folder
write.table(petersen.wheat, 
            file = "../data/petersen.wheat.txt",
            sep = "\t", 
            row.names = FALSE,
            quote = TRUE)
