plot2 <- function(){
    
    ##load data.table package
    library(data.table)
    
    ##load file
    houseDT <- fread("household_power_consumption.txt", sep = ";")[, Date := as.Date(Date, "%d/%m/%Y")][Date >= "2007-02-01" & Date <= "2007-02-02"]
    
    ##add weekday column as date time
    houseDT <- houseDT[, weekdays := as.POSIXct(paste(Date, Time))]
    
    ##get x and y variables
    x <- houseDT[, weekdays]
    y <- houseDT[, Global_active_power]
    
    ##plot line graph
    plot(x, y, type="l", ylab = "Global Active Power (kilowats)", xlab="")
    
    ##create plot2 png
    dev.copy(png, file="plot2.png")
    ##close dev object
    dev.off()
}