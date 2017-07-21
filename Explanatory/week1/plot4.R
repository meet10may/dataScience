setwd("/Users/tanmaynath/Dropbox/DataScience/Coursera/Explanatory")
dataFile <- "./household_power_consumption.txt"
powerConsumption <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Subset the data from the dates 2007-02-01 and 2007-02-02
subSetData <- powerConsumption[powerConsumption$Date %in% c("1/2/2007","2/2/2007") ,]

day <-strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
submetering_1 <- as.numeric(subSetData$Sub_metering_1)
submetering_2 <- as.numeric(subSetData$Sub_metering_2)
submetering_3 <- as.numeric(subSetData$Sub_metering_3)
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)
globalActivePower <- as.numeric(subSetData$Global_active_power)
volt <- as.numeric(subSetData$Voltage)

png("plot4.png", width=480, height=480)

par(mfrow = c(2,2))
plot(day,as.numeric(subSetData$Global_active_power),type="l",xlab ="",ylab="Global Active Power (kilowatts)")
plot(day,volt,type="l",xlab="datetime",ylab="Voltage")
plot(day,submetering_1,type="l",xlab ="",ylab="Energy submetering")
lines(day,submetering_2,type="l",col="red")
lines(day,submetering_3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1,lwd=1,col=c("black","red","blue"))
plot(day,globalReactivePower,type="l",xlab="datetime",ylab="Global_reactive_power")
