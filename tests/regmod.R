library(devtools)

load_all("~/iNZight/iNZightRegression")
data("census.at.school.500", package = "iNZight")
dat <- census.at.school.500

fit <- lm(height ~ armspan + gender + sqrt(age) + relevel(travel, "other"),
          data = dat)
fit2 <- glm(gender ~ armspan + travel + sqrt(age), data = dat,
            family = binomial)

load_all("~/iNZight/iNZightRegression")
plotlm6(fit, 7)
plotlm6(fit2, 7)


bs.fits <- replicate(30, {
    update(fit, subset = sample(nrow(dat), replace = TRUE))
}, simplify = FALSE)

update(fit, subset = sample(nrow(dat), replace = TRUE))

boot <- function(fit, N = 20, ...) UseMethod("boot")
boot.lm <- function(fit, N = 20, ...) {
    X <- model.matrix(fit)
    ii <- sample(nrow(X), replace = TRUE)
    Yi <- X[ii, 1]
    Xi <- X[ii, -1]
    Bhat <- solve(t(Xi) %*% Xi, t(Xi) %*% Yi)
    Yhat <- Xi %*% Bhat
    res <- Yi - Yhat
}
