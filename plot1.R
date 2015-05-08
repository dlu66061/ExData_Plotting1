sub <- read.table("subset.txt", header = TRUE)
sub$Date <- as.Date(sub$Date, "%d/%m/%Y")
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(sub$Global_active_power, xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power", col = "red")
dev.off()
