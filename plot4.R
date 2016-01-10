plot4 <- function(){
    ##load data.table package
    library(data.table)
    
    ##load file
    houseDT <- fread("household_power_consumption.txt", sep = ";")[, Date := as.Date(Date, "%d/%m/%Y")][Date >= "2007-02-01" & Date <= "2007-02-02"]
    
    ##add weekday column as date time
    houseDT <- houseDT[, weekdays := as.POSIXct(paste(Date, Time))]
    
    ##set rows n cols
    par(mfrow = c(2, 2))
    
    ##plot line graph
    with(houseDT, {
        plot(houseDT$weekdays, houseDT$Global_active_power, type="l", ylab = "Global Active Power ", xlab="")
        plot(houseDT$weekdays, houseDT$Voltage, type="l", ylab = "Voltage", xlab="datetime")
        with(houseDT,{
            plot(houseDT$weekdays, houseDT$Sub_metering_1, type="l", ylab="Energy sub metering", xlab = "")
            points(houseDT$weekdays, houseDT$Sub_metering_2, type="l", col="red")
            points(houseDT$weekdays, houseDT$Sub_metering_3, type="l", col="blue")
            legend("topright", y.intersp = 0.7, x.intersp=0.3 , pch="-", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        })
        plot(houseDT$weekdays, houseDT$Global_reactive_power, type="l", ylab = "Global_reactive_power", xlab="datetime")
    })
    
    ##create plot4 png
    dev.copy(png, file="plot4.png")
    ##close dev object
    dev.off()
}