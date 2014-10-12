#=====================================================================
#Subrutine: plot3.R
#Author: IR
#Date: 12/10/2014
#Revision: 0
#Notes: This script assumes you have the relevant data downloaded 
# in your local drive
# For further information about the purpose of the code,
# please check the README.md
#====================================================================

# Set working directory
#setwd("./Data_Science_Coursera/Scripts/4_ExpData")
# Load data
data<-read.table(file="household_power_consumption.txt",header=TRUE,sep=";")

#Plot 3
Sys.setlocale("LC_TIME", "English")
# Open png device
png("plot3.png", width = 480, height = 480)
# Subset relevant dates
data_01<-subset(data,Date=="1/2/2007")
data_02<-subset(data,Date=="2/2/2007")
# Merge subset datasets
data2<-rbind(data_01,data_02)
# Preparing data forplotting
date<-paste(data2$Date,data2$Time)
date2<-strptime(date,format="%d/%m/%Y %H:%M:%S")
y1<-as.numeric(as.character(data2$Sub_metering_1))
y2<-as.numeric(as.character(data2$Sub_metering_2))
y3<-as.numeric(as.character(data2$Sub_metering_3))
#Plot
plot(date2,y1,ylab="Energy sub metering",xlab="",type="l",col="black")
lines(date2,y2,ylab="Energy sub metering",xlab="",type="l",col="red")
lines(date2,y3,ylab="Energy sub metering",xlab="",type="l",col="blue")
legend("topright", lty=1,col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.off()
