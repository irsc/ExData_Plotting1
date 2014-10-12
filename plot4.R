#=====================================================================
#Subrutine: plot4.R
#Author: IR
#Date: 12/10/2014
#Revision: 0
#Notes: This script assumes you have the relevant data downloaded 
# in your local drive
# For further information about the purpose of the code,
# please check the README.md
#====================================================================
#

# Set working directory
#setwd("./Data_Science_Coursera/Scripts/4_ExpData")
# Load data
data<-read.table(file="household_power_consumption.txt",header=TRUE,sep=";")


#Plot 4
Sys.setlocale("LC_TIME", "English")
# Open png device
png("plot4.png", width = 480, height = 480)
# Subset relevant dates
data_01<-subset(data,Date=="1/2/2007")
data_02<-subset(data,Date=="2/2/2007")
# Merge subset datasets
data2<-rbind(data_01,data_02)
# Preparing data forplotting
date<-paste(data2$Date,data2$Time)
date2<-strptime(date,format="%d/%m/%Y %H:%M:%S")
# Set plot "grid"
par(mfrow=c(2,2))

# Plot (1,1)
gap<-as.numeric(as.character(data2$Global_active_power))
plot(date2,gap,ylab="Global Active Power",xlab="",type="l")

#Plot (1,2)
volt<-as.numeric(as.character(data2$Voltage))
plot(date2,volt,ylab="Voltage",xlab="datetime",type="l")

#Plot (2,1)
sub1<-as.numeric(as.character(data2$Sub_metering_1))
sub2<-as.numeric(as.character(data2$Sub_metering_2))
sub3<-as.numeric(as.character(data2$Sub_metering_3))
#
plot(date2,sub1,ylab="Energy sub metering",xlab="",type="l",col="black")
lines(date2,sub2,ylab="Energy sub metering",xlab="",type="l",col="red")
lines(date2,sub3,ylab="Energy sub metering",xlab="",type="l",col="blue")
legend("topright", box.lty=0,lty=1,col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))


#Plot (2,2)
volt<-as.numeric(as.character(data2$Global_reactive_power))
plot(date2,volt,ylab="Global_reactive_power",xlab="datetime",type="l")

#Close device
dev.off()
