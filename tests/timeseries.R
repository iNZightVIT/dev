library(devtools)
library(tidyverse)

load_all("~/iNZight/iNZightTS")
data("visitorsQ")

ts <- iNZightTS(visitorsQ, var = "Australia")

load_all("~/iNZight/iNZightTS")
rawplot(ts, t = 20)


decompositionplot(ts, t = 20)

ggplot(ts$tsObj)
