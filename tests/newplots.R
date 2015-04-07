library(devtools)

pkg <- "~/iNZight/iNZightPlots"

load_all(pkg)
document(pkg)

?inzpar

check_doc(pkg)
check(pkg)


load_all(pkg)
iNZightPlot(x = Sepal.Width, y = NULL, varnames = list(x = "Sepal Width", y = "oops"), data = iris)

getPlotSummary(x = Sepal.Width, y = NULL, varnames = list(x = "Sepal Width", y = "oops"), data = iris)

getPlotSummary(x = Sepal.Width, data = iris, inference.type = "conf", summary.type = "inference", bs.inference = TRUE)


upd()
pl <- iNZightPlot(height, age, gender, data = d1, plot = FALSE)
