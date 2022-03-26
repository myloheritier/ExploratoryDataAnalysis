#### Plot 1

## Step 0 Downloading the power consumption data

url.data <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url.data,
              "Power_consumption.zip")
unzip("Power_consumption.zip")

## Step 1 Reading, naming and subsetting power consumption data
power_cons <- read.table("household_power_consumption.txt",header = TRUE,sep=";")
power_cons1 <- subset(power_cons,power_cons$Date=="1/2/2007" | power_cons$Date =="2/2/2007")

## Transfoming variable types
power_cons1$Global_active_power = as.numeric(power_cons1$Global_active_power)

## Step 2 Calling the plot function
png("plot1.png", height = 480, width = 480)
hist(power_cons1$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)", ylab = "Frequency")
dev.off()
