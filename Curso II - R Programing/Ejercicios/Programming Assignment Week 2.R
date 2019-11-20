
#####################################################################################
#####################################################################################

          #EJERCICIO I

#####################################################################################
#####################################################################################
##Esta es mucho más efectiva en tiempo de ejecución
pollutmean_Pros <- function (directory, pollutant, id = 1:332){
  
  setwd(directory) ##me muevo al directorio donde tengo los CSV
  file_list <- list.files(directory) ##Me quedo con el nombre de los CSV
 
  listaDatos <- lapply(file_list,read.csv) ##Meto cada uno de los CSV en una lista de listas
  tableDatos <-rbindlist(listaDatos) ##fusiono las listas
  
  tmpDataSet = subset(tableDatos,ID %in% id,select=pollutant)
  mean = mean(tmpDataSet[[1]],na.rm = TRUE) 
  return (mean)
}



pollutmean("/DataScience/datasciencecoursera/Curso II - R Programing/Ejercicios/specdata/","nitrate",23)
pollutmean("/DataScience/datasciencecoursera/Curso II - R Programing/Ejercicios/specdata/","nitrate",70:72)
pollutmean("/DataScience/datasciencecoursera/Curso II - R Programing/Ejercicios/specdata/","nitrate",23)

##Mi versión con lo aprendido hasta ahora
pollutmean_Kike <- function (directory, pollutant, id = 1:332){
  
  setwd(directory) ##me muevo al directorio donde tengo los CSV
  file_list <- list.files(directory) ##Me quedo con el nombre de los CSV
  data <- data.frame()
  
  for(i in file_list){
    tmpFile = read.csv(i,header = TRUE)
    data<-rbind(data,tmpFile)
  }
  
  tmpDataSet = subset(data,ID %in% id)
  meanKike = mean(tmpDataSet[,pollutant],na.rm = TRUE) 
  return (meanKike)
}

pollutmean_Kike("/DataScience/datasciencecoursera/Curso II - R Programing/Ejercicios/specdata/","nitrate",23)
pollutmean_Kike("/DataScience/datasciencecoursera/Curso II - R Programing/Ejercicios/specdata/","nitrate",70:72)
pollutmean_Kike("/DataScience/datasciencecoursera/Curso II - R Programing/Ejercicios/specdata/","nitrate",23)



#####################################################################################
#####################################################################################

#EJERCICIO II

#####################################################################################
#####################################################################################

