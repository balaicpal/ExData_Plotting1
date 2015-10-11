## This is the R code for plot1

plot1 <- function() {

    filename <- "household_power_consumption.txt"
    df <- read.table(filename, header=TRUE, sep=";",
                     colClasses=c("character", "character", rep("numeric",7)), na="?")

    # convert date and time variables to Date/Time class
    df$Time <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")
    df$Date <- as.Date(df$Date, "%d/%m/%Y")
    
    # Extract data only for date range: 2007-02-01 to 2007-02-02
    dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
    df <- subset(df, Date %in% dates)
    
    ## set PNG file    
    png("plot1.png", width=400, height=400)
    
    ## contruct the plot 
    hist(df$Global_active_power,
         main="Global Active Power",
         xlab="Global Active Power (kilowatts)",
         ylab="Frequency",
         col="red")
    
    dev.off()
}
##Test instruction:
## extract the source .txt file into working directory
## source("plot1.R")
##plot1()