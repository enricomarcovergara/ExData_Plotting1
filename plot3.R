#------------------------------------------------------------------------------------------------------
# EXPLORATORY DATA ANALYSIS
# COURSE PROJECT 1
# PLOT 3
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
SubMetering1 <- as.numeric(datasubset$Sub_metering_1)
SubMetering2 <- as.numeric(datasubset$Sub_metering_2)
SubMetering3 <- as.numeric(datasubset$Sub_metering_3)
DateTime <- paste(datasubset$Date, datasubset$Time, sep=" ")
TimeSeries <- strptime(DateTime, "%d/%m/%Y %H:%M:%S")

# Plotting the data in accordance to the requirements and save the output as PNG
png("plot3.png", width = 480, height = 480)
plot(TimeSeries, SubMetering1, xlab = "", ylab = "Energy sub metering",  col="black", type = "l")
lines(TimeSeries, SubMetering2, col="red", type = "l")
lines(TimeSeries, SubMetering3, col="blue", type = "l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, 
       col=c("black", "red", "blue"))
dev.off()
