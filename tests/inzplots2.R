library(grid); library(survey); library(quantreg); library(hexbin); library(boot); library(devtools)
upd <- function() {
   # dd <- "~/iNZight/iNZightPlots/R"
   # if (length(list.files(dd, pattern = "*~")) > 0)
   #     system(paste0("rm ", dd, "/*~"))
   # invisible(lapply(list.files(dd, full.names = TRUE), source))
    load_all("~/iNZight/iNZightPlots")
}
data(api)
d1 <- read.csv("~/iNZight/data/Census at School-500.csv", header = TRUE, comment.char = "#")
d2 <- read.csv("~/iNZight/data/nhanes-03-04.chris.csv", header = TRUE)
d3 <- read.csv("~/iNZight/data/Gap Minder Data.csv")
d4 <- apiclus2
d5 <- read.csv("~/iNZight/data/Dolphins.csv", header = TRUE)

des1 <- svydesign(ids=~dnum+snum, fpc=~fpc1+fpc2, data=d4)
des2 <- svydesign(ids=~1, weights=~WTINT2YR, data=d2)


######################################################### X: NUMERIC; Y: NUMERIC
## simple data
upd()
iNZightPlot(y = height, x = armspan, data = d1)
iNZightPlot(y = height, x = armspan, data = d1, pch = 19)
iNZightPlot(y = height, x = armspan, data = d1, g1 = gender)
iNZightPlot(y = height, x = armspan, data = d1, g1 = gender, g2 = getlunch, g2.level = "_MULTI")
            #cex.lab = 1.4, cex.axis = 1.5)

## frequency data
upd()
iNZightPlot(y = height, x = armspan, data = d1, freq = year)
iNZightPlot(y = height, x = armspan, data = d1, freq = year, g1 = gender)
iNZightPlot(y = height, x = armspan, data = d1, freq = year, g1 = gender, g2 = getlunch, g2.level = "_MULTI")

## survey data
# - small
upd()
iNZightPlot(y = api99, x = api00, design = des1)
iNZightPlot(y = api99, x = api00, design = des1, g1 = sch.wide)
iNZightPlot(y = api99, x = api00, design = des1, g1 = sch.wide, g2 = awards, g2.level = "_MULTI")




## large simple
upd()
iNZightPlot(y = Life.Expectancy, x = log10(GDP.per.Capita), data = d3)
iNZightPlot(y = Life.Expectancy, x = log10(GDP.per.Capita), data = d3, alpha = 0)

iNZightPlot(y = Life.Expectancy, x = log10(GDP.per.Capita), data = d3, plottype = "hex", hex.bins = 20)


## large frequency
upd()
iNZightPlot(y = Life.Expectancy, x = log10(GDP.per.Capita), data = d3, freq = Population)

## large survey
upd()
iNZightPlot(y = BPXSAR, x = BPXDAR, design = des2)


############################################################ X:NUMERIC; Y:NULL
upd()
iNZightPlot(height, data = d1, plottype = "hist")
iNZightPlot(meals, data = d4)

upd()
iNZightPlot(meals, design = des1)
iNZightPlot(height, data = d1, freq = year)


############################################################ X:NUMERIC; Y:FACTOR
upd()
iNZightPlot(height, gender, data = d1)
iNZightPlot(height, gender, data = d1, freq = year)
iNZightPlot(meals, awards, design = des1)

iNZightPlot(height, gender, data = d1, plottype = "hist")
iNZightPlot(height, gender, data = d1, freq = year)
iNZightPlot(meals, awards, design = des1)


upd()
iNZightPlot(height, gender, data = d1, g1 = gender) 
iNZightPlot(height, gender, data = d1, freq = year, g1 = gender, hist.bins = 20)
iNZightPlot(meals, awards, design = des1, g1 = awards, hist.bins = 20)

upd()
iNZightPlot(height, gender, data = d1, g1 = cellsource, g2 = getlunch, g2.level = "_MULTI")


############################################################# X:FACTOR; Y:FACTOR
upd()
iNZightPlot(getlunch, data = d1)
iNZightPlot(getlunch, data = d1, freq = year)
iNZightPlot(awards, design = des1)

upd()
iNZightPlot(getlunch, gender, data = d1)
iNZightPlot(getlunch, gender, data = d1, freq = year)
iNZightPlot(awards, both, design = des1)

upd()
iNZightPlot(height, data = d1)
iNZightPlot(gender, data= d1)
iNZightPlot(height, data =d1)
iNZightPlot(height, age, data=d1)
iNZightPlot(gender, height, data=d1, g1 = getlunch)
upd();
iNZightPlot(gender, getlunch, data=d1)


