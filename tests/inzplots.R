setwd("~/iNZight/dev/tests")
library(grid); library(survey); library(quantreg); library(hexbin); library(hextri); library(boot); library(devtools); library(colorspace); library(dichromat)
upd <- function() load_all("~/iNZight/iNZightPlots")

data(api)
d1 <- read.csv("~/iNZight/data/Census at School-500.csv", header = TRUE, comment.char = "#")
d2 <- read.csv("~/iNZight/data/survey/NHANES_2009_2012.Wtd.csv", header = TRUE)
d3 <- read.csv("~/iNZight/data/Gap Minder Data.csv")
d4 <- apiclus2
d5 <- read.csv("~/iNZight/data/Dolphins.csv", header = TRUE)
d6 <- read.csv("~/iNZight/data/FutureLearn/NHANES-1000.csv", header = TRUE, comment.char = "#")

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
iNZightPlot(height, gender, data = d1, g1 = gender, cex.dotpt = 0.6)
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

upd()
iNZightPlot(height, data = d1, alpha = 0.5, pch = 15)

iNZightPlot(height, armspan, data = d1, pch = 2)




###############
upd()
iNZightPlot(Children.per.Woman, Region, data = d3, inference.type = "conf", inference.par = "median")
iNZightPlot(Region, Children.per.Woman, data = d3, inference.type = "conf", inference.par = "mean")

iNZightPlot(Children.per.Woman, Region, data = d3, inference.type = "conf", inference.par = "median", bs.inference = TRUE)
iNZightPlot(Region, Children.per.Woman, data = d3, inference.type = "conf", inference.par = "mean", bs.inference = TRUE)





upd()
pl <- iNZightPlot(Children.per.Woman, Region, data = d3, g2 = Year, g2.level = 4, locate = 1:nrow(d3), locate.extreme = c(500, 200))

pl <- iNZightPlot(Children.per.Woman, Region, data = d3, g2 = Year, g2.level = 4, locate = 1:nrow(d3), locate.extreme = c(1, 1), plottype = "dot")

cp <- pl[1:(length(pl) - 3)]

cpi <- c(sapply(cp, function(p) sapply(p, function(q) sapply(q$toplot, function(r) r$extreme.ids))))
cpi

iNZightPlot(Children.per.Woman, Region, data = d3, g2 = Year, g2.level = 4, locate = Country, locate.id = cpi)
iNZightPlot(Children.per.Woman, Region, data = d3, g2 = Year, g2.level = 4, locate = Country, locate.id = 909)



upd()
pl <- iNZightPlot(height, armspan, g1=gender, data = d1, locate = 1:nrow(d1), locate.extreme = 1)

cp <- pl[1:(length(pl) - 3)]

cpi <- c(sapply(cp, function(p) sapply(p, function(q) q)))#sapply(q, function(r) r))))
cpi



upd()
exploreAllSummaries(d1)
s <- getPlotSummary(height, data = d1)

lapply(colnames(d1), function(x) {
    getPlotSummary(d1[, x], varnames = list(x = x))
})

x="cellsource"
getPlotSummary(d1[, x], varnames = list(x=x))


upd()
getPlotSummary(cellcost, data = d1)


upd()
iNZightPlot(height, data = d1,
            xlim = c(130, 180))


upd()
iNZightPlot(height, armspan, data = d1, colby = age)







######## SURVEY stuff
## des1 -> d4 -> apliclus2

upd()

desdes <- svydesign(ids=~snum+dnum, weights=~pw, nest=TRUE,data = d4)

iNZightPlot(api99, api00, design = desdes)

iNZightPlot(api99, api00, data = d4, trend = "linear")
iNZightPlot(api99, api00, design = desdes, trend = "linear")

getPlotSummary(api99, api00, data = d4, trend = "linear")
getPlotSummary(api99, api00, design = desdes, trend = "linear")





upd()
getPlotSummary(height, data = d1)
getPlotSummary(height, gender, data = d1)

desdes <- svydesign(ids=~snum+dnum, weights=~pw, nest=TRUE,data = d4)
getPlotSummary(api00, design = desdes)
getPlotSummary(api00, both, design = desdes)





upd()
pdf("~/Desktop/test.jpg")
iNZightPlot(height, gender, data = d1, internal.labels = FALSE)
dev.off()




upd()
iNZightPlot(height, getlunch, data = d1, inference.type = "comp", inference.par = "mean")
iNZightPlot(height, getlunch, data = d1, inference.type = "comp", inference.par = "median")




ddd <- read.csv("~/iNZight/data/FutureLearn/NHANES-2000.csv")

upd()
iNZightPlot(BMI_WHO, DirectChol, AgeDecade, data = ddd)
iNZightPlot(BMI_WHO, DirectChol, AgeDecade, data = ddd, inference.par = "mean", inference.type = c("comp", "conf"))


#install.packages(c("iNZightPlots", "iNZightMR"), repos = "http://docker.stat.auckland.ac.nz/R")

                                        #dd <- read.csv(file.choose())
