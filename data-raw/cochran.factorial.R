# cochran.factorial.R

# Data already exists. Here we just add individual treatments.
data(cochran.factorial)
dat <- cochran.factorial

dat <- mutate(dat,
              d=ifelse(str_detect(trt, "d"), 0, 1),
              n=ifelse(str_detect(trt, "n"), 0, 1),
              p=ifelse(str_detect(trt, "p"), 0, 1),
              k=ifelse(str_detect(trt, "k"), 0, 1))
str(dat)

write.table(dat,
            file = "c:/drop/rpack/agridat/data/cochran.factorial.txt", 
            sep = "\t", row.names = FALSE)
