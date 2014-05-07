loadData <- function(datePeriod = as.Date(c("2007-02-01","2007-02-02"), format="%Y-%m-%d")){
  if (!file.exists("household_power_consumption.txt")){
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                  "data.zip")
    unzip("data.zip")
    file.remove("data.zip")
  }
  data <- read.csv("household_power_consumption.txt", header=T, sep=";",
                   colClasses=c("character", "character", 
                                "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"),
                   na.strings="?"
                   )
  dates <- as.Date(data$Date, format="%d/%m/%Y")
  data <- subset(data, dates>=datePeriod[1] & dates<=datePeriod[2])
  data$Date <- dates[dates>=datePeriod[1] & dates<=datePeriod[2]]
  data$Time <- strptime(data$Time, format="%H:%M:%S")
  data
}