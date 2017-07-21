setwd("/Users/tanmaynath/Dropbox/DataScience/Coursera/Explanatory")
dataFile <- "./household_power_consumption.txt"
powerConsumption <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Subset the data from the dates 2007-02-01 and 2007-02-02
subSetData <- powerConsumption[powerConsumption$Date %in% c("1/2/2007","2/2/2007") ,]

day <-strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot2.png", width=480, height=480)

plot(day,as.numeric(subSetData$Global_active_power),type="l",xlab ="",ylab="Global Active Power (kilowatts)")