dd <- read.csv("OOOOOOOO.csv")
iNZightPlot(BMI_WHO, DirectChol, data = dd, inference.par = "mean", inference.type = c("comp", "conf"))

x <- ddd$DirectChol; y <- ddd$BMI_WHO

# https://github.com/iNZightVIT/iNZightPlots/blob/master/R/inzdotplot.R#L525

## using no intercept instead
library(iNZightMR)

fit <- lm(x ~ y - 1)
est <- predict(fit, newdata = data.frame(y = levels(y)))
mfit <- moecalc(fit, factorname = "y", est = est, base = FALSE)
cbind(with(mfit, cbind(lower = compL, upper = compU)), mean = est)

fit <- lm(x ~ y - 1)
ses <- seIndepSes(summary(fit)$coef[, 2])
print(ses)
mfit2 <- moecalc(ses, est = summary(fit)$coef[, 1], base = FALSE)
cbind(with(mfit2, cbind(lower = compL, upper = compU)), mean = est)


upd()
iNZightPlot(BMI_WHO, DirectChol, g1=AgeDecade, data = ddd, inference.par = "mean", inference.type = c("comp", "conf"))


ddd <- read.csv("~/iNZight/data/FutureLearn/NHANES-2000.csv")

upd()
iNZightPlot(BMI_WHO, DirectChol, data = ddd)


png()
iNZightPlot(BMI_WHO, DirectChol, data = ddd)
dev.off()





upd()
iNZightPlot(height, data = d1)




getPlotSummary(Pulse, data = d6, colby = AgeDecade)




upd()
iNZightPlot(height, colby = gender, data = d1, col = c("red", "blue"))







### SIZING
upd()
dev.new()
iNZightPlot(age, height, data = d1, sizeby = height, resize.method = "b")




x = 1:nrow(d1)
iNZightPlot(d1$height, x, sizeby = x, resize.method = "a")



upd()
iNZightPlot(height, colby = age, data = d1)
iNZightPlot(height, colby = age, data = d1, col.fun = heat.colors)



iNZightPlot(height, armspan, colby = travel, data = d1)
iNZightPlot(height, armspan, colby = rightfoot, data = d1, col.fun = heat.colors, bg = "grey20", col.missing = "black")




upd()
iNZightPlot(height, armspan, data = d1, bg="cornsilk")
iNZightPlot(height, armspan, data = d1, bg = "grey20", col.grid = rgb(1,1,1,0.2))

upd()
iNZightPlot(height, armspan, data = d1, g1 = travel)
iNZightPlot(height, armspan, data = d1, bg = rgb(0.9,0.95,1))

upd()
iNZightPlot(height, armspan, data = d1, plottype = "hex", col.pt = "#252525")
iNZightPlot(height, armspan, data = d1, plottype = "grid", col.pt = "#252525", cex = 2)


library(cairoDevice)

#Cairo(width = 9, height = 5, surface = "png", filename = "~/Desktop/test.png")
#iNZightPlot(height, armspan, data = d1)
#dev.off()




upd()
iNZightPlot(armspan, height, data = d1, colby = convert.to.factor(age))
iNZightPlot(armspan, height, data = d1, plottype = "hex", colby = convert.to.factor(d1$age))
iNZightPlot(armspan, height, data = d1, colby = convert.to.factor(height))
iNZightPlot(armspan, height, data = d1, colby = convert.to.factor(d1$height), plottype = "hex")


upd()
iNZightPlot(armspan, height, data = d1, symbolby = gender, colby = gender)
iNZightPlot(rightfoot, height, data = d1, alpha = 0.5, symbolby = cellsource, colby = cellsource, sizeby = armspan)
iNZightPlot(armspan, height, data = d1, colby = travel)

iNZightPlot(armspan, height, data = d1, colby = travel, symbolby = gender)
iNZightPlot(rightfoot, height, data = d1, alpha = 0.5, colby = getlunch, symbolby = cellsource, sizeby = armspan)





#install.packages("viridis", repos="http://cran.stat.auckland.ac.nz")
library(viridis)
data(gapminder, package="iNZight")

upd()

pdf(file = "~/Desktop/exampleplots.pdf", width = 12, height = 8)

iNZightPlot(log(GDPpercapita), ChildrenPerWoman, data = gapminder, colby = Infantmortality,
            pch = 19, main = "iNZight - default")

upd()
iNZightPlot(log(GDPpercapita), ChildrenPerWoman, data = gapminder, colby = Infantmortality,
            col.fun = viridis, pch = 19, main = "Viridis - default")

iNZightPlot(log(GDPpercapita), ChildrenPerWoman, data = gapminder, colby = Infantmortality,
            col.fun = magma, pch = 19, main = "Viridis - magma")

iNZightPlot(log(GDPpercapita), ChildrenPerWoman, data = gapminder, colby = Infantmortality,
            col.fun = plasma, pch = 19, main = "Viridis - plasma")

iNZightPlot(log(GDPpercapita), ChildrenPerWoman, data = gapminder, colby = Infantmortality,
            col.fun = inferno, pch = 19, main = "Viridis - inferno")


