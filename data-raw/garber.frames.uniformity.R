# garber.frames.uniformity.R
# Time-stamp: <2025-12-23 12:40 wrightkevi>

libs(desplot, dplyr, kw, lattice, magrittr, readxl, readr, reshape2, tibble)

setwd("c:/drop/rpack/agridat/data-raw/")

# ----------------------------------------------------------------------------

# 1929 soybeans - 2 rows per frame
dat29 <- read_excel("garber.frames.uniformity.xlsx", sheet = "29soy")
dat29 <- mutate(dat29, year=1929, crop = "soybeans")

# 1930 wheat - 4 rows per frame
dat30 <- read_excel("garber.frames.uniformity.xlsx", sheet = "30wheat")
dat30 <- mutate(dat30, year=1930, crop = "wheat")

# Combine datasets
dat <- bind_rows(dat29, dat30)
head(dat)

# Rename platrow to frame_row for clarity
dat <- rename(dat, framerow = platrow)
head(dat)

dat <- select(dat, year, crop, row, col, framerow, yield, total)
head(dat)

garber.frames.uniformity <- dat
kw::agex(garber.frames.uniformity)

# ----------------------------------------------------------------------------

# Data checks and visualization

if(FALSE) {
  
  library(agridat)
  data(garber.frames.uniformity)
  dat <- garber.frames.uniformity
  
  # Check means
  dat %>% group_by(year, crop) %>% 
    summarize(mean_yield = mean(yield, na.rm = TRUE))
  
  # Soybeans 1929 - 2 rows per frame
  dat29 <- filter(dat, year == 1929)
  desplot(dat29, yield ~ col * row, 
          out1 = frame_row,
          flip = TRUE, tick = TRUE,
          main = "garber.frames.uniformity - 1929 soybeans")
  
  # Wheat 1930 - 4 rows per frame
  dat30 <- filter(dat, year == 1930)
  desplot(dat30, yield ~ col * row,
          out1 = frame_row,
          flip = TRUE, tick = TRUE,
          main = "garber.frames.uniformity - 1930 wheat (grain)")
  
  desplot(dat30, straw ~ col * row,
          out1 = frame_row,
          flip = TRUE, tick = TRUE,
          main = "garber.frames.uniformity - 1930 wheat (straw)")
  
}
