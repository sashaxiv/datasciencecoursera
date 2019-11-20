#####################################################################################
#####################################################################################

#                      EJERCICIO II

#####################################################################################
#####################################################################################

complete_MegaPro <- function(directory, id = 1:332) {
  
  # Format number with fixed width and then append .csv to number
  fileNames <- paste0(directory, '/', formatC(id, width=3, flag="0"), ".csv" )
  
  # Reading in all files and making a large data.table
  lst <- lapply(fileNames, data.table::fread)
  dt <- rbindlist(lst)
  bool_complete_cases <- complete.cases(dt)
  
  return(dt[bool_complete_cases, .(nobs = .N), by = ID])
 
}

complete_MegaPro("~/datasciencecoursera/Curso II - R Programing/Ejercicios/specdata",1)
complete_MegaPro("~/datasciencecoursera/Curso II - R Programing/Ejercicios/specdata",c(2, 4, 8, 10, 12))

##Falla para el ejercicio 7 por no considerar los 0's
vstr <- "3.5.1"
RNGversion(vstr) 
set.seed(42)
cc <- complete_MegaPro("~/datasciencecoursera/Curso II - R Programing/Ejercicios/specdata", 332:1)
use <- sample(332, 10)
print(cc[use, "nobs"])

#nobs {stats}	R Documentatinobson
#Extract the Number of Observations from a Fit.
#Description
#Extract the number of ‘observations’ from a model fit. This is principally intended to be used in computing BIC




##Para el ejercicio 7, como no obtenía valores compatibles, hice esta función que mete los ficheros con 0 valores.
completeIncluyendoCeros <- function(directory, id = 1:332) {
  
  # 'complete'
  # computes the number of observations with complete result, with no 'NA' values
  # as a function of 'directory', 'pollutant' and 'id'
  # 'directory' is location of the CSV files
  # 'id' is the id of each file
  #---------------------------------------------------------
  # 1. list all the files inside directory
  
  csv_files <- list.files(directory, full.names = TRUE)
  
  # 2. initialize the data frame 'z' with 0 columns and 0 rows
  z <- data.frame()
  
  # 3. loop for each file id
  # 3.1 Read the file
  # 3.2 count the number of complete cases 'nobs',
  # 3.3 make a new dataframe 'y' to show the number of observations
  # 3.4 bind it to our data frame 'z'
  
  for (i in id) {
    
    x <- read.csv(csv_files[i])
    nobs <- sum(complete.cases(x))
    y <- data.frame(i, nobs)
    z <- rbind(z, y)
  }
  
  
  # 4. label column names of our data frame 'z'
  
  colnames(z) <- c("id", "nobs")
  
  # 5. Return data frame 'z'
  # which output looks like:
  # id nobs
  # 1  117
  # 2  1041
  # ...
  
  return(z)
}

##EJERCICIO 7 TEST
RNGversion("3.5.1")  
set.seed(42)
cc <- complete2("~/datasciencecoursera/Curso II - R Programing/Ejercicios/specdata", 332:1)
use <- sample(332, 10)
print(cc[use, "nobs"])
