library(devtools)
setwd("~/iNZight")


load_all("iNZightPlots")
load_all("iNZightTools")
paris <-
    smart_read("iNZight/scripts/paris111.csv") %>%
    convert_to_datetime("Time stamp", "month day year Hour Minute pm/am", "ts")


load_all("iNZightPlots")
iNZightPlot(ts, data = paris)
iNZightPlot(Sepal.Length, data = iris)

range(paris$ts)
