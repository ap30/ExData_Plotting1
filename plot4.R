# Script for reading in household power data from UC Irvine Machine Learning Repository.  And then plotting 
# 4 charts
#   1) Global Active Power by time
#   2) Voltage by time
#   3) Energy sub metering by time
#   4) Global Reactive Power by time
# plot saves in "plot4.png"

#Read in the consumption data
hpower<-read.table("household_power_consumption.txt",header = T, sep=";", stringsAsFactors = F, na.strings="?")

#Extract the data for the two days
hpower_2days <- subset(hpower, Date=="1/2/2007" | Date=="2/2/2007")

#Format the time
datetime <- strptime(paste(hpower_2days$Date,hpower_2days$Time),format = "%d/%m/%Y %H:%M:%S")

#Select the png file device
png("plot4.png")

par(mfrow=c(2,2))

#plot first chart
plot(datetime, hpower_2days$Global_active_power, type ="l", xlab="", ylab = "Global Active Power (kilowatts)")

#plot second chart
plot(datetime,hpower_2days$Voltage, type="l", ylab="Voltage")

#Plot third chart
plot(datetime,hpower_2days$Sub_metering_1, xlab="", ylab="Energy sub metering", type="n")
lines(datetime,hpower_2days$Sub_metering_1,type="l")
lines(datetime,hpower_2days$Sub_metering_2,col="red",type="l")
lines(datetime,hpower_2days$Sub_metering_3,col="blue",type="l")
legend("topright",col = c("black","red","blue"), bty="n", lty=c(1,1,1), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#plot fourth chart
plot(datetime, hpower_2days$Global_reactive_power, type="l", ylab= "Global_reactive_power")

#shut down png device
dev.off()