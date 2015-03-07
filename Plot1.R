## script for creating Plot1

setwd("C:/Users/msilva/Desktop/Coursera/04_Exploratory_Data_Analysis/ExData_Plotting1")

##read data
cData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

library(dplyr)
cpdata <- tbl_df(cData); rm(cData)

## read only the data for necessary days
data <- filter(cpdata, Date == "1/2/2007" | Date == "2/2/2007"); rm(cpdata)

##produce the Histogram
hist(data$Global_active_power, col = "red", breaks = 12, xlab = "Global Active Power (kilowats)", main = "Global Active Power")

##print the Histogram to a png file, as requested
dev.copy(png, file = "Plot1.png", width = 480, height = 480, units = "px")

##closing the graphics device
dev.off()