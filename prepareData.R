cleanQuestioMark <- function(x)
{
    b <- x=="?"
    x[b] <- NA
    x
}

x <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE)
x <- as.data.frame(lapply(x, cleanQuestioMark))
x$timeStamp <- strptime(paste(x$Date, x$Time), "%d/%m/%Y %H:%M:%S")
sub <- subset(x, timeStamp >= strptime("01/02/2007 00:00:00", "%d/%m/%Y %H:%M:%S") & timeStamp < strptime("03/02/2007 00:00:00", "%d/%m/%Y %H:%M:%S"))
sub <- sub[, !(colnames(sub) %in% c("timeStamp"))]
write.table(sub, file = "subset.txt", row.names = FALSE)
