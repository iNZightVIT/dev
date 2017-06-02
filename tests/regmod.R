library(devtools)

load_all("~/iNZight/iNZightRegression")
data("census.at.school.500", package = "iNZight")
dat <- census.at.school.500

load_all("~/iNZight/iNZightModules")

variables <- inzexp()
variables <- c(variables, inzexp("gender"))
variables <- c(variables, inzexp("height", "log"))
variables <- c(variables, inzexp("armspan", "power", 2))

variables
tostring(variables)

names(variables)
