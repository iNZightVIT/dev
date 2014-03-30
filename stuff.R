win <- read.csv("versions.txt", header = TRUE, stringsAsFactors = FALSE)[, 1:2]
mac.sl <- read.csv("versions-mac-sl.txt", header = TRUE, stringsAsFactors = FALSE)
mac <- read.csv("versions-mac.txt", header = TRUE, stringsAsFactors = FALSE)

colnames(mac.sl) <- colnames(mac) <- colnames(win)

head(mac.sl)

tt <- merge(win, mac, by = "Name", all = TRUE)
tt2 <- merge(tt, mac.sl, by = "Name", all = TRUE)
colnames(tt2) <- c("Name", "win", "mac", "mac-sl")
tt2[is.na(tt2)] <- "-"

head(tt2)


# compare win with mac
tt2


WINpkg <- tt2[tt2$win != "-", ]

# compare 3.0 versions:
cc <- tt2[, 1:3]
cc$check <- apply(cc, 1,
                  function(x) {
                      if (all(x[2:3] != "-"))
                          return(x[2] == x[3])
                      else
                          return("-")
                  })

cc[cc$check == FALSE, ]



# compare to 2.15:
cc <- tt2[, c(1:2, 4)]
cc
cc$check <- apply(cc, 1,
                  function(x) {
                      if (all(x[2:3] != "-"))
                          return(x[2] == x[3])
                      else
                          return("-")
                  })

cc[cc$check == "-", ]
