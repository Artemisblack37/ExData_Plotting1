#Load the required data
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
plot(mydata$Global_active_power~FinalDT, ylab = "Global Active Power (kilowatts)", xlab = "", type = "l")
dev.copy(png, file="plot2.png",width=480,height=480)
dev.off()
