# Set working directory
setwd("~/WSR/ExploratoryDataAnalysis201602/Project1")

# Read in data
totalData <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, na.string = "?")

# Subset just the dates we will be using - 2007-02-01 and 2007-02-02
powerConsumption <- subset(totalData, Date == "1/2/2007" | Date == "2/2/2007")

# Make sure mfrow reset to just one graph.
par(mfrow=c(1,1))

# Make plot 1 - a histogram.  
hist(as.numeric(powerConsumption$Global_active_power), col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")

# Copy to file
dev.copy(png, file = "plot1.png", width = 480, height = 480, units = "px")

# Close PNG device
dev.off()

