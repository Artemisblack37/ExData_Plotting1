require(sqldf)
mydata <- read.csv.sql( file='household_power_consumption.txt',
                        sep=";",
                        sql="select * from file where Date = '1/2/2007' or Date = '2/2/2007'",
                        header=TRUE)
#Make a subset with just the dates and times
DT <- paste(mydata$Date,mydata$Time)
#convert the time to a useable format
FinalDT <- as.POSIXct(strptime(DT, "%d/%m/%Y %H:%M:%S"))
#make graph 2
plot(mydata$Sub_metering_1~FinalDT, ylab = "Energy sub metering", xlab = "", type = "l")
lines(mydata$Sub_metering_2~FinalDT, type="l", col="red")
lines(mydata$Sub_metering_3~FinalDT, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black","red","blue"),cex=0.75,lty="solid")
dev.copy(png, file="plot3.png",width=480,height=480)
dev.off()
