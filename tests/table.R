tab <- rbind(c(10, 11, 12),
             c(4, 6, 3))
dimnames(tab) <- list( c("One", "Two"), c("A", "B", "C"))
tab <- as.data.frame(tab)
tab$Var1 <- rownames(tab)

df <- reshape2:::melt.data.frame(tab, measure.vars = LETTERS[1:3], 
                                 variable.name = "Var2",
                                 value.name = "Count")


df[rep(row.names(df), df$Count), 1:2]
