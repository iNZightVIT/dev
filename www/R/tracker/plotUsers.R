file <- read.csv("http://docker.stat.auckland.ac.nz/R/tracker/getcsv.php?r=imfromiNZight",
                 header = TRUE, colClass = c("character", "factor"))

loc.mat <- do.call(rbind, strsplit(file$Location, ","))
loc <- data.frame(lat = as.numeric(loc.mat[, 1]),
                  lon = as.numeric(loc.mat[, 2]))

os <- factor(ifelse(file$OS == "Windows", "1", "2"))

library(rworldmap)
newmap <- getMap(res = "low")

jpeg("userMap.jpg", width = 2000, height = 1200)

plot(newmap)
points(loc$lon, loc$lat, col = c("blue", "red")[os], cex = 0.6, pch = 4, lwd = 2)
legend("topleft", c("Windows", "Mac"), col = c("blue", "red"), pch = 4, bty = "n")

dev.off()
