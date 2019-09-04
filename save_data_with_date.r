# save with date so as to not overwrite later

saveMe <- function(df){
  #get the name of the object / dataframe to save
  dfname <- deparse(substitute(df))
  # strip all whitespaces from the name, add the date and time, add extension. 
  # Save in folder "data" so as to separate data from scripts (remember to create if you have not got it yet.)
  filename <- gsub(" ", "", paste("data/", dfname, "_", gsub(":", "_", gsub(" ", "_", Sys.time())), ".Rda"))
  save(df, file = filename)
  # remove the variable
  rm(filename)
  # confirm script end
  return(TRUE)
}
