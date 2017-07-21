setwd("/Users/tanmaynath/Dropbox/DataScience/Coursera/Explanatory")
dataFile <- "./household_power_consumption.txt"
powerConsumption <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Subset the data from the dates 2007-02-01 and 2007-02-02
subSetData <- powerConsumption[powerConsumption$Date %in% c("1/2/2007","2/2/2007") ,]

day <-strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
submetering_1 <- as.numeric(subSetData$Sub_metering_1)
submetering_2 <- as.numeric(subSetData$Sub_metering_2)
submetering_3 <- as.numeric(subSetData$Sub_metering_3)
png("plot3.png", width=480, height=480)

plot(day,submetering_1,type="l",xlab ="",ylab="Energy submetering")
lines(day,submetering_2,type="l",col="red")
lines(day,submetering_3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1),lwd=c(2.5,2.5),col=c("black","red","blue"))

