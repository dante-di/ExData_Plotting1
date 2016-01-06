# Dataset loading
dataFile <- "./data/household_power_consumption.txt"
data <- read.csv(dataFile, header=TRUE, sep=';', na.strings="?", check.names=FALSE, stringsAsFactors=FALSE, comment.char="", quote='\"')
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Subsetting
data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

# Plot 4
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data, {
    #subgraph1
    plot(Global_active_power~Datetime, type="l",  xlab="", ylab="Global Active Power")
    #subgraph2
    plot(Voltage~Datetime, type="l", xlab="datetime", ylab="Voltage")
    #subgraph3
    plot(Sub_metering_1~Datetime, type="l", xlab="", ylab="Energy sub metering")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    #subgraph4
    plot(Global_reactive_power~Datetime, type="l", xlab="datetime", ylab="Global_reactive_power")
})
dev.off()
