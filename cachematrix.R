##I sweated a lot to test those 2 functions... 
## The first one create an object to cache a matrix, its inverse with getters
## and setters. The second one is here to test whether or not the inverse have
## already been computed. 

#The lines I tested with are written at the end of the program
makeCacheMatrix <- function(x = matrix()) {
      inverse <- NULL
      set <- function(y) {
            x <<- y
            inverse <<- NULL
      }
      get <- function() x
      setinverse <- function(inv) inverse <<- inv
      getinverse <- function() inverse
      list(set = set, get = get,
           setinverse = setinverse,
           getinverse = getinverse)
}
##If the inverse have been computed (test with the getter),
## the inverse is returned. 
## If not, the inverse is calculated.
cachSolve <- function(x, ...) {
      inverse <- x$getinverse()
      if(!is.null(inverse)) {
            message("getting cached data")
            return(inverse)
      }
      data <- x$get()
      inverse <- solve(a=data, ...)
      x$setinverse(inverse)
      inverse
}

##Tested with the following lines : 
##mat1=matrix(c(1,2,3,4),nrow=2,ncol=2)
##x<-makeCacheMatrix(mat1)
##z<-cachSolve(x)
