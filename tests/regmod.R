library(devtools)

load_all("~/iNZight/iNZightRegression")
data("census.at.school.500", package = "iNZight")
dat <- census.at.school.500

fit <- lm(height ~ armspan + age + year, data = dat)
fit2 <- glm(gender ~ armspan, data = dat,
            family = binomial)

## load_all("~/iNZight/iNZightRegression")
## e <- new.env()
## assign("dat", dat, envir = e)
## rm(dat)

load_all("~/iNZight/iNZightRegression")
fit <- lm(height ~ armspan + sqrt(age) + relevel(gender, "male") +
              travel * getlunch, data = dat)
plotlm6(fit, 7)

load_all("~/iNZight/iNZightRegression")
fit <- lm(height ~ armspan + gender + sqrt(age) + relevel(gender, "male") +
              travel * getlunch,
          data = dat)
iNZightQQplot(fit)
histogramArray(fit)