upd()
iNZightPlot(height, armspan, data = d1, colby = cellsource)
iNZightPlot(height, armspan, data = d1, colby = cellcost)
iNZightPlot(height, armspan, data = d1, colby = age, g1 = age)
upd()
iNZightPlot(gender, armspan, data= d1, colby = gender)
iNZightPlot(height, armspan, age, data =d1, colby = gender)
iNZightPlot(height, gender, data=d1, colby = getlunch)
iNZightPlot(gender, height, data=d1, g1 = getlunch, colby=travel)
iNZightPlot(gender, getlunch, data=d1)


upd()
iNZightPlot(height, data = d1, colby = age) -> dummy
iNZightPlot(gender, data= d1, colby = age)
iNZightPlot(height, age, data =d1, colby = age)
iNZightPlot(height, gender, data=d1, colby = age)
iNZightPlot(gender, height, data=d1, g1 = getlunch, colby=age)
iNZightPlot(gender, getlunch, data=d1, colby = age)

iNZightPlot(getlunch, travel, data = d1, g1 = cellsource)



upd()
iNZightPlot(height, data = d1, colby = cellsource, sizeby = year)
iNZightPlot(gender, data= d1, colby = gender, sizeby = cellcost)
iNZightPlot(height, age, data =d1, colby = gender, sizeby = cellcost)


upd()
iNZightPlot(height, data = d1, colby = age)
iNZightPlot(gender, data= d1, colby = age)
iNZightPlot(height, age, data =d1, colby = age)
iNZightPlot(height, gender, data=d1, colby = age)
iNZightPlot(gender, height, data=d1, g1 = getlunch, colby=age)
iNZightPlot(gender, getlunch, data=d1, colby = age)






upd()
d <- d1
iNZightPlot(height, armspan, data = d)
iNZightPlot(height, armspan, sizeby = age, g1 = gender, data = d)
iNZightPlot(height, armspan, g1 = age, sizeby = age, data = d)

upd()
iNZightPlot(height, armspan, data = d, rugs = "xy", LOE = TRUE)
iNZightPlot(height, armspan, data = d, smooth = 0.5)
iNZightPlot(height, armspan, data = d, smooth = 0.5, colby = gender, trend.by = TRUE)
iNZightPlot(height, armspan, data = d, trend = c("linear", "cubic"))
#pdf("example-trends.pdf", height = 8, width = 10)
iNZightPlot(height, armspan, data = d, trend = c("linear", "cubic"), colby = getlunch,
            trend.by = TRUE, trend.parallel = FALSE)
iNZightPlot(height, armspan, data = d, trend = c("linear", "cubic"), colby = getlunch,
            trend.by = TRUE, trend.parallel = TRUE)
#dev.off()
iNZightPlot(height, armspan, data = d, trend = c("linear", "cubic"), bs.inference = TRUE)


upd()
iNZightPlot(height, armspan, data = d, rugs = "xy", LOE = TRUE,
            g1 = gender, g2 = getlunch, g2.level = "_MULTI")
iNZightPlot(height, armspan, data = d, smooth = 0.5,
            g1 = gender, g2 = getlunch, g2.level = "_MULTI")
iNZightPlot(height, armspan, data = d, smooth = 0.5, colby = gender, trend.by = TRUE,
            g1 = gender, g2 = getlunch, g2.level = "_MULTI")
iNZightPlot(height, armspan, data = d, trend = c("linear", "cubic"),
            g1 = gender, g2 = getlunch, g2.level = "_MULTI")
iNZightPlot(height, armspan, data = d, trend = "linear", colby = gender, trend.by = TRUE,
            g1 = gender, g2 = getlunch, g2.level = "_MULTI")
iNZightPlot(height, armspan, data = d, trend = c("linear", "cubic"), bs.inference = TRUE,
            g1 = gender, g2 = getlunch, g2.level = "_MULTI")



upd()
iNZightPlot(height, gender, data = d, g1 = gender, g2 = getlunch, g2.level = "_MULTI")

upd()
iNZightPlot(height, armspan, data = d1, freq = year)




#################### FULL SUITE OF TESTING:

##### X NUMERIC, Y NUMERIC - SIMPLE, SMALL = SCATTERPLOT
upd()
iNZightPlot(height, armspan, data = d1)
iNZightPlot(height, armspan, data = d1, colby = cellcost)
iNZightPlot(height, armspan, data = d1, colby = cellsource)
iNZightPlot(height, armspan, data = d1, sizeby = cellcost)
iNZightPlot(height, armspan, data = d1, sizeby = cellcost, colby = rightfoot)

