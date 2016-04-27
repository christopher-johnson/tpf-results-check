# TPF Results Check

## Execute Federated SPARQL queries against Big Data sources and compare the results

##Install R
TPF Results Check requires R

## required libraries:
library(jsonlite)
library(dplyr)
library(rio)

These scripts will compare the SPARQL json result set of a TPF query and generates three files:
1. a merge showing the identical entities
2. a diff of the first subject to the second subject
3. a diff of the second to the first subject

To execute a script:
Rscript ./Rscripts/merge.R {input file path and name} {export directory path} {output file identity}
Rscript ./Rscripts/merge.R "./input/Leporidae.json" "./exports/" "Leporidae"

The input file must contain binding variables in the following format:
subjects = [?wde, ?dbr]
objects = [?o1, ?o2]

The output files are in CSV format.