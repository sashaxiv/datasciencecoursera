#Working with Tables

#Setting working directory to where data is located
setwd("C:\\Users\\enriquesf\\Documents\\datasciencecoursera\\Curso IV - Exploratory Analisis\\CourseProject")

#As i live in Spain, let´s change locale to plot days in english
Sys.setlocale("LC_ALL", "English")

dataFile <- "data\\household_power_consumption.txt"

#Reading data
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Filter Dates: Our overall goal here is simply to examine how household energy usage varies over a 2-day period in February
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
#str(subSetData)
#summary(subSetData)

# Prevents plot from printing in scientific notation
globalActivePower <- as.numeric(subSetData$Global_active_power)

#Change Date Column to Date Type
#strptime --> Functions to convert between character representations and objects of classes "POSIXlt" and "POSIXct" 
#representing calendar dates and times.
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Creates Picture File in size specified by course project
png("plot2.png", width=480, height=480)

#Plot 1 with given tittles and legend
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()