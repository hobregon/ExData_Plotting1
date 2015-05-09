## Programming Assignment 1
## Exploratory Data Analysis
## Hector Obregon Roa

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
plot(myTwoDayData$DateTime,myTwoDayData$Global_active_power, 
     main="", ylab="Global Active Power (kilowatts)", xlab="",
     type="l")

## Open PNG device and plot to the requested file
png("plot2.png")
plot(myTwoDayData$DateTime,myTwoDayData$Global_active_power, 
     main="", ylab="Global Active Power (kilowatts)", xlab="",
     type="l")
dev.off()