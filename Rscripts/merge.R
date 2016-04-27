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
m <- merge(a,b, by.x='object1')
export(m, paste(exportsDir,'merge_',outFile,'_', format(Sys.time(),'%Y-%m-%dT%H:%M:%S'),'.csv'))