upd()
iNZightPlot(height, armspan, data = d1, LOE = TRUE)
iNZightPlot(height, armspan, data = d1, trend = "linear")
iNZightPlot(height, armspan, data = d1, smooth = 0.7)
iNZightPlot(height, armspan, data = d1, smooth = 0.7, colby = gender, trend.by = TRUE)
iNZightPlot(height, armspan, data = d1, quant.smooth = "default")
iNZightPlot(height, armspan, data = d1, colby = cellsource, trend = "linear", trend.by = TRUE)
iNZightPlot(height, armspan, data = d1, colby = cellcost, trend = "linear", trend.by = TRUE)

iNZightPlot(height, armspan, data = d1, alpha = 0.5)
iNZightPlot(height, armspan, data = d1, rugs = "xy")
iNZightPlot(height, armspan, data = d1, fill.pt = "blue")

## --- grouping 1
upd()
iNZightPlot(height, armspan, data = d1, g1 = gender)
iNZightPlot(height, armspan, data = d1, colby = cellcost, g1 = gender)
iNZightPlot(height, armspan, data = d1, colby = cellsource, g1 = gender)
iNZightPlot(height, armspan, data = d1, sizeby = cellcost, g1 = gender)
iNZightPlot(height, armspan, data = d1, sizeby = cellcost, colby = rightfoot, g1 = gender)

iNZightPlot(height, armspan, data = d1, LOE = TRUE, g1 = gender)
iNZightPlot(height, armspan, data = d1, trend = "linear", g1 = gender)
iNZightPlot(height, armspan, data = d1, smooth = 0.7, g1 = gender)
iNZightPlot(height, armspan, data = d1, quant.smooth = "default", g1 = gender)
iNZightPlot(height, armspan, data = d1, colby = cellsource, trend = "linear", trend.by = TRUE, g1 = gender)
iNZightPlot(height, armspan, data = d1, colby = cellcost, trend = "linear", trend.by = TRUE, g1 = gender)

iNZightPlot(height, armspan, data = d1, alpha = 0.5, g1 = gender)
iNZightPlot(height, armspan, data = d1, rugs = "xy", g1 = gender)
iNZightPlot(height, armspan, data = d1, fill.pt = "orange", g1 = gender, col.pt = "magenta")

## --- grouping 2
upd()
iNZightPlot(height, armspan, data = d1, g1 = gender, g2 = getlunch, g2.level = "_MULTI")
iNZightPlot(height, armspan, data = d1, colby = cellcost, g1 = gender, g2 = getlunch, g2.level = "_MULTI")
iNZightPlot(height, armspan, data = d1, colby = cellsource, g1 = gender, g2 = getlunch, g2.level = "_MULTI")
iNZightPlot(height, armspan, data = d1, sizeby = cellcost, g1 = gender, g2 = getlunch, g2.level = "_MULTI")
iNZightPlot(height, armspan, data = d1, sizeby = cellcost, colby = rightfoot, g1 = gender, g2 = getlunch, g2.level = "_MULTI")

iNZightPlot(height, armspan, data = d1, LOE = TRUE, g1 = gender, g2 = getlunch, g2.level = "_MULTI")
iNZightPlot(height, armspan, data = d1, trend = "linear", g1 = gender, g2 = getlunch, g2.level = "_MULTI")
iNZightPlot(height, armspan, data = d1, smooth = 0.7, g1 = gender, g2 = getlunch, g2.level = "_MULTI")
iNZightPlot(height, armspan, data = d1, quant.smooth = "default", g1 = gender, g2 = getlunch, g2.level = "_MULTI")
iNZightPlot(height, armspan, data = d1, colby = cellsource, trend = "linear", trend.by = TRUE,
            g1 = gender, g2 = getlunch, g2.level = "_MULTI")
iNZightPlot(height, armspan, data = d1, colby = cellcost, trend = "linear", trend.by = TRUE,
            g1 = gender, g2 = getlunch, g2.level = "_MULTI")

iNZightPlot(height, armspan, data = d1, alpha = 0.5, g1 = gender, g2 = getlunch, g2.level = "_MULTI")
iNZightPlot(height, armspan, data = d1, rugs = "xy", g1 = gender, g2 = getlunch, g2.level = "_MULTI")
iNZightPlot(height, armspan, data = d1, fill.pt = "orange", g1 = gender, col.pt = "magenta",
            g2 = getlunch, g2.level = "_MULTI")

##### X NUMERIC, Y NUMERIC - SIMPLE, LARGE = GRIDPLOT
upd()
iNZightPlot(Life.Expectancy, log10(GDP.per.Capita), data = d3)

