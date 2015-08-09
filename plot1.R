## Getting full dataset
### Saved file to Downloads folder on Mac
### Used parameters from Course Assignment 1
data_full <- read.csv("~/Downloads/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

## Subsetting the data
### Picked the two dates needed from the full data set.
data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_full)

## Converting dates
### Used as.Date() function from Course Assignment 1
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 1
### Trying to match output of graph from Course Assignment 1
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file
### Saved as specified name, type, and size from Course Assignment 1
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

