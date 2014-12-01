updateDistribution <- function() {
    cat("==========================================================\n")
    cat("               Checking for updates ...\n")
    cat("==========================================================\n\n")
    
    if (.Platform$OS == "windows") {
        ## Checking if the updater is using the new structure ...
        if (tail(strsplit(getwd(), "/")[[1]], 1) != "prog_files") {
            cat("    Updating scripts ...\n\n")
            writeF <- function(url, file) {
                text <- getURL(url, followlocation=TRUE,
                               cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl"))
                unlink(file)
                con <- file(file, open = "w")
                writeLines(text, con)
                close(con)
            }
            
            # First, update the BAT file:
            writeF("https://raw.githubusercontent.com/iNZightVIT/dev/master/UPDATE_iNZightVIT.bat",
                   "UPDATE_iNZightVIT.bat")
            
            # and then remove old update script and add new one:
            writeF("https://raw.githubusercontent.com/iNZightVIT/dev/master/win_update_Rprofile.R",
                   "prog_files/.Rprofile")
        
            # cat("\n\n  You will need to download the latest version of iNZightVIT\n")
            # cat("  from https://www.stat.auckland.ac.nz/~wild/iNZight/win.php\n\n")
           
            Sys.sleep(1)
            cat(" Please run the updater again to complete the update ...\n")
            cat("==========================================================\n\n")
            
            Sys.sleep(3)
            stop("iNZight has not been updated.", call. = FALSE)
        } else {
          ## do a quick cleanup
          unlink("updateiNZightVIT.R")
        }
    } else {
        if (Sys.info()["sysname"] == "Darwin") {
            ## It's a mac
            osx.version <- try(system("sw_vers -productVersion", intern = TRUE), silent = TRUE)
            if (!inherits(osx.version, "try-error")) {
                if (osx.version == "10.10") {
                    cat("==========================================================\n\n")
                    
                    cat("  It looks like you are running Mac OS X 10.10 Yosemite.\n\n")
                    
                    cat("  IMPORTANT: If iNZight doesn't load, try installing\n")
                    cat("  XQuartz from:\n\n")
                    cat("       http://xquartz.macosforge.org/\n\n")
                    
                    cat("  If this doesn't work, email us at:\n\n")
                    
                    cat("       inzight_support@stat.auckland.ac.nz\n\n")
                    
                    cat("  and we may be able to provide you with an alternative.\n\n")

                    cat("==========================================================\n\n")
                }
            }
        }
        
        move <- function() {
            if (!is.na(Sys.getenv()["R_DIR"])) {
                setwd(Sys.getenv()["R_DIR"])
                if ("FutureLearn" %in% list.files())
                    system("mv FutureLearn data/")
            }
        }
        try(move(), TRUE)
    }
    

    # Set the CRAN to UoA for updating various packages:
    ## uoaCRAN <- structure("http://cran.stat.auckland.ac.nz", names = "CRAN")
    ## currCRAN <- getOption("repos")
    ## if (currCRAN["CRAN"] != uoaCRAN) {
    ##     options(repos = uoaCRAN)
    ##     on.exit(options(repos = currCRAN))
    ## }

    ## options(repos = c(options()$repos, inzight = "http://docker.stat.auckland.ac.nz/R"))

    update.packages(repos = "http://docker.stat.auckland.ac.nz/R", ask = FALSE)

    ## A list of packages we NEED to have installed (since older versions anyway...)
    pkgs <- c("reshape2", "hexbin")
    pkgs <- pkgs[!pkgs %in% rownames(installed.packages())]
    if (length(pkgs) > 0)
        install.packages(pkgs, repos = "http://cran.stat.auckland.ac.nz")

    try({  # don't want to crash it ...
    ## get the OS version:
    if ("prog_files" %in% list.files()) {
        os = "Windows"
    } else {
        osx.version <- try(system("sw_vers -productVersion", intern = TRUE), silent = TRUE)
        if (!inherits(osx.version, "try-error")) {
            os = paste("Mac OS X", osx.version)
        } else {
            os = "Mac OS X"
        }
    }

    ## have they updated before?
    hash.id <- "new"
    if (os == "Windows") {
        if (file.exists("prog_files/id.txt")) {
            hash.id <- readLines("prog_files/id.txt")
        }
    } else {
        if (file.exists("Library/id.txt")) {
            hash.id <- readLines("Library/id.txt")
        }
    }
    
    version <- as.character(packageVersion("iNZight"))
    f <- try(url(paste0("http://docker.stat.auckland.ac.nz/R/tracker/index.php?track&v=",
                        version, "&os=", gsub(" ", "%20", os), "&hash=", hash.id), open = "r"), TRUE)

    if (hash.id == "new") {
        ## write the hash code to their installation:
        hash.id <- readLines(f)
        writeLines(hash.id, paste0(ifelse(os == "Windows", "prog_files", "Library"), "/id.txt"))
    }
    }, TRUE)
    
    ## success message
    cat("==========================================================\n")
    cat("  Updating complete.\n")
    if (.Platform$OS != "windows")
        cat("  Close R before running iNZight.\n")
    cat("==========================================================\n\n")

    readline(prompt = "Press enter to exit ..."); q("no")

    Sys.sleep(3)
    
    return(invisible(NULL))
}
