## This script will go through ALL of the .html documents in this directory
## and add "back" links (to the page: changes.html

files <- list.files(pattern = ".html")

invisible(lapply(files, function(ff) {
    file <- gsub(".html", "", ff)
    temp <- readLines(paste0(file, ".html"))
    from <- which(grepl("R Documentation</td>", temp)) + 1
    to <- which(grepl("</body>", temp)) - 1
    
    writeLines(temp[from:to], paste0(file, ".php"))

    writeLines(paste0('<meta http-equiv="refresh" content="0; url=../changelog.php?pkg=', file,'" />'),
               ff)
}))
