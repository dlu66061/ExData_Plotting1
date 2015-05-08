sub <- read.table("subset.txt", header = TRUE)
sub$timeStamp <- strptime(paste(sub$Date, sub$Time), "%d/%m/%Y %H:%M:%S")
sub$Date <- as.Date(sub$Date, "%d/%m/%Y")
png(filename = "plot4.png", width = 480, height = 480, units = "px")

par(mfrow = c(2, 2))
plot(sub$timeStamp, sub$Global_active_power, type = "n", xlab="", ylab="Global Active Power")
lines(sub$timeStamp, sub$Global_active_power)

plot(sub$timeStamp, sub$Voltage, type = "n", xlab="datetime", ylab="Voltage")
lines(sub$timeStamp, sub$Voltage)

plot(sub$timeStamp, sub$Sub_metering_1, type = "n", xlab="", ylab="Energy sub metering")
lines(sub$timeStamp, sub$Sub_metering_1, col = "black")
lines(sub$timeStamp, sub$Sub_metering_2, col = "red")
lines(sub$timeStamp, sub$Sub_metering_3, col = "blue")
legend("topright", box.lty = 0, lty = 1, pch = NA, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
box(lty = 'solid')

plot(sub$timeStamp, sub$Global_reactive_power, type = "n", xlab="datetime", ylab="Global_reactive_power")
lines(sub$timeStamp, sub$Global_reactive_power)

dev.off()
