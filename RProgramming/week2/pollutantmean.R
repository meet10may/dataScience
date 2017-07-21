setwd("/Users/tanmaynath/Dropbox/DataScience/Coursera/RProgramming/Week_2")

pollutantmean <- function(directory, pollutant = "sulfate", id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)

directory<- "./specdata"
#initialize the mean vector
mean_vec <- c()
files <- list.files(directory)
#Reading each file in id 
for (i in id){
  curr_file <-read.csv(paste(directory,'/',files[i],sep=""),header=T, sep=",")
  curr_file_NA_removed <- curr_file[!is.na(curr_file[, pollutant]), pollutant]
  mean_vec<-c(mean_vec,curr_file_NA_removed)
  
}
mean_pollutant<-mean(mean_vec)

}

#Test
sulfate1_10<-pollutantmean("specdata", "sulfate", 1:10)
nitrate70_72<-pollutantmean("specdata", "nitrate", 70:72)
nitrate23<-pollutantmean("specdata", "nitrate", 23)
