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
household_power_consumption$Date <- as.Date(household_power_consumption$Date, format="%d/%m/%y")
household_power_consumption$Time <- strptime(household_power_consumption$Time, format="%H:%M:%S")

png(filename="plot1.png", width=480, height=480)
hist(household_power_consumption$Global_active_power, 
     col="#ff2500", 
     xlab="Global Active Power (kilowatts)", 
     main="Global Active Power")
dev.off()