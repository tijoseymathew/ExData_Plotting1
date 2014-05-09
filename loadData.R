#Function to load the data
#If the .txt file is not available it will be downloaded from source.
#The returned data.frame will have an additional column DateTime with which combines date and time and coverts to 
#POSXct format
#Function argument will be used to extract data points within those dates
loadData <- function(datePeriod = as.Date(c("2007-02-01","2007-02-02"), format="%Y-%m-%d")){
  #Download dataset if not available
  if (!file.exists("household_power_consumption.txt")){
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                  "data.zip")
    unzip("data.zip")
    file.remove("data.zip")
  }
  #Read data source with correct conversions
  data <- read.csv("household_power_consumption.txt", header=T, sep=";",
                   colClasses=c("character", "character", 
                                "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"),
                   na.strings="?"
                   )
  dates <- as.Date(data$Date, format="%d/%m/%Y")
  #Select data with dates of interest
  data <- subset(data, dates>=datePeriod[1] & dates<=datePeriod[2])
  #Add new column with combined date and time in POSXct format
  data$DateTime <- strptime( paste(data$Date, data$Time),
                             format="%d/%m/%Y %H:%M:%S")
  data
}