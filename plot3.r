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
submetering1<-as.numeric(as.character(thj$Sub_metering_1))
submetering2<-as.numeric(as.character(thj$Sub_metering_2))
submetering3<-as.numeric(as.character(thj$Sub_metering_3))
png("plot3.png")
plot(req,submetering1, type = "n", xlab = " ", ylab = "Energy Sub metering")
lines(req, submetering1, col = "black", type = "l")
lines(req, submetering2, col = "red", type = "l")
lines(req, submetering3, col = "blue", type = "l")
legend("topright", lty = 1, lwd = 1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.7)
dev.off()