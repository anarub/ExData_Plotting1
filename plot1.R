#############
##Load Data##
#############
#This section is repeated for each plot.

EPC<-read.table("Y:/DataScience/EDA/household_power_consumption.txt",sep=";",header = T,
                stringsAsFactor=FALSE, dec=".")
#Create subset of required data
EPC.subSet <- EPC[EPC$Date %in% c("1/2/2007","2/2/2007") ,] 
#remove large data set
rm(EPC)

#create date variable

EPC.subSet$Date <- as.Date(EPC.subSet$Date, "%d/%m/%Y")
EPC.subSet$Global_active_power<-as.numeric(EPC.subSet$Global_active_power)
EPC.subSet$Global_reactive_power<-as.numeric(EPC.subSet$Global_reactive_power)
EPC.subSet$Sub_metering_1<-as.numeric(EPC.subSet$Sub_metering_1)
EPC.subSet$Sub_metering_2<-as.numeric(EPC.subSet$Sub_metering_2)
EPC.subSet$Sub_metering_3<-as.numeric(EPC.subSet$Sub_metering_3)
EPC.subSet$Voltage<-as.numeric(EPC.subSet$Voltage)
par(mfrow = c(1, 1)) 
##########
##Plot 1##
##########

png("plot1.png", width=480, height=480) 
hist(gap,xlab="Global Active Power (kilowatts)",main="Global Active Power",
     ylab="Frequency",col="red")
dev.off()    
