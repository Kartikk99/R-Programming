best <- function(state, outcome) {
## Read outcome data
	data <- read.csv("F:/R Programming/Week 4/outcome-of-care-measures.csv")
	
	state_check <- as.character(unique(data[,7]))
	
	if(!(state %in% state_check))
	{
		stop("Invalid State!!")
	}
	
	data_req <- subset(data, data$State == state)
	
	
	if(outcome == "heart attack")
	{
		data.sort <- data_req[order(data_req[,11]),]
		return(data.sort[1,2])
	}
	else if(outcome == "heart failure")
	{
		data.sort <- data_req[order(data_req[,17]),]
		return(data.sort[1,2])
	}
	else if(outcome == "pneumonia")
	{
		data.sort <- data_req[order(data_req[,23]),]
		return(data.sort[1,2])
	}
	else
	{
		stop("Invalid Outcome!!")
	}
	
## Check that state and outcome are valid
## Return hospital name in that state with lowest 30-day death
## rate
}

rankhospital <- function(state, outcome, num = "best") {
## Read outcome data
	data <- read.csv("F:/R Programming/Week 4/outcome-of-care-measures.csv")
	
	state_check <- as.character(unique(data[,7]))
	
	check<- state %in% state_check
	if(check == FALSE)
	{
		stop("Invalid State!!")
	}

	data_req <- subset(data, data$State == state)
	
	if(num == "best")
	{
		num = 1
	}
	
	if(outcome == "heart attack")
	{
		data.sort <- data_req[order(data_req[,11]),]
		return_data <- data.frame(data.sort[num, 2], data.sort[num,7], data.sort[num,11],num)
	}
	else if(outcome == "heart failure")
	{
		data.sort <- data_req[order(data_req[,17]),]
		return_data <- data.frame(data.sort[num, 2], data.sort[num,7], data.sort[num,17],num)
	}
	else if(outcome == "pneumonia")
	{
		data.sort <- data_req[order(data_req[,23]),]
		return_data <- data.frame(data.sort[num, 2], data.sort[num,7], data.sort[num,23],num)
	}
	else
	{
		stop("Invalid Outcome!!")
	}
	
	colnames(return_data) <- c("Hospital Name", "Hospital State","Rate","Rank")
	
	if(return_data$Rate == "Not Available")
	{
		stop("NA!!")
	}
	
	return(return_data)
	
## Check that state and outcome are valid
## Return hospital name in that state with the given rank
## 30-day death rate
}


rankall <- function(outcome, num = "best") {
## Read outcome data
## Check that state and outcome are valid
## For each state, find the hospital of the given rank
## Return a data frame with the hospital names and the
## (abbreviated) state name
	data1 <- read.csv("F:/R Programming/Week 4/outcome-of-care-measures.csv")
	data <- data1[order(data1[,2]),]	# To order hospital by names.

	
	if(outcome == "heart attack")
	{
		data.sort <- data[order(data[,11]),]
		return_data <- data.frame(data.sort[, 2], data.sort[,7], data.sort[,11])
	}
	else if(outcome == "heart failure")
	{
		data.sort <- data[order(data[,17]),]
		return_data <- data.frame(data.sort[, 2], data.sort[,7], data.sort[,17])
	}
	else if(outcome == "pneumonia")
	{
		data.sort <- data[order(data[,23]),]
		return_data <- data.frame(data.sort[, 2], data.sort[,7], data.sort[,23])
	}
	else
	{
		stop("Invalid Outcome!!")
	}
	
	colnames(return_data) <- c("Hospital Name", "Hospital State","Rate")
	for(i in 1:length(return_data))
	{
		if(return_data$Rate[i] == "Not Available")
		{
			stop("NA!!")
		}
	}
	
		return(return_data)
	
}
