## Preprocess data, write TAF data tables

## Before: ezekiel.txt (bootstrap/data)
## After:  ezekiel.csv (data)

library(TAF)

mkdir("data")

## Read data
ezekiel <- read.table("bootstrap/data/ezekiel.txt", header=TRUE)

## Write TAF table
write.taf(ezekiel, "data/ezekiel.csv")
