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
  
  
  workfiles <- list.files(directory,"*.csv",full.names = TRUE)[id]
  goal_table <- data.frame()
  for (i in 1:length(id))
     {
      goal_table <-rbind(goal_table, read.csv(workfiles[i]))
     }
  mean(goal_table[,pollutant],na.rm = TRUE)
}