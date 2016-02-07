# Set working directory
setwd("~/WSR/ExploratoryDataAnalysis201602/Project1")

# Read in data
totalData <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, na.string = "?")

# Subset just the dates we will be using - 2007-02-01 and 2007-02-02
powerConsumption <- subset(totalData, Date == "1/2/2007" | Date == "2/2/2007")

# Create a datetime column using the Date and Time columns.
powerConsumption$datetime <- as.POSIXct(paste(powerConsumption$Date, powerConsumption$Time), format="%d/%m/%Y %H:%M:%S")

# Make sure mfrow reset to just one graph.
par(mfrow=c(1,1))

# Plot Global active power vs. datetime
with(powerConsumption, plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))

# Copy to file
dev.copy(png, file = "ExData_Plotting1/plot2.png", width = 480, height = 480, units = "px")

# Close PNG device
dev.off()
