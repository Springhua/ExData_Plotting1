library(sqldf)
data <- read.csv.sql("~/Downloads/household_power_consumption.txt",
                     sql = "select * from file where Date = '1/2/2007'
                             OR Date = '2/2/2007'",
                     header = T, sep = ";")
datetime <- paste(data$Date, data$Time)
data$datetime <- strptime(datetime,"%d/%m/%Y %H:%M:%S")

# Plot 2
png("~/ExData_Plotting1/plot2.png", width = 480, height = 480)
plot(data$datetime, data$Global_active_power, type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()