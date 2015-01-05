#Load the required data
require(sqldf)
mydata <- read.csv.sql( file='household_power_consumption.txt',
                      sep=";",
                      sql="select * from file where Date = '1/2/2007' or Date = '2/2/2007'",
                      header=TRUE)
#make graph 1
hist(mydata$Global_active_power, main = "Global Active Power", col = "red", xlim = c(0,6), ylim= c(0,1200), xlab = "global active power(kilowatt)", ylab = "Frequency")
dev.copy(png, file="plot1.png",width=480,height=480)
dev.off()
