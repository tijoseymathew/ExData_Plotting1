data <- loadData()
png("plot2.png", width=480, height=480)
plot(data$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power(kilowatts)",
     xaxt="n") #Plot without the xAxis
#Find ids of dates with midnight time point
midnightIdx <- data$Time==strptime("00:00:00", format="%H:%M:%S")
#Convert dates to day adding one extra day for the last point
xTicks <- weekdays(c(data$Date[midnightIdx],data$Date[nrow(data)]+1), abbreviate=T)
#Add xAxis with new labels
axis(1, c(which(midnightIdx), nrow(data)+1), xTicks)
dev.off()