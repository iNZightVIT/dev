library(iNZightPlots); library(grid)
d <- read.csv("../data/Census at School-500.csv")
main <- dev.new()
iNZightPlot(d$height, d$armspan)

mini <- dev.new()
grid.newpage()
na <- is.na(d$height) | is.na(d$armspan)
opts <- inzPlotDefaults()
opts$largesample <- TRUE
iNZightPlots:::iNZscatterplot(d$height[!na], d$armspan[!na],
                              layout=grid.layout(2,1,heights=unit(c(0,1),
                                                         "null")),
                              opts = opts)

zoom.x <- c(130, 180)
zoom.y <- c(120, 180)

seekViewport("SCATTERVP")
grid.rect(x = mean(zoom.x), y = mean(zoom.y),
          width = diff(zoom.x), height = diff(zoom.y),
          default.units = "native",
          gp = gpar(fill = "grey70", alpha = 0.3),
          name = "ZoomRect")

dev.list()


+---------------------------------------------+
| =  +--------------------------------------+ |
| |  |                                      | |
| |  |                                      | |
| o  |                                      | |
| |  |                                      | |
| |  |        mini-plot window              | |
| |  |                                      | |
| o  |                                      | |
| |  |                                      | |
| |  |                                      | |
| |  |                                      | |
| |  |                                      | |
| |  |                                      | |
| |  |                                      | |
| =  +--------------------------------------+ |
|                                             |
|    |-----------o------------------o-------| |  <- horizontal "x" slider
|                                             |
|                                             |
|    Drag the sliders to select the area      |
|    to zoom in on.                           |
|                                             |
|             | BUTTON:ZOOM |                 |
|                                             |
|                                             |
+---------------------------------------------+
 ^
 | vertical "y" slider
