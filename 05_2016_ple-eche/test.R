library(TAF)
library(icesTAF, warn.conflicts=FALSE)

taf.boot()
print.simple.list(dir(boot.dir(), recursive=TRUE))

source.all()
print.simple.list(dir("report"))

clean()
clean.boot(force=TRUE)
