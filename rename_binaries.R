pkg <- basename(getwd())
rv <- as.character(getRversion())
cat(sprintf("Renaming files for %s with R version %s\n", pkg, rv))
for (ext in c(".zip", ".tgz")) {
    file <- list.files(
        pattern = sprintf("%s.+%s", pkg, ext),
        ignore.case = TRUE
    )
    if (length(file)) {
        file2 <- gsub(ext, paste0("_R_", rv, ext), file)
        cat(sprintf("Renaming %s -> %s\n", file, file2))
        file.rename(file, file2)
    }
}
