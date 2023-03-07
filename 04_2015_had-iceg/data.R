## Preprocess data, write TAF data tables

## Before: catageysa.dat (bootstrap/data)
## After:  catage.csv, maturity.csv, survey_smb.csv, survey_smh.csv, wcatch.csv,
##         wstock.csv (data)

library(icesTAF)
source("utilities.R")

mkdir("data")

## Extract tables
data <- extractData("bootstrap/data/catageysa.dat")

## Write tables to data directory
setwd("data")
write.taf(data$catage)      # 1.2
write.taf(data$survey.smb)  # 1.3
write.taf(data$survey.smh)  # 1.4
write.taf(data$wstock)      # 1.5
write.taf(data$wcatch)      # 1.6
write.taf(data$maturity)    # 1.7
setwd("..")
