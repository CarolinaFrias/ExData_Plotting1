##Subset data
data <- "C:/Users/Carolina/Desktop/R/household_power_consumption.txt"
dataread <- read.table(data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
Time <- strptime(dataread$Time, format ="%H:%M:%S")
Date <- as.Date(dataread$Date, format = "%d/%m/%Y")
subdata <- subset(dataread, Date == "1/2/2007" | Date == "2/2/2007")
## Should return row=2880, col=9

##Sub_metering
datetime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subdata$Global_active_power)
subMetering1 <- as.numeric(subdata$Sub_metering_1)
subMetering2 <- as.numeric(subdata$Sub_metering_2)
subMetering3 <- as.numeric(subdata$Sub_metering_3)

##PLOT3
png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
