#Part 1

pollutantmean<- function(directory, pollutant, id = 1:332){
	if(grep("specdata",directory) ==1) 
            {
                    directory <- ("./specdata/")
            }
	avg<-c()
	datafiles<-as.character(list.files(directory))
	datapaths<-paste(directory,datafiles,sep="")
		for(i in id)
		{
#wrong method
#filename<-sprintf("%03d\\.csv",as.integer(i))
#file_req<-list.files(directory,filename)
			x<-read.csv(datapaths[i], header = T, sep = ",")
#print(head(x))
			x_no_na<-x[!is.na(x[,pollutant]),pollutant]
			
			avg<-c(avg,x_no_na)		
		}
	
	final_avg<-mean(avg)
	return(final_avg)
}

# Stack Overflow Code.
#pollutantmean <- function(directory, pollutant = "nitrate", id= 1:332)            
#{                 if(grep("specdata",directory) ==1) 
#            {
#                    directory <- ("./specdata/")
#            }
#            mean_polldata <- c()
#            specdatafiles <- as.character(list.files(directory))
#            specdatapaths <- paste(directory, specdatafiles, sep="")
#                            for(i in id) 
#                    {
#                    curr_file <- read.csv(specdatapaths[i], header=T, sep=",")
#                    remove_na <- curr_file[!is.na(curr_file[, pollutant]), pollutant]
#                    mean_polldata <- c(mean_polldata, remove_na)
#                    }
#            
#             mean_results <- mean(mean_polldata)
#             return(round(mean_results, 3))            
#}



