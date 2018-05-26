thj<-read.csv2("household_power_consumption.txt")
date<-as.character(thj$Date)
time<-as.character(thj$Time)
thj$Date<-as.Date(thj$Date,"%d/%m/%Y")
req<-paste(date,time)
library(lubridate)
req<-dmy_hms(req)
a<-"2007-02-01"
a<-as.Date(a)
b<-"2007-02-02"
b<-as.Date(b)
logic<-a<=thj$Date&b>=thj$Date
table(logic)
thj<-thj[logic,]
req<-req[logic]
png("plot4.png")
par(mfrow = c(2,2))
globalpower<-as.numeric(as.character(thj$Global_active_power))
globalpower<-globalpower
plot(req,globalpower, type = "l", xlab = " ", ylab = "Global Active Power")
voltage<-as.numeric(as.character(thj$Voltage))
plot(req,voltage, type = "l", ylab = "Voltage", xlab = "datetime")
submetering1<-as.numeric(as.character(thj$Sub_metering_1))
submetering2<-as.numeric(as.character(thj$Sub_metering_2))
submetering3<-as.numeric(as.character(thj$Sub_metering_3))
plot(req,submetering1, type = "n", xlab = " ", ylab = "Energy Sub metering")
lines(req, submetering1, col = "black", type = "l")
lines(req, submetering2, col = "red", type = "l")
lines(req, submetering3, col = "blue", type = "l")
legend("topright", lty = 1, lwd = 1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.7)
globalreac<-as.numeric(as.character(thj$Global_reactive_power))
plot(req,globalreac, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
dev.off()

