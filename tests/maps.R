library(devtools)

load_all('~/iNZight/iNZightMaps')
data(quakes)

obj <- iNZightMap(~lat, ~long, quakes)
plot(obj)

library(ggmap)

bbox <- c(rbind(range(quakes$long, na.rm = TRUE),
                range(quakes$lat, na.rm = TRUE)))
map <- get_stamenmap(bbox, zoom = 5)
ggmap(map) + geom_point(aes(long, lat), data = quakes)

## adjust bbox for window
grid.newpage()
pushViewport(viewport(width = 0.8, height = 0.9))
grid.rect()

pw <- as.numeric(convertWidth(unit(1, "npc"), "in"))
ph <- as.numeric(convertHeight(unit(1, "npc"), "in"))
pr <- pw / ph

bd <- apply(matrix(bbox, ncol = 2), 1, diff)
br <- bd[1] / bd[2]

if (br < pr) {
    ## br is narrower
    ## extend bbox WIDTH so br == pr
    bc <- mean(bbox[c(1, 3)])
    bw <- br * bd[2]
    bbox[1] <- bc - bw/2
    bbox[3] <- bc + bw/2
} else {
    ## pr is narrower
}

zoom <- 5
if (bbox[1] < -180) {
} else if (bbox[3] > 180) {
    bbox.right <- bbox.left <- bbox
    bbox.left[3] <- 179.99999
    bbox.right[1] <- -180
    bbox.right[3] <- bbox.right[3] - 360
    map.left <- get_stamenmap(bbox.left, zoom = zoom)   
    map.right <- get_stamenmap(bbox.right, zoom = zoom)
    map <- as.raster(cbind(as.matrix(map.left), as.matrix(map.right)))
}

grid.newpage()
pushViewport(viewport(width = 0.8, height = 0.9,
                      xscale = bbox[c(1,3)], yscale = bbox[c(2, 4)]))
grid.raster(map)
grid.rect()
qp <- LonLat2XY(quakes$long, quakes$lat, zoom)
grid.points(quakes$long, quakes$lat, gp = gpar(cex = 0.5), pch = 19)



map <- get_stamenmap(bbox, zoom = 6)
ggmap(map)


NULL














############################################### OLD

library(devtools)
data('gapminder_2008', package = 'FutureLearnData')

load_all("~/iNZight/iNZightMaps", export_all = FALSE)
load_all("~/iNZight/iNZightModules", export_all = FALSE)
load_all("~/iNZight/iNZight", export_all = FALSE)

iNZight(gapminder_2008)




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
