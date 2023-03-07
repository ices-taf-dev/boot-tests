## Prepare plots for report

## Before: summary.csv (output)
## After:  biomass.png, harvest_rate.png (report)

library(icesTAF)

mkdir("report")

## Trim year, change units
summary <- read.taf("output/summary.csv")
x <- summary[summary$Year<=2016,]
x <- div(x, c("Rec","B3plus","SSB","RefB","Landings"))

## Plots
taf.png("biomass")
plot(SSB~Year, x, type="l", lwd=2, ylim=lim(x$SSB), yaxs="i",
     ylab="SSB (1000 t)", main="Biomass")
dev.off()

taf.png("harvest_rate")
plot(HR~Year, x, subset=Year<=2014, type="l", lwd=2, ylim=lim(x$HR),
     yaxs="i", ylab="Harvest rate", main="Harvest rate")
dev.off()
