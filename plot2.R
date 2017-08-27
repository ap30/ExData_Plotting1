# Script for reading in household power data from UC Irvine Machine Learning Repository.  And then plotting 
# Global Active Power for Feb first and second by time of day.  Plot stored in "plot2.png"

#Read in the consumption data
hpower<-read.table("household_power_consumption.txt",header = T, sep=";", stringsAsFactors = F, na.strings="?")

#Extract the data for the two days
hpower_2days <- subset(hpower, Date=="1/2/2007" | Date=="2/2/2007")

#Format the time
ast <- strptime(paste(hpower_2days$Date,hpower_2days$Time),format = "%d/%m/%Y %H:%M:%S")

#Select the png file device
png("plot2.png")

#Plot the chart
plot(ast,hpower_2days$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="n")
lines(ast,hpower_2days$Global_active_power)

#shut down png device
dev.off()