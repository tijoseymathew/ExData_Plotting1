source("loadData.R")
data <- loadData() #Load data
png("plot2.png", width=480, height=480) #Open png device
plot(data$DateTime, data$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power(kilowatts)")
dev.off() #Close png device