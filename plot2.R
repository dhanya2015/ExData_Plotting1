setwd("C:/coursera/exploratory data analysis")

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
png(filename="plot2.png", width=480, height=480)
plot(household_power_consumption$DateTime, 
     household_power_consumption$Global_active_power, 
     type="l",
     col="black", 
     xlab="", 
     ylab="Global Active Power (kilowatts)", 
     main="")
dev.off()