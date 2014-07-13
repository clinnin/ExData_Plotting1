setwd("~/Proj1")
hpc <- read.table("household_power_consumption.txt",header = TRUE, sep =";", na.strings = "?")
hpc[,1]<- as.Date(strptime(hpc[,1], "%d/%m/%Y"))
data <- subset(hpc, hpc[,1] >= '2007-02-01' & hpc[,1] <= '2007-02-02')
data[,1] <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")



png(filename = "plot4.png")

par(mfrow = c(2,2))
with(data, {
#plotA

plot(data$Date, data$Global_active_power, type="l", xlab="", ylab = "Global Active Power" )

#plotB
plot(data$Date, data$Voltage, type="l", xlab="datetime", ylab = "Voltage" )


#plotC
plot(data$Date,data$Sub_metering_1, type="l", xlab="", ylab = "Energy sub metering")
lines(data$Date,data$Sub_metering_2,col="red")
lines(data$Date,data$Sub_metering_3,col="blue")
legend("topright", col=c("black", "red", "blue"),lty=c(1,1,1), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       box.lwd = 0, box.col = "white", inset = c(0.01, 0.01))


#plotD
plot(data$Date, data$Global_reactive_power, type="l", xlab="datetime", ylab = "Global_reactive_power" )

}
)

dev.off()