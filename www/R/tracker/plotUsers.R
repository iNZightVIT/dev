
cat("Fetching data...")

file <- read.csv("http://docker.stat.auckland.ac.nz/R/tracker/getcsv.php?r=imfromiNZight",
                 header = TRUE, colClass = c("character", "factor"))
cat(" done.\n")

loc.mat <- do.call(rbind, strsplit(file$Location, ","))
loc <- data.frame(lat = as.numeric(loc.mat[, 1]),
                  lon = as.numeric(loc.mat[, 2]))

os <- factor(ifelse(file$OS == "Windows", "1", "2"))

cat("Loading libraries...")
suppressPackageStartupMessages(library(rworldmap))
cat(" done.\n")


cat("Plotting data...")
newmap <- getMap(res = "low")

jpeg("userMap.jpg", width = 2000, height = 1200)

plot(newmap)
points(loc$lon, loc$lat, col = c("blue", "red")[os], cex = 0.6, pch = 4, lwd = 2)
legend("topleft", c("Windows", "Mac"), col = c("blue", "red"), pch = 4, bty = "n")
title(xlab = sprintf("Map generated on %s", date()), cex.lab = 2)
    
o <- dev.off()

cat(" done.\n")
