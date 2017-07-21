setwd("/Users/tanmaynath/Dropbox/DataScience/Coursera/RProgramming/Week_2")

corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  
  directory<- "./specdata"
  #initialize the mean vector
  source('~/Dropbox/DataScience/Coursera/RProgramming/Week_2/complete.R')
  complete_table <- complete("specdata", 1:332)
  nobs <- complete_table$nobs
  nid <- complete_table$id[nobs>threshold]
  corr_vector <- c()
  files <- list.files(directory)
  #Reading each file in id 
  for (i in 1:length(nid)){
    curr_file <-read.csv(paste(directory,'/',files[nid[i]],sep=""),header=T, sep=",")
    curr_file_NA_removed <- complete.cases(complete_table)
    corr_vector[i]<-cor(curr_file$sulfate, curr_file$nitrate, use="complete.obs")
    #complete_cases[i]<-length(curr_file_NA_removed[curr_file_NA_removed=='TRUE'])
  }
  
  return(corr_vector)
}

#Test
cr <- corr("specdata", 150)
head(cr)
cr <- corr("specdata", 150)
head(cr)
cr <- corr("specdata", 5000)
head(cr)
summary(cr)