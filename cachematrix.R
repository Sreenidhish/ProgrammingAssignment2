## Code steps to create a CacheMatrix

## Create object to cache inverse of matrix
makeCacheMatrix <- function( m = matrix() ) {

	## Create Inverse
    i <- NULL

    ## Set matrix
    set <- function( matrix ) {
            m <<- matrix
            i <<- NULL
    }

    ## Get matrix
    get <- function() {
    	## Return the matrix
    	m
    }

    ## Set the inverse of matrix 
    setInverse <- function(inverse) {
        i <<- inverse
    }

    ## Get the inverse of matrix
    getInverse <- function() {
        ## Return the inverse property
        i
    }

    ## Return list of all the above created methods
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}

## Second part of the function (assignment) to create the cacheSolve function

cacheSolve <- function(x, ...) {

    ## Return inverse matrix of 'x'
    mat <- x$getInverse()

    if( !is.null(mat) ) {
            message("getting cached data")
            return(m)
    }

    ## Get the matrix from created object
    data <- x$get()

    ## Calculating inverse using matrix multiplication
    mat <- solve(data) %*% data

    ## Set inverse 
    x$setInverse(mat)

    ## Return the final matrix
    mat
}
