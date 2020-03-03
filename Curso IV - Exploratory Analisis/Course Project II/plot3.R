library(ggplot2)
library(dplyr)

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
# We're only interested in Baltimore (fips 24510). We group data by type of source and year
dataToPlot <- NEI %>%
  filter(fips == "24510") %>%
  group_by(year, type) %>%
  summarise(Emissions=sum(Emissions))


png(filename="plot3.png")
ggplot(data = dataToPlot, aes(x = factor(year), y = Emissions, fill = type, colore = "grey")) +
  geom_bar(stat = "identity") + facet_grid(. ~ type) + 
  xlab("Year") + ylab(expression('PM'[2.5]*' Emission')) +
  ggtitle("Baltimore Emissions by Type") 

dev.off()