# harris.multi.uniformity.R


# The harris.multi.uniformity data is already in agridat,
# but this script changes the tons/ac to pounds per plot
# for the 1911 sugarbeet yields so that the units are the same
# for all years.

data(harris.multi.uniformity)
dat <- harris.multi.uniformity

# Convert 1911 from tons/ac to pounds/plot
dat$yield[dat$year==1911] <- 340 * dat$yield[dat$year==1911]

write.table(dat, file = "c:/drop/rpack/agridat/data/harris.multi.uniformity.txt", 
        sep = "\t", row.names = FALSE)
