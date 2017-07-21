rankall <- function(outcome,num)
        {
        if (missing(num)){num = "best"}
        data <- read.csv("outcome-of-care-measures.csv", colClasses = "character",na.strings = "Not Available")
        validOutcome <- c('heart attack','heart failure','pneumonia')
        
        output <- matrix(ncol=2,nrow=length(unique(data$State)))
         
        for (i in 1:length(sort(unique(data$State))))
                {
                if(outcome == "heart attack") 
                        {
                        datState <- data[data$State==sort(unique(data$State))[i],]
                        datState[,11] <-as.numeric(datState[,11])
                        datState <- datState[order(datState$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack,datState$Hospital.Name),]
                        if (num=="best")
                                {
                                index <- which(datState[,11]==min(datState[,11],na.rm=TRUE))
                                output[i,1]<- datState$Hospital.Name[index]
                                output[i,2] <- sort(unique(data$State))[i]
                                }
                        else if (num=="worst")
                                {
                                index <- which(datState[,11]==max(datState[,11],na.rm=TRUE))
                                output[i,1]<- datState$Hospital.Name[index]
                                output[i,2] <- sort(unique(data$State))[i]
                                }
                        else output[i,1]<- datState$Hospital.Name[num]
                        output[i,2] <- sort(unique(data$State))[i]
                }
                if(outcome == "heart failure") 
                {
                        datState <- data[data$State==sort(unique(data$State))[i],]
                        datState[,17] <-as.numeric(datState[,17])
                        datState <- datState[order(datState$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure,datState$Hospital.Name),]
                        if (num=="best")
                        {
                                index <- min(which(datState[,17]==min(datState[,17],na.rm=TRUE)))
                                output[i,1]<- datState$Hospital.Name[index]
                                output[i,2] <- sort(unique(data$State))[i]
                        }
                        else if (num=="worst")
                        {
                                index <- max(which(datState[,17]==max(datState[,17],na.rm=TRUE)))
                                output[i,1]<- datState$Hospital.Name[index]
                                output[i,2] <- sort(unique(data$State))[i]
                        }
                        else output[i,1]<- datState$Hospital.Name[num]
                        output[i,2] <- sort(unique(data$State))[i]
                }
                if(outcome == "pneumonia") 
                {
                        datState <- data[data$State==sort(unique(data$State))[i],]
                        datState[,23] <-as.numeric(datState[,23])
                        datState <- datState[order(datState$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia,datState$Hospital.Name),]
                        if (num=="best")
                        {
                                index <- which(datState[,23]==min(datState[,23],na.rm=TRUE))
                                output[i,1]<- datState$Hospital.Name[index]
                                output[i,2] <- sort(unique(data$State))[i]
                        }
                        else if (num=="worst")
                        {
                                index <- max(which(datState[,23]==max(datState[,23],na.rm=TRUE)))
                                output[i,1]<- datState$Hospital.Name[index]
                                output[i,2] <- sort(unique(data$State))[i]
                        }
                        else output[i,1]<- datState$Hospital.Name[num]
                        output[i,2] <- sort(unique(data$State))[i]
                }
                
                }
        
        output <-as.data.frame(output)
        colnames(output) <- c("hospital","state")
        rownames(output) <- sort(unique(data$State))
        return(output)
        }