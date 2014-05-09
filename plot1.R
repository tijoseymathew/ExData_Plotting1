source("loadData.R")
data <- loadData() #Load data
png("plot1.png", width=480, height=480) #Open png device
hist(data$Global_active_power, 
     col="red",
     main="Global Active Power",
     xlab="Global Active Power(kilowatts)",
     ylab="Frequency")
dev.off() #Close png device