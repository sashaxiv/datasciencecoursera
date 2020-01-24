#Working with Tables

#Setting working directory to where data is located
setwd("C:\\Users\\enriquesf\\Documents\\datasciencecoursera\\Curso IV - Exploratory Analisis\\CourseProject")

dataFile <- "./data/household_power_consumption.txt"

#Reading data
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Filter Dates: Our overall goal here is simply to examine how household energy usage varies over a 2-day period in February
subSetData <- data[data$Date %in% c("14/2/2007","15/2/2007") ,]
#str(subSetData)
#summary(subSetData)

# Prevents histogram from printing in scientific notation
globalActivePower <- as.numeric(subSetData$Global_active_power)


#Change Date Column to Date Type
#strptime --> Functions to convert between character representations and objects of classes "POSIXlt" and "POSIXct" 
#representing calendar dates and times.
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#We will use variables numbered in istructions as 7,8,9 in our plot 
subMetering1 <- as.numeric(subSetData$Sub_metering_1) 
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

#Creates Picture File in size specified by course project
png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")

#legends
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()