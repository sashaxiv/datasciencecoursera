#QUESTION 1
install.packages("jsonlite")
install.packages("httpuv")
install.packages("httr")

library(jsonlite)
library(httpuv)
library(httr)

# Can be github, linkedin etc depending on application
oauth_endpoints("github")

# Change based on your appname, key, and secret 
myapp <- oauth_app(appname = "CourseraJHKike",key = "Iv1.ccafec65295282ab",secret = "07ceb2048881a64a12bc1d27da420bd19a389c04")

# Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)

# Take action on http error
stop_for_status(req)

# Extract content from a request
json1 = content(req)

# Convert to a data.frame
gitDF = jsonlite::fromJSON(jsonlite::toJSON(json1))

# Subset data.frame
gitDF[gitDF$full_name == "jtleek/datasharing", "created_at"] 

# Answer: 
# 2013-11-07T13:25:07Z




#QUESTION 2
# install.packages("sqldf")
library("sqldf")

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
f <- file.path(getwd(), "ss06pid.csv")
download.file(url, f)
acs <- data.table::data.table(read.csv(f))

# Answer: 
query1 <- sqldf("select pwgtp1 from acs where AGEP < 50")




#QUESTION 3
#Using the same data frame you created in the previous problem, what is the equivalent function to

unique(acs$AGEP)
# Answer
# sqldf("select distinct AGEP from acs")



#QUESTION 4
#How many characters are in the 10th, 20th, 30th and 100th lines of HTML from this page:
  
#http://biostat.jhsph.edu/~jleek/contact.html
#(Hint: the nchar() function in R may be helpful)

connection <- url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode <- readLines(connection)
close(connection)
c(nchar(htmlCode[10]), nchar(htmlCode[20]), nchar(htmlCode[30]), nchar(htmlCode[100]))

# Answer: 
# 45 31 7 25



#QUESTION 5
#Read this data set into R and report the sum of the numbers in the fourth of the nine columns.
#https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for
#Original source of the data: http://www.cpc.ncep.noaa.gov/data/indices/wksst8110.for

#(Hint this is a fixed width file format)
?read.fwf ~#--> Read a table of fixed width formatted data into a data.frame.

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
lines <- readLines(url, n = 10)
w <- c(1, 9, 5, 4, 1, 3, 5, 4, 1, 3, 5, 4, 1, 3, 5, 4, 1, 3)
colNames <- c("filler", "week", "filler", "sstNino12", "filler", "sstaNino12", 
              "filler", "sstNino3", "filler", "sstaNino3", "filler", "sstNino34", "filler", 
              "sstaNino34", "filler", "sstNino4", "filler", "sstaNino4")

d <- read.fwf(url, w, header = FALSE, skip = 4, col.names = colNames)
d2 <- d[, grep("^[^filler]", names(d))] #g rep nos devuelve las posiciones de columnas que queremos, todas menos los filler
sum(d[, 4])

#For example, the regular expression [0123456789] matches any single digit, and [^abc] matches anything 
#except the characters a, b or c

#tmp3 <- grep("[^week]", names(d))
#tmp3
#[1]  1  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18


# Answer: 
# 32426.7
