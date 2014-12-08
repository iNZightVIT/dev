
cat("Fetching data...")

file <- read.csv("http://docker.stat.auckland.ac.nz/R/tracker/getcsv.php?r=imfromiNZight",
                 header = TRUE, colClass = c("character", "factor"))
cat(" done.\n")

# loc.mat <- do.call(rbind, strsplit(file$Location, ","))
# loc <- data.frame(lat = as.numeric(loc.mat[, 1]),
#                   lon = as.numeric(loc.mat[, 2]))
# 
# os <- factor(ifelse(file$OS == "Windows", "1", "2"))

cat("Loading libraries...")
suppressPackageStartupMessages(library(ggplot2))
#suppressPackageStartupMessages(library(rworldmap))
cat(" done.\n")

cat("Processing data...")
file = file[!is.na(file$country) & file$country != "", ]  # get rid of missing
userloc = as.data.frame(table(as.character(file[, "country"])))  # get freq
levels(userloc$Var1)[levels(userloc$Var1) == "United Kingdom"] = "UK"
levels(userloc$Var1)[levels(userloc$Var1) == "United States"] = "USA"
cat(" done.\n")

cat("Plotting data...")
jpeg("userMap.jpg", width = 2000, height = 1200)
world = map_data("world")
ggplot() + geom_map(data = userloc, aes(map_id = Var1, fill = Freq), map = world) + expand_limits(x = world$long, y = world$lat) + geom_polygon(data = world, aes(x = long, y = lat, group = group), colour = "black", fill = NA)  + coord_equal() + labs(x = "Magnitude", y = "Latitude") + scale_fill_gradient(low = "grey", high ="black") + ggtitle("iNZight Downloaders") + theme(plot.title = element_text(lineheight=.8, face="bold", size = rel(2)))
o = dev.off()
cat(" done.\n")



# newmap <- getMap(res = "low")
# jpeg("userMap.jpg", width = 2000, height = 1200)
# plot(newmap)
# points(loc$lon, loc$lat, col = c("blue", "red")[os], cex = 0.6, pch = 4, lwd = 2)
# legend("topleft", c("Windows", "Mac"), col = c("blue", "red"), pch = 4, bty = "n")
# title(xlab = sprintf("Map generated on %s", date()), cex.lab = 2)
# o <- dev.off()
# cat(" done.\n")
