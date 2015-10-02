# klumper.gmo.meta.r

# Klumper 2015
# A Meta-Analysis of the Impacts of Genetically Modified Crops
# http://journals.plos.org/plosone/article?id=10.1371/journal.pone.0111629

# I used an online tool to convert the supplemental pdf into excel.
# The excel file separate tab for each pdf page and I had to manually
# combine the pages and re-align some columns since not each tab had
# exactly the same number of columns.

# The published data have the effect size, but not the standard error
# of the effect.

library(rio)
dat <- import("klumper.gmo.meta.xlsx")
dat <- subset(dat, !is.na(study))

# Similar to the histogram in figure S1
lib(lattice)
histogram(dat$d_yield, n=21)
