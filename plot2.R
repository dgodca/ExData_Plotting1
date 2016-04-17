#Load library for date conversion

library("lubridate")

#Read file, convert date, subset relevant dates to new data frame, transform data series to numeric

PC<-read.csv(unzip("C:/Users/DG/Documents/EDX/ExplorData/PowC.csv"), header=T, sep=";", stringsAsFactors = FALSE)
PC$Date<-dmy(PC$Date)
PoC<-PC[PC$Date==ymd("2007-02-01") | PC$Date==ymd("2007-02-02"),]
PoC$GlobalActivePower<-as.numeric(PoC$Global_active_power)

#Plot 

with(PoC,plot(GlobalActivePower,type="n",xaxt="n",xlab="",ylab="Global Active Power (kilowatts)"))
axis(side=1,at=c(0,min(which(PoC$Date==ymd("2007-02-02"))),dim(PoC)[1]),labels=c("Thu","Fri","Sat"))
with(PoC,lines(GlobalActivePower,xaxt="n",xlab=""))


#Create PNG file

png(file = "C:/Users/DG/Documents/EDX/ExplorData/plot2.png")
with(PoC,plot(GlobalActivePower,type="n",xaxt="n",xlab="",ylab="Global Active Power (kilowatts)"))
axis(side=1,at=c(0,min(which(PoC$Date==ymd("2007-02-02"))),dim(PoC)[1]),labels=c("Thu","Fri","Sat"))
with(PoC,lines(GlobalActivePower,xaxt="n",xlab=""))
dev.off()
