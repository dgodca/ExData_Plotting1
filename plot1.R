#Load library for date conversion

library("lubridate")

#Read file, convert date, subset relevant dates to new data frame, transform data series to numeric

PC<-read.csv(unzip("C:/Users/DG/Documents/EDX/ExplorData/PowC.csv"), header=T, sep=";", stringsAsFactors = FALSE)
PC$Date<-dmy(PC$Date)
PoC<-PC[PC$Date==ymd("2007-02-01") | PC$Date==ymd("2007-02-02"),]
PoC$GlobalActivePower<-as.numeric(PoC$Global_active_power)

#Plot

with(PoC,hist(GlobalActivePower,col="red",xlab="Global Active Power (kilowatts)"))

#Create PNG file

png(file = "C:/Users/DG/Documents/EDX/ExplorData/plot1.png")
with(PoC,hist(GlobalActivePower,col="red",xlab="Global Active Power (kilowatts)"))
dev.off()
