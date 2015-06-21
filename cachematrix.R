## The following code contains two functions
## User must enter variable name for the matrix
## The first function creates a matrix and caches its inverse
## The second function returns the inverse of a matrix
## Both functions assume the matrix is invertible

## Definition: matrix(data = x, nrow = nrow, ncol = ncol, default is byrow = FALSE,dimnames = NULL)
# Sample 4 x 4 and 1 x 1 numeric matrix for testing function
# X1 <- matrix(c(0,1,2,0), nrow = 2, ncol = 2, byrow = FALSE)
# X2 <- matrix(c(6,5,1,2), nrow = 2, ncol = 2, byrow = FALSE)
# X=2

##This function creates a matrix object and caches its inverse.
makeCacheMatrix <- function(x=matrix()){ 
    a<-x
    y<-solve(x)
    save(a,y,file="all.RData") 
    rm(a)
    rm(y)  
}

## This function returns a matrix that is the inverse of 'x'.
## The cached inverse is returned if it has already been calculated for x 
##   or if inverse is not cached, it is calculated and returned
## This function also saves the calculated inverse in data file to further minimize
##   subsequent computer resource needs 
cacheSolve <- function(x=matrix(),...) { 

    load("all.RData") 
    if(a==x){
        message("returning cached inverse")
        return(y)
    }
    if(a!=x){
        a<-x
        y<-solve(x)
        message("returning calculated inverse")
        save(a,y,file="all.RData")
        rm(a)
        return(y)
    }         
}
