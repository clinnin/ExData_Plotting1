setwd("~/Proj1")
hpc <- read.table("household_power_consumption.txt",header = TRUE, sep =";", na.strings = "?")
hpc[,1]<- as.Date(strptime(hpc[,1], "%d/%m/%Y"))
data <- subset(hpc, hpc[,1] >= '2007-02-01' & hpc[,1] <= '2007-02-02')


png(filename = "plot1.png")
with(data,hist(data$Global_active_power, col="red", main = "Global Active Power", xlab= "Global Active Power (kilowatts)"))
dev.off()