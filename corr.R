corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0

        ## Return a numeric vector of correlations
        source("complete.R")
        data = complete(directory)
        data <- data[data$nobs > threshold, ]
        correlation <- numeric(0)
        for (i in data$id){
           filenames<-sprintf("%03d.csv", i)
        	  dir <- file.path(directory, filenames)
           originaldata = read.csv(dir)
           correlation <- c(correlation, cor(originaldata$sulfate, originaldata$nitrate, use='pairwise.complete.obs'))
          }
         return (correlation)
}