upd()
iNZightPlot(Life.Expectancy, log10(GDP.per.Capita), data = d3, LOE = TRUE)
iNZightPlot(Life.Expectancy, log10(GDP.per.Capita), data = d3, trend = "linear")
iNZightPlot(Life.Expectancy, log10(GDP.per.Capita), data = d3, colby = Region,
            trend = "linear", trend.by = TRUE)
iNZightPlot(Life.Expectancy, log10(GDP.per.Capita), data = d3, smooth = 0.7)
iNZightPlot(Life.Expectancy, log10(GDP.per.Capita), data = d3, quant.smooth = "default")
iNZightPlot(Life.Expectancy, log10(GDP.per.Capita), data = d3, alpha = 0.5)
iNZightPlot(Life.Expectancy, log10(GDP.per.Capita), data = d3, scatter.grid.bins = 100)


## --- grouping 1
upd()
iNZightPlot(Life.Expectancy, log10(GDP.per.Capita), data = d3, g1 = Region)

iNZightPlot(Life.Expectancy, log10(GDP.per.Capita), data = d3, LOE = TRUE, g1 = Region)
iNZightPlot(Life.Expectancy, log10(GDP.per.Capita), data = d3, trend = "linear", g1 = Region)
iNZightPlot(Life.Expectancy, log10(GDP.per.Capita), data = d3, smooth = 0.7, g1 = Region)
iNZightPlot(Life.Expectancy, log10(GDP.per.Capita), data = d3, quant.smooth = "default", g1 = Region)

iNZightPlot(Life.Expectancy, log10(GDP.per.Capita), data = d3, alpha = 0.5, g1 = Region)

## --- grouping 2
upd()
iNZightPlot(Life.Expectancy, log10(GDP.per.Capita), data = d3, g1 = Year, g2 = Region, g2.level = "_MULTI")

iNZightPlot(Life.Expectancy, log10(GDP.per.Capita), data = d3, LOE = TRUE, g1 = Year, g2 = Region, g2.level = "_MULTI")
iNZightPlot(Life.Expectancy, log10(GDP.per.Capita), data = d3, trend = "linear", g1 = Year, g2 = Region, g2.level = "_MULTI")
iNZightPlot(Life.Expectancy, log10(GDP.per.Capita), data = d3, smooth = 0.7, g1 = Year, g2 = Region, g2.level = "_MULTI")
iNZightPlot(Life.Expectancy, log10(GDP.per.Capita), data = d3, quant.smooth = "default",
            g1 = Year, g2 = Region, g2.level = "_MULTI")

iNZightPlot(Life.Expectancy, log10(GDP.per.Capita), data = d3, alpha = 0.5, g1 = Year, g2 = Region, g2.level = "_MULTI")
iNZightPlot(Life.Expectancy, log10(GDP.per.Capita), data = d3, rugs = "xy", g1 = Year, g2 = Region, g2.level = "_MULTI")




##### X NUMERIC, Y NUMERIC - SIMPLE, SURVEY = HEXPLOT
upd()
iNZightPlot(BPXSY1, BPXSAR, design = des2)

upd()
iNZightPlot(BPXSY1, BPXSAR, design = des2, LOE = TRUE)
iNZightPlot(RIDAGEYR, BPXSY1, design = des2, trend = c("linear", "quadratic", "cubic"))
iNZightPlot(RIDAGEYR, BPXSY1, design = des2, trend = "linear", colby = agegp, trend.by = TRUE)
iNZightPlot(BPXSY1, BPXSAR, design = des2, smooth = 0.7)
iNZightPlot(BPXSY1, BPXSAR, design = des2, quant.smooth = "default")

upd()
iNZightPlot(BPXSY1, BPXSAR, design = des2, alpha = 0.5, rugs = "xy", plottype = "scatter", sizeby=BPXSY1)
iNZightPlot(BPXSY1, BPXSAR, design = des2, hex.bins = 50)


## --- grouping 1
upd(); iNZightPlot(BPXSY1, BPXSAR, design = des2, g1 = agegp)

iNZightPlot(BPXSY1, BPXSAR, design = des2, LOE = TRUE, g1 = agegp)
iNZightPlot(BPXSY1, BPXSAR, design = des2, trend = "linear", g1 = agegp)
iNZightPlot(BPXSY1, BPXSAR, design = des2, smooth = 0.7, g1 = agegp)
iNZightPlot(BPXSY1, BPXSAR, design = des2, quant.smooth = "default", g1 = agegp)

iNZightPlot(BPXSY1, BPXSAR, design = des2, alpha = 0.5, g1 = agegp)

