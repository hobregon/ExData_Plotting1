## Programming Assignment 1
## Exploratory Data Analysis
## Hector Obregon Roa
## plot1

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

## Plot to screen first (to verify everything is OK)
hist(myTwoDayData$Global_active_power, col = "Red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency")

## Open PNG device and plot to the requested file
png("plot1.png")
hist(myTwoDayData$Global_active_power, col = "Red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()