library(devtools)

pkg <- "~/iNZight/iNZightPlots"

load_all(pkg)
document(pkg)

check_doc(pkg)
check(pkg)

