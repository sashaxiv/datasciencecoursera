## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(myCacheMatrix = matrix()) {
  # Inicializo inversa
  inv <- NULL
  
  # Method set
  set <- function( matrix ) {
    myCacheMatrix <<- matrix
    inv <<- NULL
  }
  
  # Method get
  get <- function() {
    ## Return the matrix
    myCacheMatrix
  }
  
  # Method to set the inverse of the matrix
  setInverseMatrix <- function(inverse) {
    inv <<- inverse
  }
  
  ## Method to get the inverse of the matrix
  getInverseMatrix <- function() {
    inv
  }
  
  ## Return a list of the methods
  list(set = set, get = get,
       setInverseMatrix = setInverseMatrix,
       getInverseMatrix = getInverseMatrix)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  ## Return a matrix that is the inverse of 'x'
  myCacheMatrix <- x$getInverseMatrix()
  
  ## Just return the inverse if its already set
  if( !is.null(myCacheMatrix) ) {
    message("getting cached data")
    return(myCacheMatrix)
  }
  
  ## Get the matrix from our object
  data <- x$get()
  
  ## Calculate the inverse using matrix multiplication
  myCacheMatrix <- solve(data) %*% data
  
  ## Set the inverse to the object
  x$setInverseMatrix(myCacheMatrix)
  
  #Return matrix
  myCacheMatrix
}