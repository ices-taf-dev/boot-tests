library(TAF)

# Empty skeleton
taf.skeleton()

# Create data file and data script
write.table(BOD, file.path(boot.dir(), "initial/data/bod.dat"), row.names=FALSE, quote=FALSE)
script <- 'write.table(faithful, "faithful.dat", row.names=FALSE, quote=FALSE)'
write(script, file.path(boot.dir(), "faithful.R"))

# Create DATA.bib
draft.data(data.files=dir(file.path(boot.dir(), "initial/data")),
           data.scripts=dir(boot.dir(), pattern="\\.R$"),
           file=file.path(boot.dir(), "DATA.bib"))

# Create two identical dir trees: boot and bootstrap
mkdir("bootstrap")
cp("boot/*", "bootstrap")

# Edit data.R
script <- 'faith <- read.table(file.path(boot.dir(), "data/faithful/faithful.dat"), header=TRUE)
oxygen <- read.table(file.path(boot.dir(), "data/bod.dat"), header=TRUE)\n
write.taf(faith, dir="data")
write.taf(oxygen, dir="data")'
write(script, "data.R", append=TRUE)

# Edit model.R
script <- 'faith <- read.taf("data/faith.csv")
oxygen <- read.taf("data/oxygen.csv")\n
fm.faith <- lm(faith)
fm.oxygen <- lm(demand~Time, oxygen)\n
save(fm.faith, fm.oxygen, file="model/results.RData")'
write(script, "model.R", append=TRUE)

# Edit output.R
script <- 'faith.fit <- data.frame(fm.faith$model, fit=fm.faith$fit)
oxygen.fit <- data.frame(fm.oxygen$model, fit=fm.oxygen$fit)\n
write.taf(faith.fit, dir="output")
write.taf(oxygen.fit, dir="output")'
write(script, "output.R", append=TRUE)

# Edit report.R
script <- 'faith.fit <- read.taf("output/faith_fit.csv")
oxygen.fit <- read.taf("output/oxygen_fit.csv")\n
taf.png("faith")
plot(eruptions~waiting, faith.fit)
lines(fit~waiting, faith.fit[order(faith.fit$waiting),])
dev.off()\n
taf.png("oxygen")
plot(demand~Time, oxygen.fit)
lines(fit~Time, oxygen.fit)
dev.off()'
write(script, "report.R", append=TRUE)

# Boot
taf.boot()
print.simple.list(dir(boot.dir(), full=TRUE, recursive=TRUE))

# Run
source.all()
print.simple.list(dir("report"))

# Remove everything except test.R
clean()
unlink(boot.dir(), recursive=TRUE)
unlink(boot.dir(), recursive=TRUE)
unlink(c("data.R", "model.R", "output.R", "report.R"))
