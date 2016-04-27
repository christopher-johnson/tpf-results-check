library(jsonlite)
library(dplyr)
library(rio)
args<-commandArgs(TRUE)
wd <- getwd()
url <- args[1]
exportsDir <- args[2]
outFile <- args[3]
document <- fromJSON(txt=url)
a <- data.frame(document$'?dbr', document$'?o1')
a <- na.omit(a)
colnames(a) <- c('subject1','object1')
b <- data.frame(document$'?wde', document$'?o2')
b <- na.omit(b)
colnames(b) <- c('subject2','object1')
diff <- anti_join(a, b, by='object1')
export(diff, paste(exportsDir,'diff_s1-s2_',outFile, '_', format(Sys.time(), '%Y-%m-%dT%H:%M:%S'),'.csv'))