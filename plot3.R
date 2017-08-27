# Script for reading in household power data from UC Irvine Machine Learning Repository.  And then plotting 
# Energy sub metering for Feb first and second by time of day.  Plot stored in "plot3.png"

#Read in the consumption data
hpower<-read.table("household_power_consumption.txt",header = T, sep=";", stringsAsFactors = F, na.strings="?")

#Extract the data for the two days
hpower_2days <- subset(hpower, Date=="1/2/2007" | Date=="2/2/2007")

#Format the time
ast <- strptime(paste(hpower_2days$Date,hpower_2days$Time),format = "%d/%m/%Y %H:%M:%S")

#Select the png file device
png("plot3.png")

#Plot the chart
plot(ast,hpower_2days$Sub_metering_1, xlab="", ylab="Energy sub metering", type="n")
lines(ast,hpower_2days$Sub_metering_1,type="l")
lines(ast,hpower_2days$Sub_metering_2,col="red",type="l")
lines(ast,hpower_2days$Sub_metering_3,col="blue",type="l")
legend("topright",col = c("black","red","blue"), lty=c(1,1,1), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#shut down png device
dev.off()