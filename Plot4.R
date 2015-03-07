## R Script for producing Plot4

setwd("C:/Users/msilva/Desktop/Coursera/04_Exploratory_Data_Analysis/ExData_Plotting1")

##read data
cData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

library(dplyr)
cpdata <- tbl_df(cData); rm(cData)

## retrieve only the required Data (dates)
data <- filter(cpdata, Date == "1/2/2007" | Date == "2/2/2007"); rm(cpdata)

## create a POSIXct variable based on data provided by Date and Time variables
data$measureTime <- as.POSIXct(strptime(paste(data$Date, data$Time),"%d/%m/%Y %T"))

##launch png plotting device, define output configs
png(file = "Plot4.png", width = 480, height = 480, units = "px")

##Setting appropriate graphic parameters
par(mfrow = c(2,2), mar = c(5,5,3,1))

## produce multiplots as requested (note: using bty argument for the 3rd plot legend)
with(data,{
      plot(measureTime, Global_active_power, type = "l", xlab="", ylab = "Global Active Power")
      plot(measureTime, Voltage, type ="l", xlab = "datetime", ylab = "Voltage")
      plot(measureTime,Sub_metering_1, type="l", xlab ="", ylab= "Energy sub metering")
      lines(measureTime,Sub_metering_2, col = "red")
      lines(measureTime,Sub_metering_3, col = "blue")
      legend("topright", bty= "n", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1",  "Sub_metering_2","Sub_metering_3"))
      plot(measureTime,Global_reactive_power, type = "l", xlab = "datetime")
})

## Close graphic device
dev.off()