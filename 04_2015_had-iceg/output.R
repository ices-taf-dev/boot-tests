## Extract results of interest, write TAF output tables

## Before: resultsbyyear, resultsbyyearandage (model)
## After:  fatage.csv, natage.csv, summary.csv (output)

library(icesTAF)

mkdir("output")

rby <- read.table("model/resultsbyyear", header=TRUE, check.names=FALSE)
rbya <- read.table("model/resultsbyyearandage", header=TRUE)

## Summary by year
summary <-
  rby[c("year", "N2", "Cbio3+", "SSB", "HCRRefbio", "obscatch", "F4-7")]
names(summary) <- c("Year", "Rec", "B3plus", "SSB", "RefB", "Landings", "Fbar")
summary$RefB <- c(NA, summary$RefB[-nrow(summary)])  # RefB refers to next year
summary$YoverSSB <- summary$Landings / summary$SSB
summary$HR <- summary$Landings / summary$RefB
summary <- summary[c("Year", "Rec", "B3plus", "SSB", "RefB", "Landings",
                     "YoverSSB", "Fbar", "HR")]
summary[summary<0] <- NA
summary$B3plus <- summary$B3plus * 1000
summary$SSB <- summary$SSB * 1000
summary$RefB <- summary$RefB * 1000
summary$Landings <- summary$Landings * 1000

## N at age
natage <- xtabs(N~year+age, rbya)
natage <- data.frame(Year=1979:2019, unclass(natage), check.names=FALSE)
row.names(natage) <- NULL

## F at age
fatage <- xtabs(F~year+age, rbya)
fatage <- data.frame(Year=1979:2019, unclass(fatage), check.names=FALSE)
row.names(fatage) <- NULL
fatage[fatage<0] <- NA

## Write tables to output directory
write.taf(summary, dir="output")  # 2.1
write.taf(natage, dir="output")   # 2.2
write.taf(fatage, dir="output")   # 2.3
