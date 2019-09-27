pkg <- basename(getwd())
rv <- as.character(getRversion())
for (ext in c(".zip", ".tgz")) {
    file <- list.files(pattern = sprintf("%s.+%s", pkg, ext))
    if (length(file)) {
        file2 <- gsub(ext, paste0("_R_", rv, ext), file)
        cat(sprintf("Renaming %s -> %s\n", file, file2))
        file.rename(file, file2)
    }
}
