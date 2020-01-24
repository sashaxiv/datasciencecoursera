#Working with Tables

#Setting working directory to where data is located
setwd("C:\\Users\\enriquesf\\Documents\\datasciencecoursera\\Curso IV - Exploratory Analisis\\CourseProject")


#Reading data
dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")


#Filter Dates: Our overall goal here is simply to examine how household energy usage varies over a 2-day period in February
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
#str(subSetData)
#summary(subSetData)


# as.numeric prevents plot from printing in scientific notation
globalActivePower <- as.numeric(subSetData$Global_active_power)
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)
voltage <- as.numeric(subSetData$Voltage)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)


#Change Date Column to Date Type
#strptime --> Functions to convert between character representations and objects of classes "POSIXlt" and "POSIXct" 
#representing calendar dates and times.
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Creates Picture File in size specified by course project
png("plot4.png", width=480, height=480)

#breaking device into 4 parts
par(mfrow = c(2, 2)) 

#plot1 - upper Left corner
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

#plot2 - upper Right corner
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

#plot 3 - lower Left corner
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1), col=c("black", "red", "blue"),bty="n", cex=0.8)

#bty
#A character string which determined the type of box which is drawn about plots. If bty is one of "o" (the default)
# , "l", "7", "c", "u", or "]" the resulting box resembles 
# the corresponding upper case letter. A value of "n" suppresses the box.

#cex
#A numerical value giving the amount by which plotting text and symbols should be magnified relative to the default. 
#This starts as 1 when a device is opened, and is reset when the layout is changed, e.g. by setting mfrow.


#plt 4 - lower Right corner
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()