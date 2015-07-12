###########################################################################                                       #
# Filename:     plot2.R                                                   #
# Author:       Clifford Collio                                           #
# Course:       Exploratory Data Analysis, Coursera                       #
# Project:      Project 1, Plot 2, Day vs. Global Active Power            #
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

# Prepare the active power data 
global_active_power <- as.numeric(subset_pwr_data$Global_active_power)

# Prepare the date/time data
date_time <- strptime(paste(subset_pwr_data$Date, subset_pwr_data$Time),
                      "%d/%m/%Y %H:%M:%S")

# Set the png device
png("plot2.png", width=480, height=480)

# Build the line plot
plot(date_time, 
     global_active_power, 
     type="l", 
     xlab="", 
     ylab="Global Active Power (kilowatts)")

dev.off()