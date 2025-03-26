#MultiAssayExperiment
library(magrittr)
library(EasyMultiProfiler)
library(ggplot2)
meta_data <- read.csv('metadata.csv',header = T,row.names = 1)
tax_data <- EMP_taxonomy_import('silva.qzv',
                                file_format='qzv',duplicate_feature=TRUE)
ko_data <-EMP_function_import('ko.tsv',type = 'ko')
dfmap <- read.csv("assay_genus.csv",header = T)
dfmap$assay <- as.factor(dfmap$assay)
objlist <- list("silva" = tax_data,
                "ko" = ko_data)
MAE <- MultiAssayExperiment::MultiAssayExperiment(objlist, meta_data, dfmap)
saveRDS(MAE,file = 'Zmh2-11.rds')
MAE <- readRDS('Zmh2-11.rds')