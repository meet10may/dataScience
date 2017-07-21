rankhospital <- function(state,outcome,num){
        data <- read.csv("outcome-of-care-measures.csv", colClasses = "character",na.strings = "Not Available")
        validOutcome <- c('heart attack','heart failure','pneumonia')
        
        if(outcome == "heart attack") {
                datState <- data[data$State==state,]
                datState[,11] <-as.numeric(datState[,11])
                datState <- datState[order(datState$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack,datState$Hospital.Name),]
                if (num=="best"){
                        index <- which(datState[,11]==min(datState[,11],na.rm=TRUE))
                        hospitalName<- datState$Hospital.Name[index]
                }else if (num=="worst"){
                        index <- which(datState[,11]==max(datState[,11],na.rm=TRUE))
                        hospitalName<- datState$Hospital.Name[index]
                } else hospitalName<- datState$Hospital.Name[num]
                
        } else if(outcome == "heart failure") {
                datState <- data[data$State==state,]
                datState[,17] <-as.numeric(datState[,17])
                datState <- datState[order(datState$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure,datState$Hospital.Name),]
                if (num=="best"){
                        index <- which(datState[,17]==min(datState[,17],na.rm=TRUE))
                        hospitalName<- datState$Hospital.Name[index]
                }else if (num=="worst"){
                        index <- which(datState[,17]==max(datState[,17],na.rm=TRUE))
                        hospitalName<- datState$Hospital.Name[index]
                } else hospitalName<- datState$Hospital.Name[num]
        } else {
                datState <- data[data$State==state,]
                datState[,23] <-as.numeric(datState[,23])
                datState <- datState[order(datState$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia,datState$Hospital.Name),]
                if (num=="best"){
                        index <- which(datState[,23]==min(datState[,23],na.rm=TRUE))
                        hospitalName<- datState$Hospital.Name[index]
                }else if (num=="worst"){
                        index <- which(datState[,23]==max(datState[,23],na.rm=TRUE))
                        hospitalName<- datState$Hospital.Name[index]
                } else hospitalName<- datState$Hospital.Name[num]
        }
        if (!state %in% data$State) {
                stop("invalid state")
        } else if(!outcome %in% validOutcome) {
                stop("invalid outcome")
        } #else if(num>nrow(data)){
           #     stop("invalid rank")
        #}
        return(hospitalName)
}