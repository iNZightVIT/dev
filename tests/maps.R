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
