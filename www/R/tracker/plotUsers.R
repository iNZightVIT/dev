suppressPackageStartupMessages(library(lubridate))

cat("Fetching data...")

file <- read.csv("http://docker.stat.auckland.ac.nz/R/tracker/getcsv.php?r=imfromiNZight",
                 header = TRUE, colClass = c("character", "factor"))
cat(" done.\n")

cat("Loading libraries...")
suppressPackageStartupMessages(library(ggplot2))
cat(" done.\n")


cat("Processing data...")
file <- file[!is.na(file$country) & file$country != "", ]  # get rid of missing
userloc <- as.data.frame(table(as.character(file[, "country"])))  # get freq
levels(userloc$Var1) <-
    sapply(levels(userloc$Var1), function(x)
        switch(x, "United Kingdom" = "UK", "United States"  = "USA", x))
cat(" done.\n")

cat("Plotting data...")
jpeg("userMap.jpg", width = 1920, height = 1080)
world <- map_data("world")
ggplot() + geom_map(data = userloc, aes(map_id = Var1, fill = Freq), map = world) +
    expand_limits(x = world$long, y = world$lat) +
    geom_polygon(data = world, aes(x = long, y = lat, group = group), colour = "black", fill = NA) +
    coord_equal() +
    labs(x = sprintf("\n\nMap generated on %s", date()), y = "") +
    scale_fill_gradient(low = "#DDFFDD", high ="#005500") +
    ggtitle("iNZight Users (last 2 months)\n") +
    theme(plot.title = element_text(lineheight = 0.8, face = "bold", size = rel(2)))
o <- dev.off()
cat(" done.\n")

