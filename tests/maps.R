###library(iNZightMaps)
devtools::document("~/iNZight/iNZightMaps")
devtools::load_all("~/iNZight/iNZightMaps", export_all = FALSE)

data(nzquakes)

map.obj <- iNZightMap(~latitude, ~longitude, data = nzquakes)

devtools::load_all("~/iNZight/iNZightMaps", export_all = FALSE)
plot(map.obj)




library(devtools)

load_all("~/iNZight/iNZightPlots")
load_all("~/iNZight/iNZightMaps")
data("gapminder", package = "iNZight")

mobj <- iNZightShapeMap(location = "world", shp.region = "country",
                        data.region = "Country", data = gapminder)
plot(mobj, variable = ~ChildrenPerWoman, g1="Leap.Year",
     zoom = 0.05, zoom.center = c(174.7633, -39.8485))



TRUE





library(cairoDevice)
Cairo()
library(iNZightMaps)

NZQuakes = read.csv("~/iNZight/data/QuakesNZ2000.csv", header = T)
obj <- iNZightMap(~Latitude, ~Longitude, qq)
plot(obj)


qq <- read.csv("~/Downloads/GeoNet_CMT_solutions.csv", header = T)


#############################
library(devtools)
#quakes <- read.csv("~/iNZight/data/QuakesNZ2000.csv", header = TRUE)

#load_all("~/iNZight/iNZightPlots")
#iNZightPlot(Latitude, Longitude, data = quakes, colby = Felt, sizeby = Magnitude, extra.vars = "Depth")

document("~/iNZight/iNZightMaps")
load_all("~/iNZight/iNZightMaps")
data(nzquakes)
nzquakes <- read.csv("~/Downloads/GeoNet_CMT_solutions.csv", header = T)
nzquakes <- nzquakes[!is.na(nzquakes$Longitude), ]
obj <- iNZightMap(lat=~Latitude, lon=~Longitude, data = nzquakes)
nzquakes2 <- nzquakes
nzquakes2$Longitude <- (nzquakes2$Longitude + 100) - 180
obj2 <- iNZightMap(lat=~Latitude, lon=~Longitude, data = nzquakes2)

plot(obj)#, colby = Order)#, sizeby = Magnitude, opacity = ~Depth, type = "satellite")
plot(obj2)#, colby = Order)#, sizeby = Magnitude, opacity = ~Depth, type = "satellite")


test <- data(nzquakes)

######## shape files
q()
library(maptools)

devtools::load_all("~/iNZight/iNZightPlots")
#data <- #read.csv("~/iNZight/data/FutureLearn/Gapminder.csv", header=T)
devtools::load_all("~/iNZight/iNZightMaps")
#d <- data
#shape.obj <- shape.extract(shp <- readShapePoly("~/iNZight/iNZightMaps/data/world/ne_110m_admin_0_countries.shp"))
iNZightPlot(ChildrenPerWoman, Country, data = d, plottype = "shapemap", 
            plot.features = list(shape.object = shape.obj, transform = "normal",
                col.method = "terrain.colors", col.offset=0))

world <- "~/iNZight/iNZightMaps/data/world/ne_110m_admin_0_countries.shp"
devtools::load_all("~/iNZight/iNZightMaps")
obj <- iNZightShapeMap(location = world, region = country, data)## data is optional, will check for non-matches

#obj <- renameRegions(obj, list("US" = "United States of America"))  ## US (in shape) -> United States of America

devtools::load_all("~/iNZight/iNZightMaps")
obj <- iNZightShapeMap(location = world, region = country, data)
plot(obj, variable = ~ChildrenPerWoman, region = ~Country, data = d, 
     col.fun = "terrain.colors", transform = "linear", col.offset = 0.2, col = "blue")
                       




## data.t = data.trans(d$Exports,transform = 'linear')
## data.o = order.match(data.t,shp[[4]],d$Country)
## color = col.fun(data.o,color.index = shape.obj$col.index,display = 'hue',col = 'blue',offset = 0.2)
## shape.obj = color.bind(color,shape.obj)






##library(iNZightMaps)
setwd("~/iNZight/iNZightMaps")
devtools::load_all("~/iNZight/iNZightMaps")

gminder <- read.csv("~/iNZight/data/FutureLearn/Gapminder.csv", header=T)

shp <- iNZightShapeMap(data = gminder, location = "world", data.region = "Country")

plot(shp, variable = ~ChildrenPerWoman, g1 = "Region", name="v", na.fill = "#dddddd", varnames=list(g1="ChildRate"))
plot(shp, variable = ~ChildrenPerWoman, g1 = "ChildrenPerWoman", name="v", na.fill = "#dddddd")

devtools::load_all("~/iNZight/iNZightMaps")
plot(shp, variable = ~ChildrenPerWoman, name = "b")


sClickOnZoom(ratio = 0.2)

srezoom(0.9)


world <- readRDS("data/world.rds")
class(world) <- "shape.object"

iNZightPlots::iNZightPlot(ChildrenPerWoman, data = gminder, g1 = Leap.Year)



## save shapefiles
devtools::use_data(world, internal = TRUE)





devtools::load_all("~/iNZight/iNZightMaps", export_all = FALSE)
quakes <- read.csv("~/iNZight/data/QuakesNZ2000.csv", header = TRUE)


devtools::load_all("~/iNZight/iNZightPlots", export_all = FALSE)
devtools::load_all("~/iNZight/iNZightMaps", export_all = FALSE)
map.obj <- iNZightMap(~Latitude, ~Longitude, data = quakes)
plot(map.obj, g1 = Depth, opacity = ~Depth, alpha = 1)



(quakes$Depth - min(quakes$Depth)) / diff(range(quakes$Depth))

ClickOnZoom(ratio = 0.3)
rezoom(0.1)



################ BUG FIX
ukschools <- read.csv("~/Downloads/UK Schools.csv", header = TRUE)
data("nzquakes")
nzquakes$Longitude <- nzquakes$Longitude + 3
nzquakes$Longitude[nzquakes$Longitude > 180] <- -180 + (nzquakes$Longitude[nzquakes$Longitude > 180] - 180)

rm("map")
devtools::load_all("~/iNZight/iNZightMaps", export_all = FALSE)
uk.map <- iNZightMap(~Latitude, ~Longitude, data = ukschools)
plot(uk.map)


quakes.map <- iNZightMap(~Latitude, ~Longitude, data = nzquakes)
plot(quakes.map)
