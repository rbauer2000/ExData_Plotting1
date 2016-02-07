# Set working directory
setwd("~/WSR/ExploratoryDataAnalysis201602/Project1")

# Read in data
totalData <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, na.string = "?")

# Subset just the dates we will be using - 2007-02-01 and 2007-02-02
powerConsumption <- subset(totalData, Date == "1/2/2007" | Date == "2/2/2007")

# Create a datetime column using the Date and Time columns.
powerConsumption$datetime <- as.POSIXct(paste(powerConsumption$Date, powerConsumption$Time), format="%d/%m/%Y %H:%M:%S")

# Set mfrow so we plot 2 rows and 2 columns of plots
par(mfrow = c(2, 2))

# Plot first plot
with(powerConsumption, plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))

# Plot upper left plot
with(powerConsumption, plot(datetime, Global_reactive_power, type = "l"))

# Plot lower left plot
with(powerConsumption, plot(datetime, Sub_metering_1, type = "l", ylab = "Energy sub metering"))
with(powerConsumption, points(datetime, Sub_metering_2, type = "l", col = "red"))
with(powerConsumption, points(datetime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Plot lower right plot
with(powerConsumption, plot(datetime, Voltage, type = "l"))


# Copy to file
dev.copy(png, file = "ExData_plotting1/plot4.png", width = 480, height = 480)

# Close PNG device
dev.off()
