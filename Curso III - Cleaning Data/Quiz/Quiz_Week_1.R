#QUESTION 1

# fread url requires curl package on mac 
# install.packages("curl")

library(data.table)
housing <- data.table::fread("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv")

# VAL attribute says how much property is worth, .N is the number of rows
# VAL == 24 means more than $1,000,000
housing[VAL == 24, .N]

# Answer: 
# 53


#QUESTION 2
#Use the data you loaded from Question 1. Consider the variable FES in the code book. Which of the "tidy data" principles does
#this variable violate?
  
  #Tidy data has one observation per row.
  #Each variable in a tidy data set has been transformed to be interpretable.
  # OK -> Tidy data has one variable per column.
  #Each tidy data table contains information about only one type of observation.




#QUESTION 3
install.packages("xlsx")
library( xlsx)

dat <- xlsx::read.xlsx(file = "Curso III - Cleaning Data/Quiz/getdata_data_DATA.gov_NGAP.xlsx",
                       sheetIndex = 1, rowIndex = 18:23, colIndex = 7:15,  mode='wb')
sum(dat$Zip*dat$Ext,na.rm=T)




#QUESTION 4
install.packages("XML")
library("XML")
fileURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc <- XML::xmlTreeParse(sub("s", "", fileURL), useInternal = TRUE)
rootNode <- XML::xmlRoot(doc)

zipcodes <- XML::xpathSApply(rootNode, "//zipcode", XML::xmlValue)
xmlZipcodeDT <- data.table::data.table(zipcode = zipcodes)
xmlZipcodeDT[zipcode == "21231", .N]




#QUESTION 5
DT <- data.table::fread("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv")

# Answer (fastest):
system.time(DT[,mean(pwgtp15),by=SEX])