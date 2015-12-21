###library(iNZightMaps)
devtools::document("~/iNZight/iNZightMaps")
devtools::load_all("~/iNZight/iNZightMaps", export_all = FALSE)
quakes <- read.csv("~/iNZight/data/QuakesNZ2000.csv", header = TRUE)

map.obj <- iNZightMap(~Latitude, ~Longitude, data = quakes)

devtools::load_all("~/iNZight/iNZightMaps", export_all = FALSE)
plot(map.obj, sizeby = Magnitude, colby = Felt)

?iNZightMap




library(cairoDevice)
Cairo()
library(iNZightMaps)
NZQuakes = read.csv("~/iNZight/data/QuakesNZ2000.csv", header = T)
obj <- iNZightMap(~Latitude, ~Longitude, NZQuakes)
plot(obj)


#############################
library(devtools)
#quakes <- read.csv("~/iNZight/data/QuakesNZ2000.csv", header = TRUE)

#load_all("~/iNZight/iNZightPlots")
#iNZightPlot(Latitude, Longitude, data = quakes, colby = Felt, sizeby = Magnitude, extra.vars = "Depth")

document("~/iNZight/iNZightMaps")
load_all("~/iNZight/iNZightMaps")
data(nzquakes)
obj <- iNZightMap(lat=~Latitude, lon=~Longitude, data = nzquakes)
plot(obj, g1=Felt,colby = Felt, sizeby = Magnitude, opacity = ~Depth, type = "satellite")
?iNZightMap

