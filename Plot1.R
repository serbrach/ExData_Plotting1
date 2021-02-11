setwd("E:/Descargas/exdata_data_household_power_consumption/")

library(dplyr)
library(lubridate)

#Read the file

HPC<-read.csv("household_power_consumption.txt",sep=";")
HPC<-HPC[HPC$Date %in%c("1/2/2007","2/2/2007"),]
str(HPC)


HPC<- HPC %>% mutate(datetime=strptime(paste(Date,Time,sep = " "),"%d/%m/%Y %H:%M:%S"))


HPC[,3:(ncol(HPC)-1)]<-lapply(HPC[,3:(ncol(HPC)-1)],as.numeric)


png("Plot1.png",width=480, height=480)

hist(HPC$Global_active_power,col = "red",xlab = "Global Active Power (kilowatts)",
    main = "Global Active Power")

dev.off()