## --- grouping 2
upd()
iNZightPlot(BPXSY1, BPXSAR, design = des2, g1 = BPXPLS, g2 = agegp, g2.level = "_MULTI")
iNZightPlot(BPXSY1, BPXSAR, design = des2, LOE = TRUE, g1 = BPXPLS, g2 = agegp, g2.level = "_MULTI")
iNZightPlot(BPXSY1, BPXSAR, design = des2, trend = "linear", g1 = BPXPLS, g2 = agegp, g2.level = "_MULTI")
iNZightPlot(BPXSY1, BPXSAR, design = des2, smooth = 0.7, g1 = BPXPLS, g2 = agegp, g2.level = "_MULTI")
iNZightPlot(BPXSY1, BPXSAR, design = des2, quant.smooth = "default",
            g1 = BPXPLS, g2 = agegp, g2.level = "_MULTI")

iNZightPlot(BPXSY1, BPXSAR, design = des2, alpha = 0.5, g1 = BPXPLS, g2 = agegp, g2.level = "_MULTI")
iNZightPlot(BPXSY1, BPXSAR, design = des2, rugs = "xy", g1 = BPXPLS, g2 = agegp, g2.level = "_MULTI")



upd();
iNZightPlot(height, armspan, data = d1, plottype = "hexplot")
iNZightPlot(height, armspan, data = d1, plottype = "grid", scatter.grid.bins = 100)
iNZightPlot(height, armspan, data = d1, plottype = "bar")

iNZightPlot(BPXSY1, BPXSAR, design = des2, g1 = agegp)
iNZightPlot(BPXSY1, BPXSAR, design = des2, g1 = agegp, matchplots = TRUE)
iNZightPlot(BPXSY1, BPXSAR, design = des2, g1 = agegp, plottype = "grid")

upd()
iNZightPlot(Life.Expectancy, log10(GDP.per.Capita), data = d3)
iNZightPlot(Life.Expectancy, log10(GDP.per.Capita), data = d3, plottype = "hex", cex.pt = 2)
iNZightPlot(Life.Expectancy, log10(GDP.per.Capita), data = d3, g1 = Region, plottype = "hex")
iNZightPlot(Life.Expectancy, log10(GDP.per.Capita), data = d3, g1 = Year, plottype = "hex")
iNZightPlot(Life.Expectancy, log10(GDP.per.Capita), data = d3, g1 = Year,
            g2 = Region, g2.level = "_MULTI")



upd()
iNZightPlot(rightfoot, height, data = d1, trend = "linear")
iNZightPlot(rightfoot, height, data = d1, trend = "linear", plottype = "hex")
iNZightPlot(rightfoot, height, data = d1, trend = "linear", plottype = "grid")

upd()
iNZightPlot(BPXSY1, BPXSAR, design = des2, trend = "linear")
iNZightPlot(BPXSY1, BPXSAR, design = des2, trend = "linear", plottype = "scatter")
iNZightPlot(BPXSY1, BPXSAR, data = d2, trend = "linear", plottype = "scatter")

upd()
iNZightPlot(BPXSY1, BPXSAR, design = des2, smooth = 0.7)
iNZightPlot(BPXSY1, BPXSAR, design = des2, smooth = 0.7, plottype = "scatter")
iNZightPlot(BPXSY1, BPXSAR, data = d2, smooth = 0.7, plottype = "scatter")



## ------- this is the dummy code for trend line by continuous variable
#pdf("~/Downloads/trendColByNumericExample.pdf", height = 10, width = 8)

upd()
iNZightPlot(height, age, data = d1, colby = year)
pushViewport(viewport(xscale = extendrange(range(d1$height, finite = TRUE)),
                      yscale = extendrange(range(d1$age, finite = TRUE)), clip = "on"))

fit1 <- lm(age ~ height, data = d1)
fit2 <- lm(age ~ height + year, data = d1)

summary(fit1)
summary(fit2)

xx <- c(80, 220)
yy <- predict(fit1, newdata = data.frame(height = xx))
grid.lines(xx, yy, default.units = "native", gp = gpar(col = "black", lwd = 2))

ff <- seq(min(d1$year, na.rm = TRUE), max(d1$year, na.rm = TRUE), length = 4)
yy2 <- predict(fit2, newdata = data.frame(height = xx, year = rep(ff, each = 2)))
COLS <- rainbow(200, start = 1/6)[c(1, 66, 132, 200)]
grid.polyline(rep(xx, 4), yy2, default.units = "native", id = rep(1:4, each = 2),
           gp = gpar(col = COLS, lwd = 2))
