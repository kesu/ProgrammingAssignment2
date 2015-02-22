## --- Coursera R Programming - Assignment 2 ---
## --- Caching the Inverse of a Matrix       ---
## Contains two functions makeCacheMatrix and cacheSolve

## makeCacheMatrix: Create a matrix object that can cache its inverse.
## Returns a list containing the following methods:
## set -> sets the matrix and reset the cached matrix inverse
## get -> returns the matrix
## setinverse -> store the matrix inverse in cache
## getinverse -> returned the cached matrix inverse
makeCacheMatrix <- function(x = matrix()) {
    c <- NULL
    set <- function (m_x) {
        x <<- m_x
        c <<- NULL
    }

    get <- function() x 

    setinverse <- function (m_c) {
        c <<- m_c
    }

    getinverse <- function() {
        c
    }

    list (set = set, get = get, getinverse = getinverse, setinverse = setinverse)
}




## cacheSolve: Calculate the inverse of a matrix and cache its value
## Returns the inverse of matrix from cache if available, else compute it
## and store its value in the cache


cacheSolve <- function(x, ...) {
    inv <- x$getinverse()

    # if inverse exists in cache return it
    if (!is.null(inv)) {
        message ("getting cached data")
        return (inv)
    }

    #else calculate the inverse, and store it in cache

    m <- x$get()
    inv <- solve(m, ...)
    x$setinverse(inv)
    inv

}

