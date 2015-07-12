###########################################################################                                       #
# Filename:     plot3.R                                                   #
# Author:       Clifford Collio                                           #
# Course:       Exploratory Data Analysis, Coursera                       #
# Project:      Project 1, Plot 3, Sub metering data                      #
#               Individual household electric power consumption Data Set  #
###########################################################################

# Import libraries
library(datasets)

# Read in the data set
full_pwr_data <- read.table("household_power_consumption.txt",
                            sep=";", 
                            stringsAsFactors=FALSE,
                            header=TRUE)

# Subset the data
subset_pwr_data <- full_pwr_data[full_pwr_data$Date %in% c("1/2/2007","2/2/2007") ,]

# Prepare sub metering data
sub_metering_1 <- as.numeric(subset_pwr_data$Sub_metering_1)
sub_metering_2 <- as.numeric(subset_pwr_data$Sub_metering_2)
sub_metering_3 <- as.numeric(subset_pwr_data$Sub_metering_3)

# Prepare the date/time data
date_time <- strptime(paste(subset_pwr_data$Date, subset_pwr_data$Time),
                      "%d/%m/%Y %H:%M:%S")

# Set the png device
png("plot3.png", width=480, height=480)

# Build the line plot for energy sub metering data
plot(date_time, sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(date_time, sub_metering_2, col="red") 
lines(date_time, sub_metering_3, col="blue")

# Set the legend's parameters
legend("topright", 
       lty = 1, 
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()