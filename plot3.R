setwd("~/Proj1")
hpc <- read.table("household_power_consumption.txt",header = TRUE, sep =";", na.strings = "?")
hpc[,1]<- as.Date(strptime(hpc[,1], "%d/%m/%Y"))
data <- subset(hpc, hpc[,1] >= '2007-02-01' & hpc[,1] <= '2007-02-02')
data[,1] <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")



png(filename = "plot3.png")
with(data,plot(data$Date,data$Sub_metering_1, type="l", xlab="", ylab = "Energy sub metering"))
with(data,lines(data$Date,data$Sub_metering_2,col="red"))
with(data,lines(data$Date,data$Sub_metering_3,col="blue"))
with(data,legend("topright", col=c("black", "red", "blue"),lty=c(1,1,1), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")))
dev.off()