#A reminder: DT[where, select|update|do, by] syntax is used to work with columns of a data.table.

#The "where" part is the i argument
#The "select|update|do" part is the j argument
#These two arguments are usually passed by position instead of by name.

#All modifications to columns can be done in j. Additionally, the set function is available for this use.

# example data
library(data.table)
DT = data.table(x=rnorm(9),y=rep(c("a","b","c"),each=3),z=rnorm(9))

head(DT)

#todos los datatables en memoria
tables() 

#subsets
DT[2,]
DT[DT$y=="a"]
DT[c(2,3)] #si solo indicamos una dimension, nos filtra por filas, con lo cual esto nos devuelve filas 2 y 3
DT[,c(2,3)] # columnas 2 y 3 de todas las filas

#En los datatables, todo lo que vaya después de las comas, R lo interpreta como una expresión.
#HAY PASAR LISTAS DE FUNCIONES PARA APLICAR A TODOS LOS ELEMENTOS
DT[,mean(x), sum(z)] ## NO FUNCIONA
DT[,list(mean(x), sum(z))] 

##Añadir nuevas columnas --> SIMBOLO :=
DT[,w:=z^2]
DT[,a:=x>0] #columna nueva con un booleano indicando si X>0
DT[,b:=mean(x+w,by=a)] #media de la suma de x+w agrupado por valores de las columnas a

##Ojo con las copias, usar la función COPY. Si no al asignar DT2=Dt, los cambios en DT los hereda DT2

##VARIABLES ESPECIALES
.N #Un integer de longitud 1 que nos dices el numeros de ocurrencias por grupo
 DT<-data.table(x=sample(letters[1:3],1E5,TRUE)) #datatable con 10e5 letras (a,b,c)
 DT[,.N,by=x] #cuenta el numero de valores de a,b y c
 
 KEYS
 DT<-data.table(x=rep(c("a","b","c"), each=100, y=rnorm(300)))
setkey(DT,x)
DT['a'] # como ya sabe que la clave es la columna X, podemos hacer filtros directamente por los valores de X

#util para unir tablas
DT1<-data.table(x=c('a','a','b','dt1'), y=1:4)
DT2<-data.table(x=c('a','b','dt2'), z=5:7)
setkey(DT1,x)
setkey(DT2,x)
merge(DT1,DT2)

