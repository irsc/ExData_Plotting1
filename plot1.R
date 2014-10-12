# Set working directory
#setwd("./Data_Science_Coursera/Scripts/4_ExpData")
# Load data
data<-read.table(file="household_power_consumption.txt",header=TRUE,sep=";")


#Plot 1
# Open png device
png("plot1.png", width = 480, height = 480)
# Subset relevant dates
data_01<-subset(data,Date=="1/2/2007")
data_02<-subset(data,Date=="2/2/2007")
# Merge subset datasets
data2<-rbind(data_01,data_02)
#Plot
hist(as.numeric(as.character(data2$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)",yaxp=c(0,1200,6))
dev.off()
