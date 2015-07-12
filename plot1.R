###########################################################################                                       #
# Filename:     plot1.R                                                   #
# Author:       Clifford Collio                                           #
# Course:       Exploratory Data Analysis, Coursera                       #
# Project:      Project 1, Plot 1, Global Active Power Histogram          #
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

# Set the png device
png("plot1.png", width=480, height=480)

# Build the histogram
hist(global_active_power, 
     col="red", 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

dev.off()