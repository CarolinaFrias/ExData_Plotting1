##Subset data
data <- "C:/Users/carolina/Desktop/RStudio/household_power_consumption.txt"
data <- read.table(data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
Time <- strptime(data$Time, format ="%H:%M:%S")
Date <- as.Date(data$Date, format = "%d/%m/%Y")
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
## Should return row=2880, col=9, when called dim(data)

##PLOT1
globalActivePower <- as.numeric(subdata$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()

