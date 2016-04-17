#Load library for date conversion

library("lubridate")

#Read file, convert date, subset relevant dates to new data frame, transform data series to numeric

PC<-read.csv(unzip("C:/Users/DG/Documents/EDX/ExplorData/PowC.csv"), header=T, sep=";", stringsAsFactors = FALSE)
PC$Date<-dmy(PC$Date)
PoC<-PC[PC$Date==ymd("2007-02-01") | PC$Date==ymd("2007-02-02"),]
PoC$Sub_metering_1<-as.numeric(PoC$Sub_metering_1)
PoC$Sub_metering_2<-as.numeric(PoC$Sub_metering_2)
PoC$Sub_metering_3<-as.numeric(PoC$Sub_metering_3)

#Plot

with(PoC,plot(Sub_metering_1,type="n",xaxt="n",xlab="",ylab="Energy sub metering"))
axis(side=1,at=c(0,min(which(PoC$Date==ymd("2007-02-02"))),dim(PoC)[1]),labels=c("Thu","Fri","Sat"))
with(PoC,lines(Sub_metering_1,xaxt="n",xlab="",col="black"))
with(PoC,lines(Sub_metering_2,xaxt="n",xlab="",col="red"))
with(PoC,lines(Sub_metering_3,xaxt="n",xlab="",col="blue"))
legend("topright",pch="l",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Create PNG file

png(file = "C:/Users/DG/Documents/EDX/ExplorData/plot3.png")
with(PoC,plot(Sub_metering_1,type="n",xaxt="n",xlab="",ylab="Energy sub metering"))
axis(side=1,at=c(0,min(which(PoC$Date==ymd("2007-02-02"))),dim(PoC)[1]),labels=c("Thu","Fri","Sat"))
with(PoC,lines(Sub_metering_1,xaxt="n",xlab="",col="black"))
with(PoC,lines(Sub_metering_2,xaxt="n",xlab="",col="red"))
with(PoC,lines(Sub_metering_3,xaxt="n",xlab="",col="blue"))
legend("topright",pch="l",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
