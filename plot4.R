data <- read.table("household_power_consumption.txt", header = TRUE,sep = ";", na.strings = "?")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007/02/02"))
data$datetime <- strptime(paste(data$Time), "%Y-%m-%d %H:%M:%S")
png(filename = "Plot4.png", width = 480, height = 480)
data$datetime <- as.POSIXct(data$datetime)
par(mfrow = c(2,2))
attach(data)

plot(Global_active_power ~ datetime, type = "l", ylab = "Global Active Power", xlab = "")

plot(Voltage ~ datetime, type = "l", )


plot(Sub_metering_1 ~ datetime, type = "l",
     ylab = "Energy sub metering", xlab = "")
lines(Sub_metering_2 ~ datetime, col = "Red")
lines(Sub_metering_3 ~ datetime, col = "Blue")
legend("topright", legend =  c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       cex = 0.7, lwd = 2.5, col=c("black","red","blue"), bty = "n")



plot(Global_reactive_power ~ datetime, type = "l")


dev.off()
detach(data)