##################################################################
#  makeCacheMatrix provides the function to be used by cachesolve
#  set matrix 
#  get matrix 
#  set inverse matrix 
#  get inverse matrix 
##################################################################
makeCacheMatrix <- function(x = matrix()) {
      im <- NULL 
      set <- function(y) { 
      x <<- y 
      im <<- NULL 
    } 
    get <- function() x 
    setinverse <- function(inverse) im <<- inverse 
    getinverse <- function() im
    list(set=set, get=get, setinverse=setinverse, getinverse=getinverse) 
  } 
################################################################################## 
#  cachsolve looks if the inverse matrix has been calculated before
#  if yes it return the inverse matrix im , if no it inverts the matrix via solve
#  and returns the inversed matrix im
################################################################################## 
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  im <- x$getinverse() 
       if(!is.null(im)) { 
           message("getting cached data.") 
       return(im) 
      } 
  data <- x$get() 
  im <- solve(data) 
  x$setinverse(im) 
 im 
   } 
