# Script for reading in household power data from UC Irvine Machine Learning Repository.  And then plotting a 
# histogram of the Global Active Power for Feb 1 and Feb 2 of 2007.  Plot saved in plot1.png

#Read in the consumption data
hpower<-read.table("household_power_consumption.txt",header = T, sep=";", stringsAsFactors = F, na.strings="?")

#Extract the data for the two days
hpower_2days <- subset(hpower, Date=="1/2/2007" | Date=="2/2/2007")

#Select the png file device
png("plot1.png")

#Plot histogram
hist(hpower_2days$Global_active_power, col="red", main="Global Active Power", xlab = "Global Active Power (kilowatts)")

#shut down png device
dev.off()