setwd("~/Proj1")
hpc <- read.table("household_power_consumption.txt",header = TRUE, sep =";", na.strings = "?")
hpc[,1]<- as.Date(strptime(hpc[,1], "%d/%m/%Y"))
data <- subset(hpc, hpc[,1] >= '2007-02-01' & hpc[,1] <= '2007-02-02')
data[,1] <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

png(filename = "plot2.png")
with(data,plot(data$Date, data$Global_active_power, type="l", xlab="", ylab = "Global Active Power (kilowatts)" ))
dev.off()