iNZightPlot(log(GDPpercapita), ChildrenPerWoman, data = gapminder, colby = Infantmortality,
            pch = 19, main = "iNZight - default (deutan colourblind)",
            col.fun = function(n) dichromat(hcl((1:n) / n * 320 + 60, c = 100, l = 50)))

iNZightPlot(log(GDPpercapita), ChildrenPerWoman, data = gapminder, colby = Infantmortality,
            pch = 19, main = "Viridis - default (deutan colourblind)",
            col.fun = function(n) dichromat(viridis(n)))

iNZightPlot(log(GDPpercapita), ChildrenPerWoman, data = gapminder, colby = Infantmortality,
            pch = 19, main = "Viridis - magma (deutan colourblind)",
            col.fun = function(n) dichromat(magma(n)))

iNZightPlot(log(GDPpercapita), ChildrenPerWoman, data = gapminder, colby = Infantmortality,
            pch = 19, main = "Viridis - plasma (deutan colourblind)",
            col.fun = function(n) dichromat(plasma(n)))

iNZightPlot(log(GDPpercapita), ChildrenPerWoman, data = gapminder, colby = Infantmortality,
            pch = 19, main = "Viridis - inferno (deutan colourblind)",
            col.fun = function(n) dichromat(inferno(n)))

dev.off()




data("gapminder", package = 'iNZight')

upd()
iNZightPlot(ChildrenPerWoman, Infantmortality, data = gapminder,
            colby = ChildrenPerWoman, col.fun = viridis::viridis, col.method = "rank")

gm2 <- gapminder[!is.na(gapminder$ChildrenPerWoman) & !is.na(gapminder$GDPpercapita), ]

iNZightPlot(ChildrenPerWoman, log(GDPpercapita), data = gm2,
            colby = GDPpercapita, col.fun = viridis::viridis, col.method = "rank", pch = 19, alpha = 0.7)



data("census.at.school.500", package = "iNZight")

upd()
iNZightPlot(height, age, data = census.at.school.500, plottype = "hex", colby = convert.to.factor(age))

data("gapminder", package="iNZight")

library(viridis)

iNZightPlot(log(GDPpercapita), Infantmortality, data = gapminder,
            colby = ChildrenPerWoman, col.fun = viridis, pch = 19)

iNZightPlot(log(GDPpercapita), Infantmortality, data = gapminder,
            colby = ChildrenPerWoman, col.fun = magma, pch = 19)

iNZightPlot(log(GDPpercapita), Infantmortality, data = gapminder,
            colby = ChildrenPerWoman, col.fun = plasma, pch = 19)

iNZightPlot(log(GDPpercapita), Infantmortality, data = gapminder,
            colby = ChildrenPerWoman, col.fun = inferno, pch = 19)



upd()
data("census.at.school.500", package = "iNZight"); d1 <- census.at.school.500
iNZightPlot(height, armspan, g1 = gender, data = d1)
iNZightPlot(height, armspan, g1 = gender, data = d1, colby = age, alpha=0.6, g2=cellsource, g2.level='_MULTI', bg="#333333", col.sub=c("wheat", "lightblue"))




library(FutureLearnData)
data(nhanes2009_2012)

upd()
iNZightPlot(AgeDecade, Education, data = nhanes2009_2012)



data(gapminder, package="iNZight")
upd()
iNZightPlot(Infantmortality, data = gapminder, plottype = "hist", bar.fill="blue")



######################################### New testing


data("census.at.school.500", package = "iNZight")
d1 <- census.at.school.500

upd()
getPlotSummary(height, data = d1, summary.type = "inference", inference.type = "conf")


upd()
getPlotSummary(height, gender, data = d1, summary.type = "inference", inference.type = "conf",
               hypothesis.var.equal = FALSE) 


upd()
getPlotSummary(height, getlunch, data = d1, summary.type = "inference", inference.type = "conf")


upd()
getPlotSummary(height, time, data = d2, summary.type = "inference", inference.type = "conf")

upd()
getPlotSummary(height, data = d1, summary.type = "inference", inference.type = "conf")



upd()
getPlotSummary(height, gender, data = d1, summary.type = "inference", inference.type = "conf", hypothesis.var.equal = TRUE)

getPlotSummary(height, gender, data = d1, summary.type = "inference", inference.type = "conf", hypothesis.var.equal = FALSE,
               hypothesis = NULL)


upd()
getPlotSummary(height, travel, data = d1, summary.type = "inference", inference.type = "conf")
getPlotSummary(travel, height, data = d1, summary.type = "inference", inference.type = "conf")


upd()
getPlotSummary(travel, data = d1, summary.type = "inference", inference.type = "conf")
getPlotSummary(travel, getlunch, data = d1, summary.type = "inference", inference.type = "conf")


upd()
getPlotSummary(travel, getlunch, data = d1, summary.type = "inference", inference.type = "conf")
iNZightPlot(travel, getlunch, data = d1, inference.type = "conf")$all$all$inference.info$conf


upd()
getPlotSummary(armspan, height, data = d1, summary.type = "inference", inference.type = "conf",
               trend = c("linear", "quadratic", "cubic"))


