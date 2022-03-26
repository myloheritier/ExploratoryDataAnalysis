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
power_cons1$Time <- as.
power_cons1$datetime <- as.POSIXct(paste(power_cons1$Date, power_cons1$Time), format = "%d/%m/%Y %H:%M:%S")

##
png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))

# Plot 1
plot(power_cons1$datetime , power_cons1$Global_active_power, type="l", xlab="", ylab="Global Active Power")

# Plot 2
plot(power_cons1$datetime ,as.numeric(power_cons1$Voltage), type="l", xlab="datetime", ylab="Voltage")

# Plot 3
plot(power_cons1$datetime , as.numeric(power_cons1$Sub_metering_1), type="l", xlab="", ylab="Energy sub metering")
lines(power_cons1$datetime , as.numeric(power_cons1$Sub_metering_2), col="red")
lines(power_cons1$datetime , as.numeric(power_cons1$Sub_metering_3),col="blue")
legend("topright", col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       , lty=c(1,1)
       , bty="n"
       , cex=.5) 

# Plot 4
plot(power_cons1$datetime , as.numeric(power_cons1$Global_reactive_power), type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
