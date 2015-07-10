complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  #directory <-"specdata"
  allfiles <- list.files(path=directory, pattern="*.csv")
  workfiles <- files[id]
  nobs <- id
  nobs = NULL
  for (i in 1:length(id))
  { 
  tables <- read.csv(paste(path=directory,file=workfiles[i],sep="/" ))
  good <- complete.cases(tables)
  nobs[i] <- nrow(tables[good,])
  }
  res <- as.data.frame(cbind(id, nobs))
  #res <- as.data.frame(res1)
  return(res)
}


