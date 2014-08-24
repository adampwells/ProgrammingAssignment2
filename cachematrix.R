## These functions support caching of inverted value of a matrix.

## This function wraps a cache around a matrix, for the purpose of 
## storing the calculated inverse from the "solve" function.
## Get/set functions are used to access the cache

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinv <- function(i) inv <<- i
  getinv <- function() inv
  list(set = set, 
       get = get,
       setinv = setinv,
       getinv = getinv)
}


## This function operates on an instance of a cacheMatrix,
## calculating "solve" and cacheing the result.
## Subsequent calls will return the cached value.

cacheSolve <- function(x, ...) {
        inv <- x$getinv()
        if(!is.null(inv)){
          message("cached value")
          return(m)
        } else {
          data <- x$get()
          inv <- solve(data, ...)
          x$setinv(inv)
          inv
        }
}
