require(sqldf)
mydata <- read.csv.sql( file='household_power_consumption.txt',
                        sep=";",
                        sql="select * from file where Date = '1/2/2007' or Date = '2/2/2007'",
                        header=TRUE)
#Make a subset with just the dates and times
DT <- paste(mydata$Date,mydata$Time)
#convert the time to a useable format
FinalDT <- as.POSIXct(strptime(DT, "%d/%m/%Y %H:%M:%S"))
par(mfcol=c(2,2))
#Plot1
plot(mydata$Global_active_power~FinalDT, ylab = "Global Active Power (kilowatts)", xlab = "", type = "l")
#Plot2
plot(mydata$Sub_metering_1~FinalDT, ylab = "Energy sub metering", xlab = "", type = "l")
lines(mydata$Sub_metering_2~FinalDT, type="l", col="red")
lines(mydata$Sub_metering_3~FinalDT, type="l", col="blue")
#Plot3
plot(mydata$Voltage~FinalDT, ylab = "Voltage", xlab = "datetime",type = "l")
#Plot4
plot(mydata$Global_reactive_power~FinalDT, ylab = "Global_reactive_power", xlab = "datetime", type = "l")
#save to png
dev.copy(png, file="plot4.png",width=480,height=480)
dev.off()