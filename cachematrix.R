##Writing a pair of functions that cache the inverse of a matrix


#Istalling and loading matlib package to be able to use inv function for inverse matrix 

install.packages("Matlib")
library(Matlib)


## Write a function that set the value of the martix, get the value of the matrix, 
# set the value of the inverse matrix and get the value of the inverse matrix 

makeCacheMatrix <- function(x = matrix()) {
    inverse_m <- matrix()
    set <- function(y) {
      x <<- y
      inverse_m <<- matrix()
    }
    get <- function() x
    setinverse_m <- function(inverse) inv_m <<- inverse
    getinverse_m <- function() inv_m
    list(set = set, get = get,
         setinverse_m = setinverse_m,
         getinverse_m = getinverse_m)  
}


## Writing a function that calculates the inverse of the special matrix created with the above function.
# First, it  checks if the inverse has already been calculated. If yes, it gets the inverse from the cache 
#and skips the computation. Otherwise, it calculates the inverse of the data and
#sets the value of the inverse in the cache via the setinverse_m function.

cacheSolve <- function(x, ...) {
  inverse_m <- x$getinverse_m()
  if(!is.null(inverse_m)) {
    message("getting cached data")
    return(inverse_m)
  }
  data <- x$get()
  inverse_m <- inv(data)
  x$setinverse_m(inverse_m)
  inverse_m
}
