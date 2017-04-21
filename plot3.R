data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = TRUE)
head(data)
str(data)
data$Date <- strptime(data$Date, "%d/%m/%Y")
select <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")
select$Time <- paste(select$Date, select$Time)
select$Time <- strptime(select$Time, format = "%Y-%m-%d %H:%M:%S")
select$Date <- NULL
png(file = "plot3.png")
par(mar = c(3,5,4,2))
plot(select$Time, select$Sub_metering_1, type = "l", xlab = " ", ylab = "Energy sub metering", col = "midnightblue")
lines(select$Time, select$Sub_metering_2, col = "red")
lines(select$Time, select$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col = c("midnightblue", "red", "blue"))
dev.off()



