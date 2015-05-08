sub <- read.table("subset.txt", header = TRUE)
sub$timeStamp <- strptime(paste(sub$Date, sub$Time), "%d/%m/%Y %H:%M:%S")
sub$Date <- as.Date(sub$Date, "%d/%m/%Y")
png(filename = "plot3.png", width = 480, height = 480, units = "px")
plot(sub$timeStamp, sub$Sub_metering_1, type = "n", xlab="", ylab="Energy sub metering")
lines(sub$timeStamp, sub$Sub_metering_1, col = "black")
lines(sub$timeStamp, sub$Sub_metering_2, col = "red")
lines(sub$timeStamp, sub$Sub_metering_3, col = "blue")
legend("topright", lty = 1, pch = NA, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()



