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

##########
##Plot 4##
##########

png("plot4.png", width=480, height=480) 
par(mfrow = c(2, 2))  

##Plot 1 of 4
plot.ts(EPC.subSet$Global_active_power,ylab="Global Active Power (kilowatts)",
        ,cex=0.2,xlab="",axes=FALSE)
box()
axis(2)
axis(side=1, at=c(0,60*24,2*60*24), labels=c("Thu","Fri","Sat"))

##Plot 2 of 4
plot.ts(EPC.subSet$Voltage,ylab="Voltage"
        ,cex=0.2,xlab="datetime",axes=FALSE)
box()
axis(2)
axis(side=1, at=c(0,60*24,2*60*24), labels=c("Thu","Fri","Sat"))

##Plot 3 of 4
plot.ts(EPC.subSet$Sub_metering_1, type="l", ylab="Energy Submetering", xlab=""
        ,axes=FALSE) 
lines(EPC.subSet$Sub_metering_2, type="l", col="red") 
lines(EPC.subSet$Sub_metering_3, type="l", col="blue") 
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1,
       lwd=2.5, col=c("black", "red", "blue"),bty="n") 
box()
axis(2)
axis(side=1, at=c(0,60*24,2*60*24), labels=c("Thu","Fri","Sat"))
##Plot 4 of 4

plot.ts(EPC.subSet$Global_reactive_power,ylab="Global_reactive_power"
        ,cex=0.2,,xlab="datetime",axes=FALSE)
box()
axis(2)
axis(side=1, at=c(0,60*24,2*60*24), labels=c("Thu","Fri","Sat"))

dev.off() 
