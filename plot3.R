plot3 <- function(){
    ##load data.table package
    library(data.table)
    
    ##load file
    houseDT <- fread("household_power_consumption.txt", sep = ";")[, Date := as.Date(Date, "%d/%m/%Y")][Date >= "2007-02-01" & Date <= "2007-02-02"]
    
    ##add weekday column as date time
    houseDT <- houseDT[, weekdays := as.POSIXct(paste(Date, Time))]
    
    ##plot base points
    with(houseDT, plot(houseDT$weekdays, houseDT$Sub_metering_1, type="l", ylab="Energy sub metering", xlab = ""))
    ##add points for layer 2
    with(houseDT, points(houseDT$weekdays, houseDT$Sub_metering_2, type="l", col="red"))
    ##add points for layer 3
    with(houseDT, points(houseDT$weekdays, houseDT$Sub_metering_3, type="l", col="blue"))
    
    ##add legend
    legend("topright", y.intersp = 0.4 , pch="-", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    ##create plot3 png
    dev.copy(png, file="plot3.png")
    ##close dev object
    dev.off()
}