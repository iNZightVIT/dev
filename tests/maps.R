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
plot(obj, colby = Order)#, sizeby = Magnitude, opacity = ~Depth, type = "satellite")




######## shape files
q()
library(maptools)
library(grid)

devtools::load_all("~/iNZight/iNZightMaps")

data <- read.csv("~/iNZight/data/FutureLearn/Gapminder.csv", header = TRUE)
shade.map('~/iNZight/iNZightMaps/data/world/TM_WORLD_BORDERS-0.3.shp',
          data = data, region = 'Country', colby = 'ChildrenPerWoman',
          transform = 'linear', display = 'terrain.colors', offset = 0)



library(iNZightPlots)
data <- read.csv("~/iNZight/data/FutureLearn/Gapminder.csv", header=T)
devtools::load_all("~/iNZight/iNZightMaps")

shapeobj <- shape.extract(shp <- readShapePoly("~/iNZight/iNZightMaps/data/world/TM_WORLD_BORDERS-0.3.shp"),
                          "ChildrenPerWoman", "exp", "hue", data = data, na.fill = "black",
                          offset = 0,col = "green4", region = "Country")
myshape <- data.frame(x = shapeobj$polygon[, 1],
                      y = shapeobj$polygon[, 2],
                      id = as.numeric(rownames(shapeobj$polygon)))

devtools::load_all("~/iNZight/iNZightMaps")
iNZightPlot(ChildrenPerWoman, Country, data = data, plottype = "map",
            plot.features =
                list(maptype = "shape", shape.obj = myshape, temp.col = shapeobj$color))




head(myshape)
