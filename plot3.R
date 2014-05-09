source("loadData.R")
data <- loadData() #Load data
png("plot3.png", width=480, height=480) #Open png device
plot(data$DateTime, data$Sub_metering_1,
     type="l",
     xlab="",
     ylab="Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1,1),
       col=c("black", "red", "blue"))
dev.off() #Close png device