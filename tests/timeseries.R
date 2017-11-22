library(devtools)
library(tidyverse)

install_github("iNZightVIT/iNZightTS@dev")
library(iNZightTS)
data("visitorsQ")

ts <- iNZightTS(visitorsQ, var = "Australia")

data <- data.frame(Date = as.numeric(time(ts$tsObj)),
                   Visitors = as.matrix(ts$tsObj))

tsPlot <- function(data) {
    pl <- ggplot(data, aes(x = Date, y = Visitors)) +
        geom_point()
    pl
    for (i in 1:nrow(data)) {
        dev.hold()
        print(pl + geom_line(data = data[1:i, ]))
        dev.flush()
        Sys.sleep(ifelse(i <= 9, 0.6, 0.05))
    }
    
    pl <- ggplot(data, aes(x = Date, y = Visitors)) +
        geom_line() +
        geom_smooth(se = F, col = "red", span = 0.5)
    dev.hold()
    print(pl)
    dev.flush()
}

## the smoother isn't the correct type, but that would be easy enough
## to grab from the current plot
dev.new(width = 10, height = 3)
tsPlot(data)

## versus
rawplot(ts, t = 20, animate = TRUE)

