#### Plot 2

## Step 0 Downloading the power consumption data

url.data <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url.data,
              "Power_consumption.zip")
unzip("Power_consumption.zip")

## Step 1 Reading, naming and subsetting power consumption data
power_cons <- read.table("household_power_consumption.txt",header = TRUE,sep=";")
power_cons1 <- subset(power_cons,power_cons$Date=="1/2/2007" | power_cons$Date =="2/2/2007")

## Step 2 Transfoming variable types
power_cons1$Global_active_power = as.numeric(power_cons1$Global_active_power)
power_cons1$datetime <- as.POSIXct(paste(power_cons1$Date, power_cons1$Time), format = "%d/%m/%Y %H:%M:%S")

## Step 3 Ploting the data
png("plot2.png", height = 480, width = 480)

plot(x = power_cons1$datetime
     , power_cons1$Global_active_power
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()

