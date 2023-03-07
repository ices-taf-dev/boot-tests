## Prepare tables for report

## Before: catage.csv, maturity.csv, survey_smh.csv, wcatch.csv,
##         wstock.csv (data), fatage.csv, natage.csv, summary.csv (output)
## After:  catage.csv, fatage.csv, maturity.csv, natage.csv, survey_smh.csv,
##         summary.csv, wcatch.csv, wstock.csv (report)

library(icesTAF)

mkdir("report")

## catage (plus group)
catage <- read.taf("data/catage.csv")
catage$"10" <- rowSums(catage[as.character(10:14)])
catage <- plus(catage[c("Year", as.character(2:10))])
write.taf(catage, dir="report")

## survey_smh (skip year)
survey.smh <- read.taf("data/survey_smh.csv")
survey.smh <- na.omit(survey.smh)
write.taf(survey.smh, dir="report")

## wstock (trim year and age)
wstock <- read.taf("data/wstock.csv")
wstock <- head(wstock, -1)[c("Year",as.character(1:10))]
write.taf(wstock, dir="report")

## wcatch (trim year and age)
wcatch <- read.taf("data/wcatch.csv")
wcatch <- head(wcatch, -2)[c("Year",as.character(2:10))]
write.taf(wcatch, dir="report")

## maturity (trim year and age)
maturity <- read.taf("data/maturity.csv")
maturity <- head(maturity, -1)[c("Year",as.character(2:10))]
write.taf(maturity, dir="report")

## summary (select columns, trim year, insert NA, average, round)
summary <- read.taf("output/summary.csv")
summary$RefB <- summary$HR <- NULL
summary <- head(summary, -4)
summary$Fbar[nrow(summary)] <- NA
avg <- as.data.frame(t(colMeans(head(summary,-1), na.rm=TRUE)))
avg["Year"] <- paste0("Mean79-", summary$Year[nrow(summary)-1])
summary <- rbind(summary, avg)
summary <- rnd(summary, c("Rec","B3plus","SSB","Landings"))
summary <- rnd(summary, c("YoverSSB","Fbar"), 3)
write.taf(summary, dir="report")

## natage (trim year and age, change units, round)
natage <- read.taf("output/natage.csv")
natage <- head(natage, -2)[c("Year", as.character(1:10))]
natage[-1] <- natage[-1] / 1000
natage <- rnd(natage, as.character(1:5), 1)
natage <- rnd(natage, as.character(6:10), 2)
write.taf(natage, dir="report")

## fatage (trim year and age)
fatage <- read.taf("output/fatage.csv")
fatage <- head(fatage, -2)[c("Year", as.character(2:10))]
fatage <- round(fatage, 3)
write.taf(fatage, dir="report")
