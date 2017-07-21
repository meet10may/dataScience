# path <- setwd("/Users/natht02/Dropbox/DataScience/Coursera/RProgramming/week4/")
# outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
# outcome[, 11] <- as.numeric(outcome[, 11])
# hist(outcome[, 11])

best <- function(state,outcome){
        data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        validOutcome <- c('heart attack','heart failure','pneumonia')
        data[,11] <-as.numeric(data[,11])
        data[,17] <-as.numeric(data[,17])
        data[,23] <-as.numeric(data[,23])
   
        if(outcome == "heart attack") {
                index <- which.min(data[data$State==state,]$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)
                hosp_name <- data[data$State==state,]$Hospital.Name[index]
        } else if(outcome == "heart failure") {
                index <- which.min(data[data$State==state,]$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure)
                hosp_name <- data[data$State==state,]$Hospital.Name[index]
        } else {
                index <- which.min(data[data$State==state,]$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia)
                hosp_name <- data[data$State==state,]$Hospital.Name[index]
        }
        if (!state %in% data$State) {
                stop("invalid state")
        } else if(!outcome %in% validOutcome) {
                stop("invalid outcome")
        } 
        return(hosp_name)
}
        