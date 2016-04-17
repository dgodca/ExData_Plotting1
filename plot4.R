
#Load library for date conversion

library("lubridate")

#Read file, convert date, subset relevant dates to new data frame, transform data series to numeric

PC<-read.csv(unzip("C:/Users/DG/Documents/EDX/ExplorData/PowC.csv"), header=T, sep=";", stringsAsFactors = FALSE)
PC$Date<-dmy(PC$Date)
PoC<-PC[PC$Date==ymd("2007-02-01") | PC$Date==ymd("2007-02-02"),]
PoC$GlobalActivePower<-as.numeric(PoC$Global_active_power)
PoC$Voltage<-as.numeric(PoC$Voltage)
PoC$Global_reactive_power<-as.numeric(PoC$Global_reactive_power)

#Plot

par(mfcol=c(2,2))

with(PoC,plot(GlobalActivePower,type="n",xaxt="n",xlab="",ylab="Global Active Power (kilowatts)"))
axis(side=1,at=c(0,min(which(PoC$Date==ymd("2007-02-02"))),dim(PoC)[1]),labels=c("Thu","Fri","Sat"))
with(PoC,lines(GlobalActivePower,xaxt="n",xlab=""))

with(PoC,plot(Sub_metering_1,type="n",xaxt="n",xlab="",ylab="Energy sub metering"))
axis(side=1,at=c(0,min(which(PoC$Date==ymd("2007-02-02"))),dim(PoC)[1]),labels=c("Thu","Fri","Sat"))
with(PoC,lines(Sub_metering_1,xaxt="n",xlab="",col="black"))
with(PoC,lines(Sub_metering_2,xaxt="n",xlab="",col="red"))
with(PoC,lines(Sub_metering_3,xaxt="n",xlab="",col="blue"))
legend("topright",cex=0.5,pch="l",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

with(PoC,plot(Voltage,type="n",xaxt="n",xlab="datetime"))
axis(side=1,at=c(0,min(which(PoC$Date==ymd("2007-02-02"))),dim(PoC)[1]),labels=c("Thu","Fri","Sat"))
with(PoC,lines(Voltage,xaxt="n",xlab=""))

with(PoC,plot(Global_reactive_power,type="n",xaxt="n",xlab="datetime"))
axis(side=1,at=c(0,min(which(PoC$Date==ymd("2007-02-02"))),dim(PoC)[1]),labels=c("Thu","Fri","Sat"))
with(PoC,lines(Global_reactive_power,xaxt="n",xlab=""))

#Create PNG file

png(file = "C:/Users/DG/Documents/EDX/ExplorData/plot4.png")
par(mfcol=c(2,2))

with(PoC,plot(GlobalActivePower,type="n",xaxt="n",xlab="",ylab="Global Active Power (kilowatts)"))
axis(side=1,at=c(0,min(which(PoC$Date==ymd("2007-02-02"))),dim(PoC)[1]),labels=c("Thu","Fri","Sat"))
with(PoC,lines(GlobalActivePower,xaxt="n",xlab=""))

with(PoC,plot(Sub_metering_1,type="n",xaxt="n",xlab="",ylab="Energy sub metering"))
axis(side=1,at=c(0,min(which(PoC$Date==ymd("2007-02-02"))),dim(PoC)[1]),labels=c("Thu","Fri","Sat"))
with(PoC,lines(Sub_metering_1,xaxt="n",xlab="",col="black"))
with(PoC,lines(Sub_metering_2,xaxt="n",xlab="",col="red"))
with(PoC,lines(Sub_metering_3,xaxt="n",xlab="",col="blue"))
legend("topright",cex=0.5,pch="l",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

with(PoC,plot(Voltage,type="n",xaxt="n",xlab="datetime"))
axis(side=1,at=c(0,min(which(PoC$Date==ymd("2007-02-02"))),dim(PoC)[1]),labels=c("Thu","Fri","Sat"))
with(PoC,lines(Voltage,xaxt="n",xlab=""))

with(PoC,plot(Global_reactive_power,type="n",xaxt="n",xlab="datetime"))
axis(side=1,at=c(0,min(which(PoC$Date==ymd("2007-02-02"))),dim(PoC)[1]),labels=c("Thu","Fri","Sat"))
with(PoC,lines(Global_reactive_power,xaxt="n",xlab=""))
dev.off()