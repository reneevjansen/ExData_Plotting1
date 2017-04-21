data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = TRUE)
head(data)
str(data)
data$Date <- strptime(data$Date, "%d/%m/%Y")
select <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")
select$Time <- paste(select$Date, select$Time)
select$Time <- strptime(select$Time, format = "%Y-%m-%d %H:%M:%S")
select$Date <- NULL
par(mar = c(3,5,3,3))
plot(select$Time, select$Global_active_power, type = "l", xlab = " ", ylab = "Global Active Power (kilowatts)")

dev.copy(png, file = "plot2.png")
dev.off()



