##R script for producing Plot2

setwd("C:/Users/msilva/Desktop/Coursera/04_Exploratory_Data_Analysis/ExData_Plotting1")

##read data
cData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

library(dplyr)
cpdata <- tbl_df(cData); rm(cData)

## retrieve only the required data
data <- filter(cpdata, Date == "1/2/2007" | Date == "2/2/2007"); rm(cpdata)

## create a POSIXct variable based on data provided by Date and Time variables
data$measureTime <- as.POSIXct(strptime(paste(data$Date, data$Time),"%d/%m/%Y %T"))

##store only the data required to build the Plot
data2 <- select(data, Global_active_power, measureTime); rm(data)

##launch png plotting device, define output configs
png(file = "Plot2.png", width = 480, height = 480, units = "px")

##Create the requested plot
plot(data2$measureTime, data2$Global_active_power,type ="l", xlab ="", ylab = "Global Active Power (kilowatts)")

##closing the graphics device
dev.off()