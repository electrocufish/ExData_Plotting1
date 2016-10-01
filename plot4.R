filename <- "household_power_consumption.txt"

header <- read.table(filename, header = F, sep = ";", nrows = 1, stringsAsFactors = F)
mydata <- read.table(filename, skip = 66637, header = FALSE, sep =';', nrows = 2880)
colnames(mydata) <- unlist(header)

mydata$datetime <- do.call(paste, c(mydata[c("Date", "Time")], sep = " ")) 
mydata$datetime <- strptime(mydata$datetime, format="%d/%m/%Y %T")
attr(mydata$datetime, "tzone") <- "America/Los_Angeles"

png(filename = "plot4.png")

par(mfrow=c(2,2))

plot(mydata$datetime, mydata$Global_active_power, type="l",col="black", ylab = "Global Active Power (kilowatts)", xlab = "")

plot(mydata$datetime, mydata$Voltage, type="l",col="black", ylab = "Voltage", xlab = "datetime")

plot(mydata$datetime, mydata$Sub_metering_1, type="l",col="black", ylim=range(mydata$Sub_metering_1), ylab = "Energy sub metering", xlab = "")
par(new=T)
plot(mydata$datetime, mydata$Sub_metering_2, type="l",col="red", ylim=range(mydata$Sub_metering_1), ylab = "", xlab = "", xaxt= 'n', yaxt = 'n')
par(new=T)
plot(mydata$datetime, mydata$Sub_metering_3, type="l",col="blue", ylim=range(mydata$Sub_metering_1), ylab = "", xlab = "", xaxt= 'n', yaxt = 'n')
legend('topright', c(names(mydata)[7:9]), lty=1, col=c('black', 'red', 'blue'), bty ="n")

plot(mydata$datetime, mydata$Global_reactive_power, type="l",col="black", ylab = "Global_reactive_power", xlab = "datetime")

dev.off()