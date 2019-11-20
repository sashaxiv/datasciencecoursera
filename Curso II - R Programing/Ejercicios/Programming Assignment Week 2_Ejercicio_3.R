#####################################################################################
#####################################################################################

#                      EJERCICIO III

#####################################################################################
#####################################################################################

Correlation <- function(directory, umbral = 0) {
  
  # Format number with fixed width and then append .csv to number
  files_dir <- list.files(directory)

  
  # Reading in all files and making a large data.table
  lst <- lapply(files_dir, data.table::fread)
  dt <- rbindlist(lst)
  
  casos_completos <- complete.cases(dt)
  dt_complete_cases <- dt[casos_completos]
  

  dt_complete_cases_cor<-dt_complete_cases[, .(nobs = .N,corr=cor(x = sulfate, y = nitrate)),by = ID]
  dt_complete_cases_cor_umbral <- dt_complete_cases_cor[nobs>umbral]
  
  return(dt_complete_cases_cor_umbral[,corr])
  
}

Correlation("~/datasciencecoursera/Curso II - R Programing/Ejercicios/specdata",150)
Correlation("~/datasciencecoursera/Curso II - R Programing/Ejercicios/specdata",c(2, 4, 8, 10, 12))


#nobs {stats}	R Documentation
#Extract the Number of Observations from a Fit.
#Description
#Extract the number of ‘observations’ from a model fit. This is principally intended to be used in computing BIC

> dt_kike<-dt_complete_cases[,.(nobs = .N, "kike"),by = ID]
> dt_kike
ID nobs   V2
1:   1  117 kike
2:   2 1041 kike
3:   3  243 kike
4:   4  474 kike
5:   5  402 kike
---              
319: 328  967 kike
320: 329  439 kike
321: 330  447 kike
322: 331  284 kike
323: 332   16 kike


cr <- Correlation("~/datasciencecoursera/Curso II - R Programing/Ejercicios/specdata")                
cr <- sort(cr)   
RNGversion("3.5.1")
set.seed(868)                
out <- round(cr[sample(length(cr), 5)], 4)
print(out)

cr <- Correlation("~/datasciencecoursera/Curso II - R Programing/Ejercicios/specdata", 129)                
cr <- sort(cr)                
n <- length(cr)    
RNGversion("3.5.1")
set.seed(197)                
out <- c(n, round(cr[sample(n, 5)], 4))
print(out)


cr <- Correlation("~/datasciencecoursera/Curso II - R Programing/Ejercicios/specdata", 2000)                
n <- length(cr)                
cr <- Correlation("~/datasciencecoursera/Curso II - R Programing/Ejercicios/specdata", 1000)                
cr <- sort(cr)
print(c(n, round(cr, 4)))
