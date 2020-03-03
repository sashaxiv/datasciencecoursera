#Setting working directory to where data is located
setwd("Curso IV - Exploratory Analisis/Course Project II")

dataurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
zipfile <- "cp2data.zip"
if(file.exists(zipfile)) 
{ 
  print("We already have the file")
}else {
  download.file(dataurl, zipfile ,mode="wb")
}


datafiles <- unzip(zipfile)
SCC <- readRDS(datafiles[1])
NEI <- readRDS(datafiles[2])


# Select and group data to plot with Dplyr
# We're only interested in Baltimore (fips 24510).
dataToPlot <- NEI %>%
  filter(fips == "24510") %>%
  group_by(year) %>%
  summarise(Emissions=sum(Emissions))

colnames(dataToPlot) <- c("Year", "Total Emissions")

# final bar plot
png(filename="plot2.png")
barplot(dataToPlot$`Total Emissions`
        , names = dataToPlot$Year
        , xlab = "Years", ylab = "Emissions"
        , main = "Emissions over the Years")
dev.off()