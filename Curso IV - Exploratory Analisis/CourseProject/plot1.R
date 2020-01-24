#Working with DataTables
library("data.table")

#Setting working directory to where data is located
setwd("C:\\Users\\enriquesf\\Documents\\datasciencecoursera\\Curso IV - Exploratory Analisis\\CourseProject")

#Loading data
powerDT <- data.table::fread(input = "data\\household_power_consumption.txt", na.strings="?")

#Having a look to data in powerDT
#summary(powerDT)
#str(powerDT)

# Prevents histogram from printing in scientific notation
powerDT[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

# Change Date Column to Date Type
powerDT[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

# Filter Dates: Our overall goal here is simply to examine how household energy usage varies over a 2-day period in February
powerDT <- powerDT[(Date >= "2007-02-14") & (Date <= "2007-02-15")]

#Creates Picture File in size specified by course project
png("plot1.png", width=480, height=480)

## Plot 1 with given tittles and legend
hist(powerDT[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()