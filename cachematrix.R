## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function


## Write a short comment describing this function


##This function creates a matrix object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
	m <- NULL
	set <- function(y) {
		x <<- y
		m <<- NULL
	}
	get <- function() x
	setInverse <- function(inverse) m <<- inverse
	getInverse <- function() m
	list(set = set, get = get, 
		setInverse = setInverse, getInverse = getInverse)
}

##This function calculates the inverse the matrix returned by the makeCacheMatri
##x function. If the calculation has already been done before, the cacheSolve fu
##nction will retrieve the result from the cache

cacheSolve <- function(x) {
	m <- x$getInverse()
	if(!is.null(m)) {
		message("getting cached data")
		return(m)
	}
	data <- x$get()
	m <- solve(data)
	x$setInverse(m)
	m
}

