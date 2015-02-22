## Coursera R Programming - Assignment 2
## --- Caching the Inverse of a Matrix ---
## Contains two functions makeCacheMatrix and cacheSolve

## Create a special "matrix" object that can cache its inverse.
## Returns a list containing the following methods:
## set -> sets the matrix and reset the cached matrix inverse
## get -> returns the matrix
## setinverse -> store the matrix inverse in cache
## getinverse -> returned the cached matrix inverse
makeCacheMatrix <- function(x = matrix()) {
    c <- NULL
    set <- function (_x) {
        x <<- _x
        c <<- NULL
    }

    get <- function() {
        x 
    }

    setinverse <- function (_c) {
        c <<- _c
    }

    getinverse <- function() {
        c
    }

    list (set = set, get = get, getinverse = getinverse, setinverse = setinverse)
}




## Calculate the inverse of a matrix and cache its value
## Returns the inverse of matrix from cache if available, else compute it
## and store its value in the cache


cacheSolve <- function(x, ...) {
    inv <- x$getinverse()
    # if inverse exists in cache return it
    if (!is.null(inv)) {
        message ("getting cached data")
        return inv
    }

    #else calculatge it and save the inverse

    m <- x$get()
    inv <- solve(m, ...)
    x$setinverse(inv)
    inv

}
