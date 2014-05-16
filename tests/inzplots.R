library(grid)
upd <- function() {
    try(system("rm ~/iNZight/iNZightPlots/R/*~"))
    invisible(lapply(list.files("~/iNZight/iNZightPlots/R", full.names = TRUE), source))
}
d <- read.csv("~/iNZight/data/Census at School-500.csv")
H <- d$height; A <- d$armspan
count <- rpois(500, 10)

upd();
fs <- inzStructure("freq", count)
pp <- iNZightPlot(height, armspan, sizeby = age, data = d)

upd()
head(iNZightPlot(H, log(A), varnames = list(x = "height (cm)", freq = "count"), structure = fs)) -> p

upd()
d$height[10] <- Inf
p <- iNZightPlot(height, armspan, colby = gender, data = d)
p <- iNZightPlot(height, armspan, g2 = gender, g2.level = "male", data = d)

upd()
iNZightPlot(height, armspan, g2 = cellsource, g2.level = 2, data = d)$missing

upd()
ff <- as.factor(sample(1:200, 500, TRUE))
iNZightPlot(ff)

upd()
iNZightPlot(height, armspan, g1 = cellsource, g1.level = 1:2, data = d)$missing
iNZightPlot(height, data = d, structure = fs)
iNZightPlot(gender, data = d)

upd()
ipar <- inzpar(jitter = "x")
iNZightPlot(height, armspan, data = d, inzpar = ipar)$toplot
iNZightPlot(height, armspan, data = d, jitter = "y")$inzpar$jitter
iNZightPlot(height, armspan, data = d)$inzpar$jitter

upd()
iNZightPlot(height, armspan, data = d)$toplot
iNZightPlot(height, armspan, g1 = gender, data = d)$toplot

upd()
iNZightPlot(height, armspan, data = d, structure = fs)$toplot$all -> eh

upd()
iNZightPlot(height, armspan, data = d)
iNZightPlot(height, armspan, g1 = gender, structure = fs, data = d, alpha = 0.5, colby = getlunch)

upd()
iNZightPlot(y=height, x=armspan, data=d, g1=gender, g2=getlunch, g2.level="_MULTI")



grid.newpage(); pushViewport(viewport(width=0.5, height=0.5)); grid.rect()
pushViewport(viewport(layout = grid.layout(2, 1, heights = unit(c(1, 5), "null"))))

pushViewport(viewport(layout.pos.row = 1)); grid.rect(gp = gpar(fill = "yellow"))
upViewport()
pushViewport(viewport(layout.pos.row = 2, xscale = c(2, 8), yscale = c(10, 20)))

grid.xaxis(); grid.yaxis()

xax <- xaxisGrob(main = FALSE, label = FALSE)
upViewport()
pushViewport(viewport(layout.pos.row = 1))
grid.draw(xax)


## --- things to do:
# - "sizeby" needs to be calculated RIGHT AT THE BEGINNING (using rescale() before it is split)
