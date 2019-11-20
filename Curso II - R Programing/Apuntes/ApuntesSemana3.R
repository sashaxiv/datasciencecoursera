########################################################################################################
#lapply
########################################################################################################
#lapply takes three arguments: (1) a list X; (2) a function (or the name of a function) FUN; (3) other
#arguments via its ... argument. If X is not a list, it will be coerced to a list using as.list.

x<-list(a=1:5,b=rnorm(10))
lapply(x,mean)

x <- list(a = matrix(1:4, 2, 2), b = matrix(1:6, 3, 2))



##########################################################################################################
#lapply
##########################################################################################################
#An anonymous function for extracting the first column of each matrix.
lapply(x, function(elt) elt[,1])
#$a
#[1] 1 2
#$b
#[1] 1 2 3




#########################################################################################################
#sapply
#########################################################################################################
#sapply will try to simplify the result of lapply if possible.
#If the result is a list where every element is length 1, then a vector is returned
#If the result is a list where every element is a vector of the same length (> 1), a matrix is returned.
#If it can’t figure things out, a list is returned

x <- list(a = 1:4, b = rnorm(10), c = rnorm(20, 1), d = rnorm(100, 5))
lapply(x, mean)
#$a
#[1] 2.5
#$b
#[1] 0.06082667
#$c
#[1] 1.467083
#$d
#[1] 5.074749

sapply(x, mean)
#a b c d
#2.50000000 0.06082667 1.46708277 5.07474950



##################################################################################################################
#apply
##################################################################################################################
#apply is used to a evaluate a function (often an anonymous one) over the margins of an array.
#It is most often used to apply a function to the rows or columns of a matrix
#It can be used with general arrays, e.g. taking the average of an array of matrices
#It is not really faster than writing a loop, but it works in one line!

str(apply)
#function (X, MARGIN, FUN, ...)
#  X is an array
#MARGIN is an integer vector indicating which margins should be “retained”.
#FUN is a function to be applied
#... is for other arguments to be passed to FUN

x <- matrix(rnorm(200), 20, 10)
 apply(x, 2, mean)
 #[1] 0.04868268 0.35743615 -0.09104379
 #[4] -0.05381370 -0.16552070 -0.18192493
 #[7] 0.10285727 0.36519270 0.14898850
 #[10] 0.26767260
 apply(x, 1, sum)
 #[1] -1.94843314 2.60601195 1.51772391
 #[4] -2.80386816 3.73728682 -1.69371360
 #[7] 0.02359932 3.91874808 -2.39902859
 #[10] 0.48685925 -1.77576824 -3.34016277
 #[13] 4.04101009 0.46515429 1.83687755
 #[16] 4.36744690 2.21993789 2.60983764
 #[19] -1.48607630 3.58709251

 #For sums and means of matrix dimensions, we have some shortcuts.
 #rowSums = apply(x, 1, sum)
 #rowMeans = apply(x, 1, mean)
 #colSums = apply(x, 2, sum)
 #colMeans = apply(x, 2, mean)
 #The shortcut functions are much faster, but you won’t notice unless you’re using a large matrix.
 
 x <- matrix(rnorm(200), 20, 10)
 apply(x, 1, quantile, probs = c(0.25, 0.75))
 #[,1] [,2] [,3] [,4]
 #25% -0.3304284 -0.99812467 -0.9186279 -0.49711686
 #75% 0.9258157 0.07065724 0.3050407 -0.06585436
 #[,5] [,6] [,7] [,8]
 #25% -0.05999553 -0.6588380 -0.653250 0.01749997
 #75% 0.52928743 0.3727449 1.255089 0.72318419
 #[,9] [,10] [,11] [,12]
 #25% -1.2467955 -0.8378429 -1.0488430 -0.7054902
 #75% 0.3352377 0.7297176 0.3113434 0.4581150
 #[,13] [,14] [,15] [,16]
 #25% -0.1895108 -0.5729407 -0.5968578 -0.9517069
 #75% 0.5326299 0.5064267 0.4933852 0.8868922
 #[,17] [,18] [,19] [,20]
 
 
a <- array(rnorm(2 * 2 * 10), c(2, 2, 10))
apply(a, c(1, 2), mean)
#[,1] [,2]
#[1,] -0.2353245 -0.03980211
#[2,] -0.3339748 0.04364908
rowMeans(a, dims = 2)
#[,1] [,2]
#[1,] -0.2353245 -0.03980211
#[2,] -0.3339748 0.04364908
 


##################################################################################################################
#tapply
##################################################################################################################
#tapply is used to apply a function over subsets of a vector. I don’t know why it’s called tapply.
str(tapply)
function (X, INDEX, FUN = NULL, ..., simplify = TRUE)
#  X is a vector
#INDEX is a factor or a list of factors (or else they are coerced to factors)
#FUN is a function to be applied
#... contains other arguments to be passed FUN
#simplify, should we simplify the result?
 
x <- c(rnorm(10), runif(10), rnorm(10, 1))
f <- gl(3, 10)
f
#[1] 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 3 3 3
#[24] 3 3 3 3 3 3 3
#Levels: 1 2 3
tapply(x, f, mean)
#1 2 3
#0.1144464 0.5163468 1.2463678 


##################################################################################################################
#split
##################################################################################################################
#split takes a vector or other objects and splits it into groups determined by a factor or list of factors.
 str(split)
function (x, f, drop = FALSE, ...)
  #  x is a vector (or list) or data frame
  #f is a factor (or coerced to one) or a list of factors
  #drop indicates whether empty factors levels should be dropped
x <- c(rnorm(10), runif(10), rnorm(10, 1))  ##sería equivalente al Tapply anterior
f <- gl(3, 10)
split(x, f)
#$‘1‘
#[1] -0.8493038 -0.5699717 -0.8385255 -0.8842019
#[5] 0.2849881 0.9383361 -1.0973089 2.6949703
#[9] 1.5976789 -0.1321970
#$‘2‘
#[1] 0.09479023 0.79107293 0.45857419 0.74849293
#[5] 0.34936491 0.35842084 0.78541705 0.57732081
#[9] 0.46817559 0.53183823
#$‘3‘
#[1] 0.6795651 0.9293171 1.0318103 0.4717443
#[5] 2.5887025 1.5975774 1.3246333 1.4372701
  

#A common idiom is split followed by an lapply.
lapply(split(x, f), mean)
#$‘1‘
#[1] 0.1144464
#$‘2‘
#[1] 0.5163468
#$‘3‘
#[1] 1.246368


#Splitting a Data Frame
s <- split(airquality, airquality$Month)
lapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]))
#$‘5‘
#Ozone Solar.R Wind
#NA NA 11.62258
#$‘6‘
#Ozone Solar.R Wind
#NA 190.16667 10.26667
#$‘7‘
#Ozone Solar.R Wind
#NA 216.483871 8.941935

sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]))
#5 6 7 8 9
#Ozone NA NA NA NA NA
#Solar.R NA 190.16667 216.483871 NA 167.4333
#Wind 11.62258 10.26667 8.941935 8.793548 10.1800
sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")],
                                 na.rm = TRUE))
#5 6 7 8 9
#Ozone 23.61538 29.44444 59.115385 59.961538 31.44828
#Solar.R 181.29630 190.16667 216.483871 171.857143 167.43333
#Wind 11.62258 10.26667 8.941935 8.793548 10.18000