#dev.off()


age.pred <- predict(fit2)
grid.points(fit2$model$height, age.pred, gp = gpar(cex = 0.4), pch = 19)


#plot(1:200, 1:200, pch = 19, cex = 2, col = rainbow(200, start = 1/6))







### --- dot plot inference information

# NB: comparison intervals should only appear when there is more than one group to compare.

# Mean (normal)
upd()
iNZightPlot(height, data = d1, inference.type = c("conf", "comp"), inference.par = "mean")
iNZightPlot(height, travel, data = d1, inference.type = c("conf", "comp"), inference.par = "mean") -> pl

# Mean (bootstrap)
upd()
iNZightPlot(height, data = d1, inference.type = c("conf", "comp"), inference.par = "mean", bs.inference = TRUE)
iNZightPlot(height, travel, data = d1, inference.type = c("conf", "comp"), inference.par = "mean", bs.inference = TRUE)

# Median (normal)
upd()
iNZightPlot(height, data = d1, inference.type = c("conf", "comp"), inference.par = "median")
iNZightPlot(height, travel, data = d1, inference.type = c("conf", "comp"), inference.par = "median")

# Median (bootstrap)
upd()
iNZightPlot(height, data = d1, inference.type = c("conf", "comp"), inference.par = "median", bs.inference = TRUE)
iNZightPlot(height, travel, data = d1, inference.type = c("conf", "comp"), inference.par = "median", bs.inference = TRUE)


###### survey data

## mean (normal)
upd()
iNZightPlot(meals, design = des1, hist.bins = 20, inference.type = c("conf", "comp"), inference.par = "mean")
iNZightPlot(meals, awards, design = des1, hist.bins = 20, inference.type = c("conf", "comp"), inference.par = "mean")


## mean (bootstrap)
upd()
iNZightPlot(meals, design = des1, hist.bins = 20, inference.type = c("conf", "comp"), inference.par = "mean", bs.inference = TRUE)
iNZightPlot(meals, awards, design = des1, hist.bins = 20, inference.type = c("conf", "comp"), inference.par = "mean", bs.inference = TRUE)


## median (normal)
upd()
iNZightPlot(meals, design = des1, hist.bins = 20, inference.type = c("conf", "comp"), inference.par = "median")
iNZightPlot(meals, awards, design = des1, hist.bins = 20, inference.type = c("conf", "comp"), inference.par = "median")

## median (bootstrap)
upd()
iNZightPlot(meals, design = des1, hist.bins = 20, inference.type = c("conf", "comp"), inference.par = "median", bs.inference = TRUE)
iNZightPlot(meals, awards, design = des1, hist.bins = 20, inference.type = c("conf", "comp"), inference.par = "median", bs.inference = TRUE)




###### FACTORRRRRsssss

upd()
iNZightPlot(travel, data = d1, inference.type = c("conf", "comp"))
iNZightPlot(travel, gender, data = d1, inference.type = c("conf", "comp"))
iNZightPlot(travel, getlunch, data = d1, inference.type = c("conf", "comp"))


upd()
iNZightPlot(travel, data = d1, inference.type = c("conf", "comp"), bs.inference = TRUE)
iNZightPlot(travel, gender, data = d1, inference.type = c("conf", "comp"), bs.inference = TRUE)
iNZightPlot(travel, getlunch, data = d1, inference.type = c("conf", "comp"), bs.inference = TRUE)







upd(); iNZightPlot(height, g1 = travel, data = d1)

upd()
iNZightPlot(height, gender, g1 = getlunch, g2 = travel, data = d1, g2.level = "_MULTI", 
            inference.par = "mean", inference.type = c("comp", "conf"))
         #   )

upd()
iNZightPlot(cellsource, data = d1,
            g1 = travel,
            g2 = getlunch, g2.level = "_MULTI", inference.type = c("conf", "comp"), bs.inference = TRUE)

upd()
iNZightPlot(cellsource, gender, data = d1,
            g1 = travel,
            g2 = getlunch, g2.level = "_MULTI", inference.type = c("conf", "comp"), bs.inference = TRUE)

upd()
iNZightPlot(cellsource, gender, data = d1,
            g1 = getlunch, inference.type = c("conf"),#, "comp"),
            g2 = travel, g2.level = "other") -> EE

upd()
iNZightPlot(travel, gender, g1 = cellsource, g2 = getlunch, data = d1,
            inference.type = c("comp", "conf"))




########## Summary stuff:
upd()
getPlotSummary(height, data = d1)
getPlotSummary(height, g1 = gender, data = d1)
getPlotSummary(height, cellsource, g1 = gender, data = d1)

