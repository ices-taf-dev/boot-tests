library(icesTAF)

draft.data(originator="Arlin", year=2000, file=TRUE)
draft.software("arni-magnusson/areaplot@1.2.3", file=TRUE)
draft.software("bootstrap/initial/software/catageysa", file=TRUE, append=TRUE)

taf.boot()
print.simple.list(dir(boot.dir(), full=TRUE, recursive=TRUE))

source.all()
print.simple.list(dir("report"))

clean()
clean.boot(force=TRUE)
git <- system("git checkout -- bootstrap/DATA.bib")
unlink("bootstrap/SOFTWARE.bib")
