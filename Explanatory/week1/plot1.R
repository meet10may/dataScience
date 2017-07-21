setwd("/Users/tanmaynath/Dropbox/DataScience/Coursera/Explanatory")
dataFile <- "./household_power_consumption.txt"
powerConsumption <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Subset the data from the dates 2007-02-01 and 2007-02-02
subSetData <- powerConsumption[powerConsumption$Date %in% c("1/2/2007","2/2/2007") ,]

png("plot1.png", width=480, height=480)

hist(as.numeric(subSetData$Global_active_power),col='red',xlab="Global Active Power (kilowatts)")

