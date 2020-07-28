dataFile <- "~/Documents/Github/ExData_Plotting1/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
# data$Date <- as.Date(my_data$Date, "%d/%m/%Y")
# dataToUse <- data[data$Data %in% c("2007-02-01", "2007-02-02") ,]
dataToUse <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

##### Plot 1 #####
globalActivePower <- as.numeric(dataToUse$Global_active_power)
png("~/Documents/Github/ExData_Plotting1/plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()


##### Plot 2 #####
datetime <- strptime(paste(dataToUse$Date, dataToUse$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(dataToUse$Global_active_power)
png("~/Documents/Github/ExData_Plotting1/plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()


##### Plot 3 #####
subMetering1 <- as.numeric(dataToUse$Sub_metering_1)
subMetering2 <- as.numeric(dataToUse$Sub_metering_2)
subMetering3 <- as.numeric(dataToUse$Sub_metering_3)

png("~/Documents/Github/ExData_Plotting1/plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()


##### Plot 4 #####
globalActivePower <- as.numeric(dataToUse$Global_active_power)
globalReactivePower <- as.numeric(dataToUse$Global_reactive_power)
voltage <- as.numeric(dataToUse$Voltage)
subMetering1 <- as.numeric(dataToUse$Sub_metering_1)
subMetering2 <- as.numeric(dataToUse$Sub_metering_2)
subMetering3 <- as.numeric(dataToUse$Sub_metering_3)


png("~/Documents/Github/ExData_Plotting1/plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
