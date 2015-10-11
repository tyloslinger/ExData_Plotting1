plot1 <- function() {
    ##load data.table package
    library(data.table)
    
    ##load file
    houseDT <- fread("household_power_consumption.txt", sep = ";", verbose = FALSE)[, Date := as.Date(Date, "%d/%m/%Y")][Date >= "2007-02-01" & Date <= "2007-02-02"]
    
    ##draw hist
    hist(as.numeric(houseDT$Global_active_power), xlab = "Global Active Power (kilowatts)", col = "red",main = "Global Active Power")
    
    ##create plot1 png
    dev.copy(png, file="plot1.png")
    ##close dev object
    dev.off()
}