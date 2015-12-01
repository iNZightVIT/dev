data <- read.csv("~/iNZight/data/QuakesNZ2000.csv", header = TRUE)

devtools::load_all("~/iNZight/iNZightPlots", export_all = FALSE)
devtools::load_all("~/iNZight/iNZightMaps")

iNZightPlot(Longitude, Latitude, data = data, plottype = "map", xlab="", ylab="")

iNZightPlot(Longitude, Latitude, g1=Felt, data = data, plottype = "map", colby = Magnitude)


