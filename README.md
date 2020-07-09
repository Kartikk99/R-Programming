# R-Programming

The following repository is collection of assignments from Coursera R Programming course.
The naming for each assignment will be as per Assignment number.
The code Assignment_part2.R contains different techniques to read different files in R.
The code Assignment_part3.R uses the "complete" function from Assignment_part2.R file. Make sure to source both the files.

The code Assignment_part4.R :
Matrix inversion is usually a costly computation and there may be some
benefit to caching the inverse of a matrix rather than computing it
repeatedly (there are also alternatives to matrix inversion that we will
not discuss here). Your assignment is to write a pair of functions that
cache the inverse of a matrix.

Write the following functions:

1.  `makeCacheMatrix`: This function creates a special "matrix" object
    that can cache its inverse.
2.  `cacheSolve`: This function computes the inverse of the special
    "matrix" returned by `makeCacheMatrix` above. If the inverse has
    already been calculated (and the matrix has not changed), then
    `cacheSolve` should retrieve the inverse from the cache.

Computing the inverse of a square matrix can be done with the `solve`
function in R. For example, if `X` is a square invertible matrix, then
`solve(X)` returns its inverse.
**Note : Detailed description can be found in file Week_3_assignment_guidelines.
