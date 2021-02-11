setwd("E:/Descargas/exdata_data_household_power_consumption/")

library(dplyr)
library(lubridate)

#Read the file

HPC<-read.csv("household_power_consumption.txt",sep=";")
HPC<-HPC[HPC$Date %in%c("1/2/2007","2/2/2007"),]
str(HPC)


HPC<- HPC %>% mutate(datetime=strptime(paste(Date,Time,sep = " "),"%d/%m/%Y %H:%M:%S"))


HPC[,3:(ncol(HPC)-1)]<-lapply(HPC[,3:(ncol(HPC)-1)],as.numeric)


png("Plot4.png",width=480, height=480)

par(mfrow=c(2,2))
plot(HPC$datetime,HPC$Global_active_power,ylab = "Global Active Power (kilowatts)",type = "l",xlab="")
plot(HPC$datetime,HPC$Voltage,ylab = "Voltage",type = "l",xlab="datetime")
plot(HPC$datetime,HPC$Sub_metering_1,ylab = "Energy sub-metering",type = "l",xlab="")
lines(HPC$datetime,HPC$Sub_metering_2,col="red",ylab = "Energy sub-metering",type = "l",xlab="")
lines(HPC$datetime,HPC$Sub_metering_3,col="blue",ylab = "Energy sub-metering",type = "l",xlab="")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1,col=c("black","red","blue"))
plot(HPC$datetime,HPC$Global_reactive_power,type = "l",xlab="datetime")

dev.off()

