## Testing stuff for iNZightPlots
q()
d <- read.csv('~/iNZight/data/Census at School-500.csv')
library(iNZightPlots)

# ----------------------------------------------------------------------------- #
# Some basic plots

## Dot plots
iNZightPlot(x = d$height)
iNZightPlot(x = d$height, y = d$travel)
iNZightPlot(x = d$height, g1 = d$travel, g1.level = "bus")
iNZightPlot(x = d$height, y = d$gender, by = d$age)
iNZightPlot(x = d$height, y = d$gender, g1 = d$getlunch, by = d$travel)
iNZightPlot(x = d$height, y = d$age, g2 = d$gender, g2.level = "male")
iNZightPlot(x = d$height, y = d$age, g1 = d$travel, by = d$gender,
            col.pt = c("hotpink", "navy"), xlab = "Height (cm)", ylab = "Age (years)")
iNZightPlot(x = d$height, y = d$travel, g1 = d$getlunch, by = d$gender,
            col.pt = c("hotpink", "navy"))


## Scatter plots
iNZightPlot(x = d$height, y = d$age, g1 = d$travel, trend = c("linear", "quadratic"))
iNZightPlot(x = d$height, y = d$age, jitter = "y", trend = "linear", bs.inference = TRUE)
iNZightPlot(x = d$rightfoot, y = d$height, smooth = 0.9, jitter = "x", by = d$age,
            prop.size = d$age)

iNZightPlot(x = d$height, y = d$age, g2 = d$gender, g2.level = "male",
            prop.size = d$height)

iNZightPlot(d$height, y = d$age, rug = "x")


## Dot plots
iNZightPlot(x = d$rightfoot, g1 = d$travel, g1.level = "train")
iNZightPlot(d$rightfoot, g1 = d$travel)
iNZightPlot(d$gender, y = d$height, varname = list(x = "gender", y = "height"))

## Barplots
iNZightPlot(d$travel)
iNZightPlot(d$travel, d$gender)
iNZightPlot(d$travel, d$getlunch)

iNZightPlot(d$travel, g1 = d$gender)
iNZightPlot(d$travel, d$gender, g1 = d$getlunch, bar.fill = c("hotpink", "lightblue"))
iNZightPlot(d$travel, d$getlunch, g1 = d$height)
iNZightPlot(d$travel, d$getlunch, g1 = d$height, g2 = d$gender, g2.level = "male")

iNZightPlot(d$travel, inference.type = "comp")
iNZightPlot(d$travel, d$getlunch, inference.type = "comp")
iNZightPlot(d$travel, d$gender, inference.type = "comp")

iNZightPlot(d$travel, g1 = d$gender)
iNZightPlot(d$travel, g1 = d$gender, inference.type = "comp")
iNZightPlot(d$travel, d$getlunch, g1 = d$gender, inference.type = "comp")

iNZightPlot(d$travel, inference.type = c("comp", "conf"))
iNZightPlot(d$travel, d$getlunch, inference.type = c("comp", "conf"))
iNZightPlot(d$travel, d$gender, inference.type = c("comp", "conf"))

iNZightPlot(d$travel, g1 = d$gender)
iNZightPlot(d$travel, g1 = d$gender, inference.type = c("comp", "conf"))
iNZightPlot(d$travel, d$getlunch, g1 = d$gender, inference.type = c("comp", "conf"))

iNZightPlot(d$gender, inference.type = c("comp"))
iNZightPlot(d$gender, inference.type = c("conf"))
iNZightPlot(d$gender, inference.type = c("comp", "conf"))

iNZightPlot(d$travel)
iNZightPlot(d$travel, d$gender, bar.fill = c("magenta", "blue"),
            varnames = list(by = "gender"))
iNZightPlot(d$gender, by = d$height, bar.fill = c("magenta", "blue"),
            g1 = d$age, inference.type = c("comp", "conf"))

iNZightPlot(d$travel, d$getlunch, g1 = d$age, g1.level = 1,
            inference.type = c("comp"))


iNZightPlot(d$travel, d$getlunch, g1 = d$age, g1.level = 1,
            g2 = d$gender, g2.level = "male")
iNZightPlot(d$height, d$rightfoot, g1 = d$age, g1.level = 0)
iNZightPlot(d$height, d$rightfoot, prop.size = d$age)





# dot plot inference
iNZightPlot(d$height, d$travel, inference.type = c("comp"), inference.par = "median")
iNZightPlot(d$height, inference.type = c("comp"), inference.par = "median",
            bs.inference = TRUE)

iNZightPlot(d$height, inference.type = "comp", inference.par = "mean")
iNZightPlot(d$height, d$travel, inference.type = "comp", inference.par = "mean",
            bs.inference = TRUE)

iNZightPlot(d$height, inference.type = c("comp", "conf"), inference.par = "mean")
iNZightPlot(d$height, d$travel, inference.type = c("comp", "conf"), inference.par = "mean",
            bs.inference = TRUE)


iNZightPlot(d$height, d$travel, g1 = d$getlunch,
            inference.type = "comp", inference.par = "mean")
iNZightPlot(d$height, d$travel, g1 = d$getlunch,
            inference.type = "conf", inference.par = "mean")

# Summary
getPlotSummary(d$getlunch, d$travel)
getPlotSummary(d$getlunch, d$travel, g1 = d$gender, g2 = d$cellsource, g2.level = "job")


getPlotSummary(d$height, d$age)
getPlotSummary(d$height, d$age, trend = "linear")
getPlotSummary(d$height, d$age, g1 = d$gender, trend = "linear")
getPlotSummary(d$height, d$age, trend = c("linear", "quadratic", "cubic"))


getPlotSummary(d$height, g2 = d$gender, g2.level = "male")
getPlotSummary(d$height, g1 = d$gender)

getPlotSummary(d$travel)
getPlotSummary(d$travel, g1 = d$getlunch)


getPlotSummary(d$height, d$gender)
getPlotSummary(d$height, d$travel, g1 = d$gender, g2 = d$getlunch, g2.level = "home")
getPlotSummary(d$getlunch, d$rightfoot)


# Inference
# --- Lazy load
invisible(lapply(list.files('~/iNZight/iNZightPlots/R', full.names = TRUE),
                 function(x) source(x)))
#library(s20x)
#library(grid)
#library(boot)

getPlotInference(d$travel, d$gender)#, g1 = d$gender)
iNZightPlot(d$travel, d$gender)
getPlotInference(d$travel, d$getlunch)
iNZightPlot(d$travel, d$getlunch)
getPlotInference(d$travel, d$getlunch, bs.inference = TRUE)


getPlotInference(d$height, d$age)
getPlotInference(d$height, d$age, g1 = d$gender, trend = "linear")
getPlotInference(d$height, d$age, trend = "linear")
getPlotInference(d$height, d$age, trend = "linear", bs.inference = TRUE)

getPlotInference(d$height, d$gender)
getPlotInference(d$height, d$gender, g1 = d$travel)
getPlotInference(d$height, d$gender, bs.inference = TRUE)

getPlotInference(d$travel)
getPlotInference(d$travel, g1 = d$gender)
iNZightPlot(d$travel, g1 = d$gender)

getPlotInference(d$getlunch, g1 = d$travel)


getPlotInference(d$height, g2 = d$gender, g2.level = "male")
getPlotInference(d$height, g1 = d$gender)
getPlotInference(d$height, g1 = d$gender, bs.inference = TRUE)



## TO DO:

# Allow g2.level to be specified numerically
