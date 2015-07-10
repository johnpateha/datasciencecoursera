pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  ## NOTE: Do not round the result!
  
  
  allfiles <- list.files(path=directory, pattern="*.csv")
  workfiles <- files[id]
  
  for (i in 1:length(id))
  {
    # if table doesn't exist, create it
    if (i==1)
      #if (!exists("goal_table"))
    {
      goal_table <- read.csv(paste(path=directory,file=workfiles[i],sep="/" ))
    }
    
    # if table does exist, append to it
    if (i>1)
      #if (exists("goal_table"))
    {
      temp_table <-read.csv(paste(path=directory,file=workfiles[i],sep="/" ))
      goal_table<-rbind(goal_table, temp_table)
      rm(temp_table)
    }
  }
  bad <- is.na(goal_table[,pollutant])
  
  #good <- complete.cases(goal_table)
  res <- mean(goal_table[!bad,pollutant])
  return(res)
  
}