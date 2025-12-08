
id trial ID
project_name: either 21AIP, Pot21A
gen_A Genotype 1 of the trial
gen_B Genotype 2
gen_C Genotype 3
start - character
end - character
yield_pos
yield_neg
lon
lat

The data come from "tricot" (triadic comparisons of technology) trials.
On-farm potato evaluation trials conducted in Rwanda, beginning Sep/Oct 2020.
There are 11 genotypes evaluated in 168 field trials in an incomplete block design with 3 genotypes at each trial.

de Sousa, K., van Etten, J., Manners, R. et al. (2024).
The tricot approach: an agile framework for decentralized on-farm testing supported by citizen science. A retrospective.
Agron. Sustain. Dev. 44, 8.
https://doi.org/10.1007/s13593-023-00937-1

Open license. Electronic data from https://zenodo.org/records/6286006. File:  data/potato.csv
Also at https://github.com/AgrDataSci/tricot-framework-rtb/tree/v0.1







setwd("C:/drop/rpack/agridat/data-raw/")
dat <- read.csv("desousa.potato.csv")
head(dat)
libs(dplyr,stringr)

# remove time of dat
dat <- mutate(dat, start=str_sub(start, 1, 10),
              end=str_sub(end, 1, 10))
head(dat)
dim(dat) # 168 rows
length(unique(dat$gen_A)) # 11 varieties

desousa.potato <- dat
kw::agex(desousa.potato)

## ---------------------------------------------------------------------------

dat <- agridat::desousa.potato

# start and end as Date
# dat$start <- as.Date(dat$start)
# dat$end   <- as.Date(dat$end)

libs(gosset)
datrnk <- gosset::rank_tricot(dat,
                 # Specify the columns containing the three genotypes
                 items=c("gen_A", "gen_B","gen_C"),
                 # Specify the columns containing the rankings
                 input=c("yield_pos", "yield_neg"),
                 group = TRUE)
head(datrnk)

# Basic PlacketLuce model using only the ranks
libs(PlackettLuce)
mod0 <- PlackettLuce(datrnk)

# worth parameters (sum to 1) - probability of each item being ranked first
coef(mod0, log = FALSE)
plot(mod0, log=FALSE)

# Compare pairs of entries, quasi standard errors
# vertical line is at 1/11 (number of varieties)
mod0qv <- qvcalc::qvcalc(mod0)
# This is log scale.
plot(mod0qv, ylab = "Worth (log)", main = "desousa.potato", las=2)

# Now add covariates

libs(climatrends)
# get rainfall and temperature indices using 
# data from NASA POWER
# compute the indices for the first 100 days 
# after the distribution of seeds
rain <- climatrends::rainfall(dat[,c("lon", "lat")], 
                 day.one = dat$start, span = 100)
head(rain)

temp <- climatrends::temperature(dat[,c("lon", "lat")], 
                    day.one = dt$start, span = 100)
head(temp)
covars <- cbind(rain,temp)

# Drop SU TR CFD
drop <- caret::nearZeroVar(covars)

names(covars)[drop]
covar <- covars[-drop]
head(covar)

datpl <- cbind(datrnk, covars)
libs(PlackettLuce)
mod1 <- PlackettLuce(datrnk, data=datpl)
summary(mod1)
