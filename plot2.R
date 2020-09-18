data <- read.table("household_power_consumption.txt", header = TRUE,sep = ";", na.strings = "?")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007/02/02"))
data$datetime <- strptime(paste(data$Time), "%Y-%m-%d %H:%M:%S")
data$datetime <- as.POSIXct(data$datetime)
attach(data)
plot(Global_active_power ~ datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")
#save the file
dev.copy(png, file = "Plot2.png", height = 480, width = 480)
dev.off()
detach(data)