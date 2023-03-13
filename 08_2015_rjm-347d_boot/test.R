library(TAF)
library(icesTAF, warn.conflicts=FALSE)

TAF::taf.boot()
print.simple.list(dir(boot.dir(), full=TRUE, recursive=TRUE))

source.all()
print.simple.list(dir("report"))

clean()
clean.boot(force=TRUE)
