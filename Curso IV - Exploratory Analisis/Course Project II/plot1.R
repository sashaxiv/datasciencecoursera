#Setting working directory to where data is located
setwd("C:\\Users\\enriquesf\\Documents\\datasciencecoursera\\Curso IV - Exploratory Analisis\\Course Project II")

dataurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
zipfile <- "cp2data.zip"
if(file.exists(zipfile)) 
  { 
    print("We already have the file")
  }else {
    download.file(dataurl, zipfile ,mode="wb")
}


datafiles <- unzip(zipfile)
print(datafiles)
SCC <- readRDS(datafiles[1])
NEI <- readRDS(datafiles[2])

# select and group data to plot
dataToPlot <- aggregate(NEI$Emissions, by = list(Year = NEI$year), FUN = sum)
colnames(dataToPlot) <- c("Year", "Total Emissions")

# final plot
png(filename="plot1.png")
barplot(dataToPlot$`Total Emissions`
        , names = dataToPlot$Year
        , xlab = "Years", ylab = "Emissions"
        , main = "Emissions over the Years")
dev.off()