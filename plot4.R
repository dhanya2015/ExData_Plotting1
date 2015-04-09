setwd("C:/coursera/exploratory data analysis/ExData_Plotting1")

if (!file.exists("household_power_consumption.zip")) {
  download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                destfile="household_power_consumption.zip")
  unzip("household_power_consumption.zip")  
}

household_power_consumption <- read.table("C:/coursera/exploratory data analysis/data/household_power_consumption.txt", 
                                          skip=66637,
                                          nrows=2880,
                                          na.strings = "?",
                                          header=F,
                                          sep=";")
names(household_power_consumption) <- names(read.csv("C:/coursera/exploratory data analysis/data/household_power_consumption.txt", nrows=1,sep=";"))
household_power_consumption$DateTime <- as.POSIXct(paste(household_power_consumption$Date, household_power_consumption$Time, sep=" "), 
                                                   format="%d/%m/%Y %H:%M:%S")
png(filename="plot4.png", width=480, height=480)
par(mfcol=c(2,2))
plot(household_power_consumption$DateTime, 
     household_power_consumption$Global_active_power, 
     type="l",
     col="black", 
     xlab="", 
     ylab="Global Active Power (kilowatts)", 
     main="")

plot(household_power_consumption$DateTime, 
     household_power_consumption$Sub_metering_1, 
     type="l",
     col="black", 
     xlab="", 
     ylab="Energy sub metering", 
     main="")
lines(household_power_consumption$DateTime, household_power_consumption$Sub_metering_2, col="red")
lines(household_power_consumption$DateTime, household_power_consumption$Sub_metering_3, col="blue")
legend("topright", 
       lwd=1, 
       lty=1, 
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(household_power_consumption$DateTime, 
     household_power_consumption$Voltage, 
     type="l",
     col="black", 
     xlab="datetime", 
     ylab="Voltage", 
     main="")

plot(household_power_consumption$DateTime, 
     household_power_consumption$Global_reactive_power, 
     type="l",
     col="black", 
     xlab="datetime", 
     ylab="Global_reactive_power", 
     main="")

dev.off()