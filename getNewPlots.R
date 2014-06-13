## new iNZightPlots isn't a proper package yet, and making it
## so is a nuisance before it's complete, so here's a workaround:

# 1. download: https://github.com/iNZightVIT/iNZightPlots/archive/new.zip

# 2. extract to a folder

# 3. run:
setwd(file.choose())  # navigate into the iNZightPlots-new folder you just downloaded
setwd("R")
invisible(lapply(list.files(), source))
library(grid); library(survey); library(quantreg)

# load data:
df <- read.csv(file.choose(), header = TRUE)
# examples below assume Census at School-500.csv loaded

# Now just call function (currently only works for scatter plot (X and Y numeric)
iNZightPlot(y = height, x = armspan, data = df)

# list of arguments

# g1 = name_of_slider_1_variable
# g1.level = name of level (or 0 for all)
iNZightPlot(y = height, x = armspan, data = df, g1 = gender)  #, g1.level = "male")

# g2 = name of slider 2 variable
# g2.level = name of level, or "_ALL" for no subsetting, or "_MULTI" for matrix
iNZightPlot(y = height, x = armspan, data = df, g1 = gender, g2 = getlunch, g2.level = "_MULTI")

# colby = variable to colour points by
# sizeby = variable to size points by
iNZightPlot(y = height, x = armspan, data = df, colby = gender, sizeby = age)


## There are a whole lot of general attributes inside
inzpar()  # lists the defaults

## can let you set sizes, colours, background, line size etc..
## useful ones may include:

# trend = c("linear", "quadratic", "cubic")  ... or any combination
# trend.by = TRUE  ... trend for each colour
iNZightPlot(y = height, x = armspan, data = df, colby = gender, trend = "linear", trend.by = TRUE)

# smooth = [0,1]  ... some number for the smoothing
iNZightPlot(y = height, x = armspan, data = df, smooth = 0.7)

# quant.smooth = "default"  ... will add quantile smoothing
iNZightPlot(y = height, x = armspan, data = df, quant.smooth = "default")




# there is frequency stuff, but I'm still toying with different ways of implementing this along with
# survey information, so easiest for now just to use sizeby argument directly.

