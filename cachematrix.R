## These two functions will be used to cache the inverse of a matrix in order to
## avoid having to repeatedly compute it.


## The first function, makeCacheMatrix, creates a list containing a function to

## - set the value of the vector
## - get the value of the vector
## - set the value of the mean
## - get the value of the mean

makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        set <- function(y) {
                x <<- y
                inv <<- NULL
        }
        get <- function() x
        setinverse <- function(inverse) inv <<- inverse
        getinverse <- function() inv
        list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)

}


## This function first checks to see if the inverse of the matrix has already been computed.
## If this the case, then it prints it out.  If not, it will compute the inverse.

cacheSolve <- function(x, ...) {
    
        inv <- x$getinverse()
        if(!is.null(inv)) {
                message("getting cached data")
                return(inv)
                
        }
        data <- x$get()
        inv <- solve(data)
        x$setinverse(inv)
        inv
        
}
