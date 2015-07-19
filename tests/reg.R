library(devtools)
load_all("~/iNZight/iNZightMR")
load_all("~/iNZight/iNZightPlots")
load_all("~/iNZight/iNZightRegression")

library(iNZightRegression)

#upd()
d <- read.csv('~/iNZight/data/Census at School-500.csv')
d2 <- read.csv('~/iNZight/data/Gap Minder Data.csv')

fit <- lm(height ~ age + armspan + gender, data = d)
plotlm6(fit, which = 7, use.inzightplots = FALSE)

allPartialResPlots(fit)



fit2 <- lm(Life.Expectancy ~ (Population) + GDP.per.Capita + Region,
           data = d2)
plotlm6(fit2, which = 7)
upd()
allPartialResPlots(fit2)


d3 <- read.csv("~/iNZight/iNZightVIT-WIN/data/NZIncomes03_34000.csv")
fit3 <- lm(weekly_income ~ weekly_hrs + ethnicity, data = d3)
plotlm6(fit3)
upd()
allPartialResPlots(fit3)




### building
library(devtools)
reg <- "~/iNZight/iNZightRegression"

load_all(reg)
document(reg)

?multicomp
