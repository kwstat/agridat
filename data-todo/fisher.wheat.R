# fisher.wheat.R
# Time-stamp: <28 Oct 2019 14:28:53 c:/x/rpack/agridat/data-raw/fisher.wheat.R>

libs(asreml,dplyr,fs,janitor,kw,lattice,readxl,readr,reshape2,tibble)

setwd("c:/x/rpack/agridat/data-raw/")
dat <- janitor::clean_names(dat0)
head(dat)

# Rainfall data
YOU MUST CITE AS: Rothamsted Research (2018). Rothamsted mean long-term monthly rainfall. Electronic Rothamsted Archive https://doi.org/10.23637/RMMRAIN5318
# https://serverfault.com/questions/792712/use-windows-hosts-file-to-redirect-external-url-to-subdomain
# Save RMMRAIN to fisher.wheat_RMMRAIN5318-data-v2.csv
dat1 <- read_csv("fisher.wheat_RMMRAIN5318-data-v2.csv")
dat1 <- dat1[1:166,] # remove blank rows
dat1 <- melt(dat1, id.var="Year")
dat1 <- rename(dat1, month=variable, year=Year, precip=value)
dat1 <- mutate(dat1,
               month = recode(month,
                             "January"="1",
                             "February"="2",
                             "March"="3",
                             "April"="4",
                             "May"="5",
                             "June"="6",
                             "July"="7",
                             "August"="8",
                             "September"="9",
                             "October"="10",
                             "November"="11",
                             "December"="12"))
dat1 <- mutate(dat1, month=as.numeric(month))


# Wheat data
Original paper:  Fisher, R. A. (1921) "Studies in crop variation. 1. An examination of the yield of dressed grain from Broadbalk", Journal of Agricultural Science, 11 (part 2), 107-135

You are free to re-use this data but YOU MUST CITE AS: Rothamsted Research (2018), Fisher 1921 Broadbalk wheat grain yields 1852-1918. Electronic Rothamsted Archive https://doi.org/10.23637/rbk1-data-fisher-1921-01

Notes from Margaret Glendining, Rothamsted Research.

In 1901 the T half of some plots was divided into two, TT and TM. Ammonium bicarbonate was applied to the lower half (TM) instead 
of the usual ammonium sulphate.  Fisher excluded the TM plots from the mean value in 1901. 

See Broadbalk Plan 1852-1925 for a more details. 


The following rules have been followed, to reconstruct data for plots 6, 7 and 8, using data derived from plots 5 and 11, and other plots 
as appropriate, as a template. 
Plots 2b, and 3&4 have not been used as a template for deriving this data, as the plot layout is different to the other plots. 

1852-1893
1889
1890
1894-1900
1901
1902-1911
1912-1918
1916


http://www.era.rothamsted.ac.uk/Broadbalk/Fisher1921

fisher.wheat_Fisher1921yields-1852-1918-2018-08-01-V1-01.csv
daty <- read.csv("fisher.wheat_Fisher1921yields-1852-1918-2018-08-01-V1-01.csv", skip=4)
colnames(daty) <- c('year','2b','3&4','5','6','7','8','10','11','12','13','14','17','18')
daty <- daty[1:67,] # remove rows
daty <- melt(daty)
colnames(daty) <- c('year','plot','yield')

# Fisher Table I
group_by(daty, plot) %>% summarize(mean=mean(yield)) %>% as.data.frame()
