###########################################################################                                       #
# Filename:     plot4.R                                                   #
# Author:       Clifford Collio                                           #
# Course:       Exploratory Data Analysis, Coursera                       #
# Project:      Project 1, Plot 4, Multiple base plots                    #
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

# Prepare Plot 1 Data - Global active power  
global_active_power <- as.numeric(subset_pwr_data$Global_active_power)
date_time <- strptime(paste(subset_pwr_data$Date, subset_pwr_data$Time),
                      "%d/%m/%Y %H:%M:%S")

# Prepare Plot 2 Data - Voltage
voltage <- as.numeric(subset_pwr_data$Voltage)

# Prepare Plot 3 Data - Energy sub metering
sub_metering_1 <- as.numeric(subset_pwr_data$Sub_metering_1)
sub_metering_2 <- as.numeric(subset_pwr_data$Sub_metering_2)
sub_metering_3 <- as.numeric(subset_pwr_data$Sub_metering_3)

# Prepare Plot 4 Data - Global reactive power
global_reactive_power <- as.numeric(subset_pwr_data$Global_reactive_power)



# Set the png device
png("plot4.png", width=480, height=480)

# Set layout of the outputted graphs
par(mfrow = c(2, 2))

# Plot 1 Global Active Power
plot(date_time, global_active_power, type="l", xlab="", ylab="Global Active Power")

# Plot 2 Voltage
plot(date_time, voltage, type="l", xlab="datetime", ylab="Voltage")

# Plot 3 Energy Sub metering
plot(date_time, sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(date_time, sub_metering_2, col="red") 
lines(date_time, sub_metering_3, col="blue")
legend("topright", 
       lty = 1, 
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty="n")

# Plot 4 Global Reactive Power
plot(date_time, global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")


dev.off()

