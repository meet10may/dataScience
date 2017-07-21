setwd("/Users/tanmaynath/Dropbox/DataScience/Coursera/RProgramming/Week_2")

complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  
  directory<- "./specdata"
  #initialize the mean vector
  complete_cases <- c()
  files <- list.files(directory)
  #Reading each file in id 
  for (i in 1:length(id)){
    curr_file <-read.csv(paste(directory,'/',files[id[i]],sep=""),header=T, sep=",")
    curr_file_NA_removed <- complete.cases(curr_file)
    complete_cases[i]<-length(curr_file_NA_removed[curr_file_NA_removed=='TRUE'])
  }
  complete <- data.frame(id = id, nobs = complete_cases)
  return(complete)
}

#Test
complete("specdata", 1)
complete("specdata", c(2, 4, 8, 10, 12))
complete("specdata", 30:25)
complete("specdata", 3)
