setwd("/DataScience/datasciencecoursera/Curso II - R Programing/Ejercicios/rprog_data_ProgAssignment3-data/")
outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(outcome)
str(outcome)
names(outcome)

#To make a simple histogram of the 30-day death rates from heart attack (column 11 in the outcome dataset),run
outcome[, 11] <- as.numeric(outcome[, 11])
## You may get a warning about NAs being introduced; that is okay
hist(outcome[, 11])

install.packages("data.table")       
library(data.table)    

############################################
############################################
#EJERCICIO 1
############################################
############################################
best <- function(state, outcome) {
  
  # Read outcome data
  out_dt <- data.table::fread('outcome-of-care-measures.csv')
  
  outcome <- tolower(outcome)
  
  # Column name is same as variable so changing it 
  chosen_state <- state 
  
  # Check that state and outcome are valid
  if (!chosen_state %in% unique(out_dt[["State"]])) {
    stop('invalid state')
  }
  
  if (!outcome %in% c("heart attack", "heart failure", "pneumonia")) {
    stop('invalid outcome')
  }
  
  # Renaming Columns to be less verbose and lowercase
  setnames(out_dt
           , tolower(sapply(colnames(out_dt), gsub, pattern = "^Hospital 30-Day Death \\(Mortality\\) Rates from ",
                            replacement = "" ))
  )
  
  #Filter by state
  out_dt <- out_dt[state == chosen_state]
  
  # Columns indices to keep
  col_indices <- grep(paste0("hospital name|state|^",outcome), colnames(out_dt))
  
  # Filtering out unnessecary data 
  out_dt <- out_dt[, .SD ,.SDcols = col_indices]
  
  # Find out what class each column is 
  # sapply(out_dt,class)
  out_dt[, outcome] <- out_dt[,  as.numeric(get(outcome))]
  
  
  # Removing Missing Values for numerical datatype (outcome column)
  out_dt <- out_dt[complete.cases(out_dt),]
  
  # Order Column to Top 
  out_dt <- out_dt[order(get(outcome), `hospital name`)]
  
  return(out_dt[, "hospital name"][1])
  
}
#Comprobaciones
best("TX", "heart attack")
best("TX", "heart failure")





############################################
############################################
#EJERCICIO 2
############################################
############################################
rankhospital <- function(state, outcome, num = "best") {
  
  # Read outcome data
  out_dt <- data.table::fread('outcome-of-care-measures.csv')
  
  outcome <- tolower(outcome)
  
  # Column name is same as variable so changing it 
  chosen_state <- state 
  
  # Check that state and outcome are valid
  if (!chosen_state %in% unique(out_dt[["State"]])) {
    stop('invalid state')
  }
  
  if (!outcome %in% c("heart attack", "heart failure", "pneumonia")) {
    stop('invalid outcome')
  }
  
  # Renaming Columns to be less verbose and lowercase
  setnames(out_dt
           , tolower(sapply(colnames(out_dt), gsub, pattern = "^Hospital 30-Day Death \\(Mortality\\) Rates from ", replacement = "" ))
  )
  
  #Filter by state
  out_dt <- out_dt[state == chosen_state]
  
  # Columns indices to keep
  col_indices <- grep(paste0("hospital name|state|^",outcome), colnames(out_dt))
  
  # Filtering out unnessecary data 
  out_dt <- out_dt[, .SD ,.SDcols = col_indices]
  
  # Find out what class each column is 
  # sapply(out_dt,class)
  out_dt[, outcome] <- out_dt[,  as.numeric(get(outcome))]
  
  
  # Removing Missing Values for numerical datatype (outcome column)
  out_dt <- out_dt[complete.cases(out_dt),]
  
  # Order Column to Top 
  out_dt <- out_dt[order(get(outcome), `hospital name`)]
  
  out_dt <- out_dt[,  .(`hospital name` = `hospital name`, state = state, rate = get(outcome), Rank = .I)]
  
  if (num == "best"){
    return(out_dt[1,`hospital name`])
  }
  
  if (num == "worst"){
    return(out_dt[.N,`hospital name`])
  }
  
  return(out_dt[num,`hospital name`])
  
}



############################################
############################################
#EJERCICIO 3
############################################
############################################

tail(rankall("pneumonia", "worst"), 3)
head(rankall("heart attack", 20), 10)

rankall <- function(outcome, num = "best") {
  ## Read outcome data
  ## Check that state and outcome are valid
  ## For each state, find the hospital of the given rank
  ## Return a data frame with the hospital names and the
  ## (abbreviated) state name
  
  # read the data file
  directory <- "outcome-of-care-measures.csv"
  data <- read.csv(directory, colClasses="character")
  valid_outcomes <- c("heart attack", "heart failure", "pneumonia")
  state_arr <- sort(unique(data$State))
  arr_len <- length(state_arr)
  hospital <- rep("", arr_len)
  
  if (!outcome %in% valid_outcomes) {
    stop("invalid outcome")
  } else {
    for(i in 1:arr_len) {
      # loop for each state
      state_subset <- data[data[, 7]==state_arr[i], ]
      if(outcome == "heart attack") {
        hospital[i] <- num_helper(state_subset, 11, num) 
      } else if (outcome == "heart failure") {
        hospital[i] <- num_helper(state_subset, 17, num) 
      } else {
        hospital[i] <- num_helper(state_subset, 23, num) 
      }
    }
  }
  # create the data frame to return
  df <- data.frame(hospital=hospital, state=state_arr)
  result <- df
  return(result)
}


num_helper <- function(state_subset, col_num, num) {
  # get "attack", "failure" and "pneumonia" vector
  outcome_arr <- as.numeric(state_subset[, col_num])
  len <- dim(state_subset[!is.na(outcome_arr), ])[1]
  if (num == "best") {
    rank <- rank_helper(state_subset, outcome_arr, 1)
  } else if (num == "worst") {
    rank <- rank_helper(state_subset, outcome_arr, len)
  } else if (num > len) {
    rank <- NA
  } else {
    rank <- rank_helper(state_subset, outcome_arr, num)
  }
  result <- rank
  return(result)
}

rank_helper <- function(state_subset, outcome_arr, num) {
  result <- state_subset[, 2][order(outcome_arr, state_subset[, 2])[num]]
  return(result)
}



##QUIZ
best("SC", "heart attack")
best("NY", "pneumonia")
best("AK", "pneumonia")
rankhospital("NC", "heart attack", "worst")
rankhospital("WA", "heart attack", 7)
rankhospital("TX", "pneumonia", 10)
rankhospital("NY", "heart attack", 7)
r <- rankall("heart attack", 4)
as.character(subset(r, state == "HI")$hospital)
r <- rankall("pneumonia", "worst")
as.character(subset(r, state == "NJ")$hospital)
r <- rankall("heart failure", 10)
as.character(subset(r, state == "NV")$hospital)

