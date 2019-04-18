#------------------------------------------------------------------------------------------------------
# EXPLORATORY DATA ANALYSIS
# COURSE PROJECT 1
# PLOT 2
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
DateTime <- paste(datasubset$Date, datasubset$Time, sep=" ")
TimeSeries <- strptime(DateTime, "%d/%m/%Y %H:%M:%S")

# Plotting the data in accordance to the requirements and save the output as PNG
png("plot2.png", width = 480, height = 480)
plot(TimeSeries, GlobalActivePower, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
dev.off()
