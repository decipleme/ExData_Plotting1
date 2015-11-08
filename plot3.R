
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
    png(filename = "plot3.png")
    # plot the graph
    par(mfrow = c(1,1))
    #1
    plot(time, data$Sub_metering_1, type = "n", 
         xlab = "", ylab = "Energy sub metering")
    lines(time, data$Sub_metering_1, type = "l")
    #2
    lines(time, data$Sub_metering_2, type = "l", col = "red")
    #3
    lines(time, data$Sub_metering_3, type = "l", col = "blue")
    legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           lty = 1, col = c("black", "red", "blue"))
    dev.off()
}