getPlotSummary(height, g1 = gender, g1.level = "male", g2 = travel, data = d1)
getPlotSummary(height, g1 = gender, g2 = travel, g2.level = "_MULTI", data = d1)
getPlotSummary(height, g1 = gender, g1.level = "male", g2 = travel, g2.level = "_MULTI", data = d1)


upd()
getPlotSummary(height, cellsource, g1 = gender, data = d1)
getPlotSummary(height, travel, g1 = gender, g1.level = "male", g2 = travel, data = d1)
getPlotSummary(height, travel, g1 = gender, g2 = travel, g2.level = "_MULTI", data = d1)
getPlotSummary(height, travel, g1 = gender, g2 = travel, g2.level = "_MULTI", data = d1)


upd()
getPlotSummary(travel, data = d1)

upd(); getPlotSummary(travel, gender, data = d1)
getPlotSummary(cellsource, travel, data = d1)

upd()
getPlotSummary(cellsource, gender, g1 = travel, g2 = getlunch, g2.level = "_MULTI", data = d1)




upd()
getPlotSummary(x = armspan, y = height, data = d1, trend = c("linear", "quadratic", "cubic"))




##################### INFERENCE
upd()
inzpars <- inzpar(inference.type = "conf", inference.par = c("mean", "median", "iqr"))
getPlotSummary(height, data = d1)
iNZightPlot(height, data = d1, inzpars = inzpars, inference.par = "mean")
iNZightPlot(height, travel, data = d1, inzpars = inzpars, inference.par = "mean")


upd()
getPlotSummary(x = height, data = d1, summary.type = "inference", inzpars = inzpars)
getPlotSummary(x = height, data = d1, summary.type = "inference", inzpars = inzpars, bs.inference = TRUE)

upd()
iNZightPlot(height, travel, data = d1, inzpars = inzpars, inference.par = "median", inference.type = "conf", bs.inference = TRUE)

getPlotSummary(x = height, y = travel, data = d1, summary.type = "inference", inzpars = inzpars)
getPlotSummary(x = height, y = travel, data = d1, summary.type = "inference", inzpars = inzpars, bs.inference = TRUE)


getPlotSummary(x = height, y = travel, data = d1, summary.type = "inference", inzpars = inzpars,
               g1 = getlunch, bs.inference = TRUE)






upd()
iNZightPlot(armspan, height, data = d1, trend = c("linear", "quadratic", "cubic"))
getPlotSummary(armspan, height, data = d1, trend = c("linear", "quadratic", "cubic"))

upd()
getPlotSummary(armspan, height, data = d1, summary.type = "inference")
getPlotSummary(armspan, height, data = d1, trend = c("linear", "quadratic", "cubic"), summary.type = "inference")

upd()
getPlotSummary(armspan, height, data = d1, summary.type = "inference", bs.inference = TRUE)
getPlotSummary(armspan, height, data = d1, trend = c("linear"), summary.type =
                   "inference", bs.inference = TRUE)


upd()
getPlotSummary(armspan, height, data = d1, trend = c("linear", "quadratic", "cubic"),
               summary.type = "inference", bs.inference = TRUE)

upd()
iNZightPlot(armspan, height, data = d1, g1 = getlunch, g2 = travel, g2.level = "_MULTI",
            trend = c("linear", "quadratic", "cubic"), bs.inference = TRUE)

upd()
getPlotSummary(armspan, height, data = d1, trend = c("linear", "quadratic", "cubic"), summary.type =
                   "inference", bs.inference = FALSE, g1 = getlunch, g2 = travel, g2.level =
                       "_MULTI")

getPlotSummary(armspan, height, data = d1, trend = c("linear", "quadratic", "cubic"), summary.type =
                   "inference", bs.inference = FALSE, g1 = getlunch, g2 = travel, g2.level =
                       "_MULTI")

upd()
getPlotSummary(armspan, height, data = d1, trend = c("linear", "quadratic", "cubic"), summary.type =
                   "inference", bs.inference = TRUE, g1 = getlunch, g2 = travel, g2.level = "_MULTI")





### factor inference
upd()
getPlotSummary(travel, data = d1, summary.type = "inference", inference.type = "conf")
getPlotSummary(gender, data = d1, summary.type = "inference", inference.type = "conf")

upd()
getPlotSummary(travel, gender, data = d1, summary.type = "inference", inference.type = "conf")
getPlotSummary(travel, getlunch, data = d1, summary.type = "inference", inference.type = "conf")
getPlotSummary(cellsource, getlunch, data = d1, summary.type = "inference", inference.type = "conf")


