# Set working directory
#setwd("./Data_Science_Coursera/Scripts/4_ExpData")
# Load data
data<-read.table(file="household_power_consumption.txt",header=TRUE,sep=";")

#Plot 2
Sys.setlocale("LC_TIME", "English")
# Open png device
png("plot2.png", width = 480, height = 480)
# Subset relevant dates
data_01<-subset(data,Date=="1/2/2007")
data_02<-subset(data,Date=="2/2/2007")
# Merge subset datasets
data2<-rbind(data_01,data_02)
# Preparing data forplotting
date<-paste(data2$Date,data2$Time)
date2<-strptime(date,format="%d/%m/%Y %H:%M:%S")
y<-as.numeric(as.character(data2$Global_active_power))

#Plot
plot(date2,y,ylab="Global Active Power (kilowatts)",xlab="",type="l")
dev.off()