library(devtools)
setwd("~/iNZight")

load_all("iNZightTools")
load_all("iNZightPlots")
paris <- smart_read("iNZightTools/tests/testthat/datetimes.csv")
paris <- convert_to_datetime(paris, "Time stamp", "month day year Hour Minute pm/am", "ts")

paris$date <- as.Date(paris$ts)
paris$time <- chron::chron(times. = format(paris$ts, '%T'))

load_all("iNZightPlots")
iNZightPlot(ts, data = paris)
iNZightPlot(date, data = paris)
iNZightPlot(time, data = paris)
iNZightPlot(Sepal.Length, data = iris)


load_all("iNZightPlots")
iNZightPlot(date, time, data = paris)
iNZightPlot(time, date, data = paris)

load_all("iNZightPlots")
iNZightPlot(ts, g1 = date, data = paris)
iNZightPlot(time, g1 = ts, data = paris)
iNZightPlot(date, g1 = time, data = paris)

load_all("iNZightPlots")
iNZightPlot(ts, colby = date, data = paris)
iNZightPlot(time, colby = date, data = paris)

load_all("iNZightPlots")
iNZightPlot(time, colby = ts, data = paris)
iNZightPlot(ts, colby = time, data = paris)

load_all("iNZightPlots")
iNZightPlot(Petal.Length, Species, data = iris)

iNZightPlot(ts, colby = ts, data = paris)

library(tidyverse)
paris <- paris %>% mutate(x = rnorm(n()), y = rnorm(n()))

iNZightPlot(x, y, data = paris, sizeby = ts, resize.method = "emphasise")
iNZightPlot(x, y, data = paris, sizeby = date, resize.method = "emphasise")
iNZightPlot(x, y, data = paris, sizeby = time, resize.method = "emphasise")

load_all('iNZightPlots')
iNZightPlot(x, y, data = paris, colby = ts)
iNZightPlot(x, y, data = paris, colby = date)
iNZightPlot(x, y, data = paris, colby = time)

load_all('iNZightPlots')
iNZightPlot(x, y, data = paris, colby = date)
iNZightPlot(x, y, data = paris, symbolby = date, colby = date)