upd()
getPlotSummary(travel, data = d1, summary.type = "inference", inference.type = "conf", bs.inference = TRUE)
getPlotSummary(cellsource, data = d1, summary.type = "inference", inference.type = "conf", bs.inference = TRUE)

upd()
getPlotSummary(travel, gender, data = d1, summary.type = "inference", inference.type = "conf", bs.inference = TRUE)
getPlotSummary(travel, getlunch, data = d1, summary.type = "inference", inference.type = "conf", bs.inference = TRUE)



upd()
getPlotSummary(cellsource, getlunch, g1 = gender, g2 = travel, g2.level = "_MULTI", data = d1,
               summary.type = "inference", inference.type = "conf")
getPlotSummary(cellsource, g1 = gender, g2 = travel, g2.level = "_MULTI", data = d1,
               summary.type = "inference", inference.type = "conf")
upd()
getPlotSummary(cellsource, getlunch, g1 = gender, g2 = travel, g2.level = "_MULTI", data = d1,
               summary.type = "inference", bs.inference = TRUE, inference.type = "conf")
getPlotSummary(cellsource, g1 = gender, g2 = travel, g2.level = "_MULTI", data = d1,
               summary.type = "inference", inference.type = "conf", bs.inference = TRUE)


upd()
getPlotSummary(cellsource, getlunch, data = d1, summary.type = "inference", inference.type = "conf", bs.inference = TRUE)







upd()
iNZightPlot(height, data = d1, inference.par = "median", inference.type = "conf")
iNZightPlot(height, getlunch, data = d1, inference.par = "median", inference.type = "conf") -> p

upd()
iNZightPlot(height, getlunch, g1 = travel, g2 = gender, g2.level = "_MULTI",
            data = d1, inference.par = "median", inference.type = "conf") -> p


p$varnames
attributes(p)


upd()
iNZightPlot(height, travel, data = d1, inference.par = "mean",
            inference.type = c("conf", "comp")) -> p


do.call(cbind, lapply(names(p[[1]][[1]]$inference$mean), function(i) {
                                     m <- p[[1]][[1]]$inference$mean[[i]][, 1:2]
                                     colnames(m) <- paste(i, colnames(m), sep = ".")
                                     m
                                 }))









######## BARPLOT labels
upd()
iNZightPlot(travel, data = d1)
iNZightPlot(travel, data = d1, colby = getlunch, inference.type = "conf")


iNZightPlot(travel, gender, data = d1)


upd()
getPlotSummary(height, data = d1, plottype = "hist")


dd <- read.csv("~/iNZight/data/FutureLearn/NHANES-1000.csv", header = TRUE, comment.char = "#")

upd()
iNZightPlot(Education, y = AgeDecade, data = dd)

upd()
iNZightPlot(Life.Expectancy, Children.per.Woman, data = d3,
            colby = Region, g1 = Year, sizeby = Population, alpha = 0.6, cex.pt = 1.4)

upd()
iNZightPlot(Children.per.Woman, Region, data = d3,
            inference.type = c("comp"), inference.par = "median")





upd()
iNZightPlot(height, armspan, data = d1) -> p



curSet = inzpar()

modifyList(curSet, list(cex.pt = 2))

library(iNZight); iNZight()



upd()
iNZightPlot(height, g1 = travel, data = d1)
iNZightPlot(height, travel, data = d1)

upd()
iNZightPlot(height, data = d1)

iNZightPlot(Region, data = d3)

upd()
iNZightPlot(travel, height, data = d1)
iNZightPlot(height, data = d1, cex.dotpt = 0.8)
iNZightPlot(height, data = d1, cex.dotpt = 0.5)



######## LOCATE
upd()
iNZightPlot(armspan, height, data = d1, g1 = gender,
            locate.id = c(10, 26, 120, 384, 73, 243, 114, 171), locate.col = "black")


upd()
iNZightPlot(armspan, height, data = d1, locate.id = c(10, 171), locate = age,
            highlight = 10)





upd()
iNZightPlot(height, gender, data = d1, cex.dotpt = 0.4, locate.extreme = c(3, 2), locate.col = "red")
iNZightPlot(height, gender, data = d1, cex.dotpt = 0.4, locate = gender, locate.extreme = c(3, 2), locate.col = "red")

upd()
iNZightPlot(height, data = d1, cex.dotpt = 0.4, locate = gender, locate.id = 1:5, locate.col = "red")

upd()
iNZightPlot(height, data = d1, cex.dotpt = 0.4)
iNZightPlot(height, gender, data = d1, cex.dotpt = 0.4)
