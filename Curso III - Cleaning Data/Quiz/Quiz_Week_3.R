#QUIZ 1
download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv'
              , 'ACS.csv'
              , method='curl' )

# Read data into data.frame
ACS <- read.csv('ACS.csv')
str(ACS)

agricultureLogical
which(agricultureLogical)


#QUIZ2
install.packages('jpeg')
library(jpeg)

# Download the file
download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg'
              , 'jeff.jpg'
              , mode='wb' )

# Read the image
picture <- jpeg::readJPEG('jeff.jpg'
                          , native=TRUE)

# Get Sample Quantiles corressponding to given prob
quantile(picture, probs = c(0.3, 0.8) )

# Answer: 
#       30%       80% 
# -15259150 -10575416 


#QUIZ3
library(jpeg)
library(data.table)
library(dplyr)
fileurl3a = 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv'
dst3a = 'q3a.csv'
fileurl3b = 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv'
dst3b = 'q3b.csv'
download.file(fileurl3a, dst3a, method = 'curl')
download.file(fileurl3b, dst3b, method = 'curl')
gdp = fread(dst3a, skip=4, nrows = 190, select = c(1, 2, 4, 5), col.names=c("CountryCode", "Rank", "Economy", "Total"))
edu = fread(dst3b)

merge = merge(gdp, edu, by = 'CountryCode')
nrow(merge)

arrange(merge, desc(Rank))[13, 'Economy']

#MODO PRO
install.packages("data.table")
library("data.table")


# Download data and read FGDP data into data.table
FGDP <- data.table::fread('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv'
                          , skip=4
                          , nrows = 190
                          , select = c(1, 2, 4, 5)
                          , col.names=c("CountryCode", "Rank", "Economy", "Total")
)

# Download data and read FGDP data into data.table
FEDSTATS_Country <- data.table::fread('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv'
)

mergedDT <- merge(FGDP, FEDSTATS_Country, by = 'CountryCode')

# How many of the IDs match?
nrow(mergedDT)

# Answer: 
# 189

# Sort the data frame in descending order by GDP rank (so United States is last). 
# What is the 13th country in the resulting data frame?
mergedDT[order(-Rank)][13,.(Economy)]

# Answer: 

#                Economy
# 1: St. Kitts and Nevis



#QUIZ4
names(mergedDT)
ocd_groups = group_by(mergedDT,`Income Group`)
summarise(ocd_groups,meamRank = mean(Rank))


#QUIZ5
install.packages("Hmisc")
library("Hmisc")

merge$RankGroups <- cut2(merge$Rank, g=5)
table(merge$RankGroups, merge$`Income Group`)
