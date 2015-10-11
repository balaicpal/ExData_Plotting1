## This is the R code for plot3

plot3 <- function() {

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
  
  png("plot3.png", width=400, height=400)
  
  ## contruct the plot 
  plot(df$Time, df$Sub_metering_1, type="l", col="black",
         xlab="", ylab="Energy sub metering")
  lines(df$Time, df$Sub_metering_2, col="red")
  lines(df$Time, df$Sub_metering_3, col="blue")
  legend("topright",
           col=c("black", "red", "blue"),
           c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           lty=1)

  dev.off()
}
##Test instruction:
## extract the source .txt file into working directory
## source("plot3.R")
##plot3()
