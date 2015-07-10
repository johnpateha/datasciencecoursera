corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
  
  workfiles <- list.files(directory,"*.csv",full.names = TRUE)
  nobs <- vector("integer")
  res <- vector("numeric")
  res1 <- vector("numeric")
  dtf <- data.frame()
  for (i in 1:length(workfiles))
  { 
    nobs[i] <- nrow(na.omit(read.csv(workfiles[i])))
    if (nobs[i]>threshold) 
      {
        dtf <-na.omit(read.csv(workfiles[i]))
        #cor(q[,2],q[3])
        res[i] <-cor(dtf[,2],dtf[3])
      }
    #q <-na.omit(read.csv(workfiles[i]))
    #cor(q[,2],q[3])
    #q
  }
  #q <-na.omit(read.csv(workfiles[i]))
  #cor(q[,2],q[3])
  #q
  
  #as.data.frame(cbind(id, nobs))
  #na.omit(res)
  #res
  res1 <-na.omit(res)
  res1
  }
