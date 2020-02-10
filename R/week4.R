# R Studio API Code
library(rstudioapi)
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# Data Import
library(tidyverse)
week4_df <- read_delim("../data/week4.dat", delim = "-", col_names = c("casenum", "parnum", "stimver", "datadate", "qs"))
glimpse(week4_df)
week4_df <- separate(week4_df, qs, c("q1", "q2", "q3", "q4", "q5"), sep = " - ")
week4_df[, c("q1", "q2", "q3", "q4", "q5")] <- sapply(week4_df[, c("q1", "q2", "q3", "q4", "q5")], as.numeric)
week4_df[, c("q1", "q2", "q3", "q4", "q5")] <- sapply(week4_df[, c("q1", "q2", "q3", "q4", "q5")], function(x){ifelse(x == 0, NA, x)})




week4_df$datadate <- as.POSIXct(week4_df$datadate, format = "%b %e %Y, %H:%M:%S")
