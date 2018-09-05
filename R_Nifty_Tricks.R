################################################################################
#References:
#https://cran.r-project.org/web/packages/doParallel/vignettes/gettingstartedParallel.pdf


################################################################################


library(foreach)
library(parallel)
library(doParallel)
library(microbenchmark)
library(ggplot2)

################ Code to measure the performance of a code chunk #############################
##################### Using the 'microbenchmarl' package in R #############################



# Function to generate a square matrix and obtain eigenvalue with largest modulus.
max.eig <- function(N, sigma) {
  d <- matrix(rnorm(N**2, sd = sigma), nrow = N)
  E <- eigen(d)$values
  abs(E)[[1]]
}


multiply <- function(N, M){
  N <- randu
  N*M
}


registerDoParallel(4)

tm <- microbenchmark(
      foreach(n = 1:50) %do% max.eig(n, 1),
      foreach(n = 1:50) %dopar% max.eig(n, 1)
)

autoplot(tm)


##########################################################################################  




################ Code to sequentially run multiple R scripts #############################
run1 <- parse("code1.r") 
run2 <- parse("code2.r") 
run3 <- parse("code3.r") 

# Use this to run anytime 
eval(run1) 
eval(run2) 
eval(run3) 



###################################### Try Catch Block in R ###################################
tryCatch(sqrt(c(4, 9, "haha")), error=function(a) "Invalid Input")
