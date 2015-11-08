
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
    png(filename = "plot4.png")
    # plot the graph
    par(mfcol = c(2,2), mar = c(4, 4, 1, 1))
    with (data, {
        #1
        plot(time, Global_active_power, type = "n", xlab = "", ylab = "", main = "")
        title(xlab = "", ylab = "Global Active Power", cex = 0.5)
        lines(time, Global_active_power, type = "l")
        
        #2
        plot(time, Sub_metering_1, type = "n", main = "",
             xlab = "", ylab = "Energy sub metering")
        lines(time, Sub_metering_1, type = "l")
        lines(time, Sub_metering_2, type = "l", col = "red")
        lines(time, Sub_metering_3, type = "l", col = "blue")
        legend("topright", bty = "n", 
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
               lty = 1, col = c("black", "red", "blue"))
        
        #3
        plot(time, Voltage, type = "n", main = "",
             xlab = "datetime", ylab = "Voltage")
        lines(time, Voltage, type = "l")
        
        #4
        plot(time, Global_reactive_power, type = "n", main = "", 
             xlab = "datetime", ylab = "Global_reactive_power")
        lines(time, Global_reactive_power, type = "l")
    })
    
    dev.off()
}
