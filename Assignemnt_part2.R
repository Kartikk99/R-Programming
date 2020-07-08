# Part 2

complete<-function(directory, id = 1:332)
{
	y <- vector()
  	for(i in 1:length(id))
	{
    		x <- id
		if(id[i]>0 & id[i]<10){
			 y <- c(y, sum(complete.cases(
      	read.csv(as.character(paste0(directory,"/","00",id[i],".csv"))))))
		} else if(id[i]>9 & id[i]<100){
			y <- c(y, sum(complete.cases(
      	read.csv(as.character(paste0(directory,"/","0",id[i],".csv"))))))
		} else{
			y <- c(y, sum(complete.cases(
      	read.csv(paste(directory, "/", formatC(i, width = 3, flag = "0"), 
            ".csv", sep = ""))
)))
		}
  	}
  	df <- data.frame(x, y)
  	colnames(df) <- c("id","nobs")
  	return(df)
}



#1. You need a vector of the id's, that's done by x <- id
#2. For each id you want the number of complete cases. In order to get that, you have to read the file first. 
#   That's done by read.csv(as.character(paste0(directory,"/","f",id[i],".csv"))). 
#   To get the number of complete cases for that file, you have to wrap the read.csv code inside sum and complete.cases.
#3. Now you want to add that number to a vector. Therefore you need an empty vector (y <- vector()) to which you can add the number of complete cases from step 2. 
#    That's done by wrapping the code from step 2 inside y <- c(y, "code step 2"). With this you add the number of complete cases for each id to the vector y.
#4. The final step is to combine these two vectors into a dataframe with df <- data.frame(x, y) and assign some meaningfull colnames.
