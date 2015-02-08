library(sqldf)
data <- read.csv.sql("~/Downloads/household_power_consumption.txt",
                      sql = "select * from file where Date = '1/2/2007'
                             OR Date = '2/2/2007'",
                      header = T, sep = ";")
datetime <- paste(data$Date, data$Time)
data$datetime <- strptime(datetime,"%d/%m/%Y %H:%M:%S")

# Plot 1
png("~/ExData_Plotting1/plot1.png", width = 480, height = 480)
hist(data[,3], freq = T, main = "Global Active Power", 
    xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()
