# AugmentedRCB.txt
# Time-stamp: <2026-07-22 09:04:09 wrightkevi>

This data is taken from

@Article{Scott1993,
  author =       {R A Scott and G A Milliken},
  title =        {A SAS Program for Analyzing Augmented Randomized Complete
                  Block Designs},
  journal =      {Crop Sci.},
  year =         1993,
  volume =       33,
  pages =        {865--867},
  annote =       {File: Augmented.}
}

libs(desplot,dplyr,kw,lattice,magrittr,readxl,readr,reshape2,tibble)

# ----------------------------------------------------------------------------

# one matrix, no column names

setwd("c:/drop/rpack/agridat/data-raw/")
dat <- read_csv("scott.augmented.csv")#, col_names=FALSE)
dat <- filter_out(dat, is.na(yield))

scott.augmented <- dat
kw::agex(scott.augmented)

