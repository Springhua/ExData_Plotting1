library(sqldf)
data <- read.csv.sql("~/Downloads/household_power_consumption.txt",
                     sql = "select * from file where Date = '1/2/2007'
                             OR Date = '2/2/2007'",
                     header = T, sep = ";")
datetime <- paste(data$Date, data$Time)
data$datetime <- strptime(datetime,"%d/%m/%Y %H:%M:%S")

png("~/ExData_Plotting1/plot3.png", width = 480, height = 480)
plot(data$datetime, data$Sub_metering_1, type = "l",
     xlab = "",
     ylab = "Energy sub metering", col = "black")
lines(data$datetime, data$Sub_metering_2, col = "red")
lines(data$datetime, data$Sub_metering_3, col = "blue")
legend("topright", col = c("black","red","blue"), lty = 1,
       legend = c("Sub_metering_1","Sub_metering_2",
                  "Sub_metering_3"))
dev.off()