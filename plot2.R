
{
    # read the given data
    data <- read.table("household_power_consumption.txt", sep = ";", 
                       skip = 66637, nrows = 2880, na.strings = "?")
    colnames(data) <- c("Date", "Time", "Global_active_power", 
                        "Global_reactive_power", "Voltage", "Global_intensity", 
                        "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
    
    # change the class types of Date and Time Columns
    time <- paste(as.character(data[,1]), as.character(data[,2]))
    time <- strptime(time, format = "%d/%m/%Y %H:%M:%S")
    
    # create a png file with default 480x480 size
    png(filename = "plot2.png")
    
    # plot the graph
    par(mfrow = c(1,1))
    plot(time, data$Global_active_power, type = "n",
         xlab = "", ylab = "Global Active Power (kilowatts)")
    lines(time, data$Global_active_power, type = "l")
    dev.off()
}