## Programming Assignment 1
## Exploratory Data Analysis
## Hector Obregon Roa
## plot3

## We use chron to manage times
library(chron)

## Read in the data
mydata <- read.csv("household_power_consumption.txt", sep =";", header=TRUE, 
                   na.strings = c("?", "NA"), stringsAsFactors = FALSE)

## Convert dates and times as needed
mydata$Date <- as.Date(mydata$Date, "%d/%m/%Y")
mydata$Time <- chron(times=mydata$Time)


## Subset to a new data frame for the dates that interest us
date1 <- as.Date("2007-02-01")
date2 <- as.Date("2007-02-02")

myTwoDayData <- mydata[mydata$Date == date1 | mydata$Date == date2,]

## Add a new column that merges date and time
myTwoDayData$DateTime <- as.POSIXct(paste(myTwoDayData$Date, 
                                          myTwoDayData$Time), 
                                    format="%Y-%m-%d %H:%M:%S")

## Plot to screen first (to verify everything is OK)
plot(myTwoDayData$DateTime,myTwoDayData$Sub_metering_1, main="", 
     ylab="Energy sub metering", xlab="", type="l")
lines(myTwoDayData$DateTime,myTwoDayData$Sub_metering_2, col="red" )
lines(myTwoDayData$DateTime,myTwoDayData$Sub_metering_3, col="blue" )
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, col=c("black","red","blue"))

## Open PNG device and plot to the requested file
png("plot3.png")
plot(myTwoDayData$DateTime,myTwoDayData$Sub_metering_1, main="", 
     ylab="Energy sub metering", xlab="", type="l")
lines(myTwoDayData$DateTime,myTwoDayData$Sub_metering_2, col="red" )
lines(myTwoDayData$DateTime,myTwoDayData$Sub_metering_3, col="blue" )
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, col=c("black","red","blue"))
dev.off()