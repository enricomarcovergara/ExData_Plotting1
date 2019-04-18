#------------------------------------------------------------------------------------------------------
# EXPLORATORY DATA ANALYSIS
# COURSE PROJECT 1
# PLOT 4
#
# BY: Vergara, Enrico Marco
#------------------------------------------------------------------------------------------------------

# Reading the data from the file
# NOTE: Put the data text file directly to your working directory
file <- "./household_power_consumption.txt"
data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Filtering data from the dates 2007-02-01 and 2007-02-02 by subsetting
datasubset <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

# Formatting the desired data from a specific column to be used
GlobalActivePower <- as.numeric(datasubset$Global_active_power)
GlobalReactivePower <- as.numeric(datasubset$Global_reactive_power)
Voltage <- as.numeric(datasubset$Voltage)
SubMetering1 <- as.numeric(datasubset$Sub_metering_1)
SubMetering2 <- as.numeric(datasubset$Sub_metering_2)
SubMetering3 <- as.numeric(datasubset$Sub_metering_3)
DateTime <- paste(datasubset$Date, datasubset$Time, sep=" ")
TimeSeries <- strptime(DateTime, "%d/%m/%Y %H:%M:%S")

# Plotting the data in accordance to the requirements and save the output as PNG
png("plot4.png", width = 480, height = 480)
# Dividing the window into four
par(mfrow = c(2, 2))
# Upper Left Plot
plot(TimeSeries, GlobalActivePower, xlab = "", ylab = "Global Active Power", type = "l")
# Upper Right Plot
plot(TimeSeries, Voltage, xlab = "datetime", ylab = "Voltage", type = "l")
# Lower Left Plot
plot(TimeSeries, SubMetering1, xlab = "", ylab = "Energy sub metering",  col="black", type = "l")
lines(TimeSeries, SubMetering2, col="red", type = "l")
lines(TimeSeries, SubMetering3, col="blue", type = "l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lwd=2.5, col=c("black", "red", "blue"), bty="o")
# Lower Right Plot
plot(TimeSeries, GlobalReactivePower, xlab = "datetime", ylab = "Global_reactive_power", type = "l")

dev.off()
