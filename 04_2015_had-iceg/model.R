## Run analysis, write model results

## Before: catageysa (bootstrap/software), catageysa.dat (bootstrap/data)
## After:  resultsbyyear, resultsbyyearandage (model)

library(icesTAF)

mkdir("model")

## Get model executable
exefile <- if(os.linux()) "catageysa" else "catageysa.exe"
cp(file.path("bootstrap/software/catageysa", exefile), "model")

## Get model input file
cp("bootstrap/data/catageysa.dat", "model")

## Run model
setwd("model")
system("./catageysa")
setwd("..")
