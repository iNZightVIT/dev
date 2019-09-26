news <- readLines("NEWS.Md")
sec_start <- grep("^#", news)
if (length(sec_start) > 1)
    news <- news[(sec_start[1]+1):(sec_start[2]-1)]
cat(news, sep = "\n")
