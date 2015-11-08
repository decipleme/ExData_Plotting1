
{
    # read the given data
    data <- read.table("household_power_consumption.txt", sep = ";", 
                       skip = 66637, nrows = 2880, na.strings = "?")
    colnames(data) <- c("Date", "Time", "Global_active_power", 
                        "Global_reactive_power", "Voltage", "Global_intensity", 
                        "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

    
    # create a ong file with default 480x480 size
    png(filename = "plot1.png")
    
    # plot the histograam
    with(data, hist(data$Global_active_power, 
                    main = "Global Active Power", 
                    col = "red",
                    xlab = "Global Active Power (kilowatts)"))
    dev.off()
}