setwd("E:/Descargas/exdata_data_household_power_consumption/")

library(dplyr)
library(lubridate)
library(ggplot2)

#Read the file

HPC<-read.csv("household_power_consumption.txt",sep=";")
HPC<-HPC[HPC$Date %in%c("1/2/2007","2/2/2007"),]
str(HPC)


HPC<- HPC %>% mutate(datetime=strptime(paste(Date,Time,sep = " "),"%d/%m/%Y %H:%M:%S"))


HPC[,3:(ncol(HPC)-1)]<-lapply(HPC[,3:(ncol(HPC)-1)],as.numeric)


png("Plot2.png",width=480, height=480)

plot(HPC$datetime,HPC$Global_active_power,ylab = "Global Active Power (kilowatts)",type = "l",xlab="")


dev.off()



