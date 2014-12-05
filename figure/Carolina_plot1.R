##Subset data
data <- "C:/Users/Carolina/Desktop/R/household_power_consumption.txt"
dataread <- read.table(data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
Time <- strptime(dataread$Time, format ="%H:%M:%S")
Date <- as.Date(dataread$Date, format = "%d/%m/%Y")
subdata <- subset(dataread, Date == "1/2/2007" | Date == "2/2/2007")
## Should return row=2880, col=9

##PLOT1
globalActivePower <- as.numeric(subdata$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()
