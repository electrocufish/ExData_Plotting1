filename <- "household_power_consumption.txt"

header <- read.table(filename, header = F, sep = ";", nrows = 1, stringsAsFactors = F)
mydata <- read.table(filename, skip = 66637, header = FALSE, sep =';', nrows = 2880)
colnames(mydata) <- unlist(header)

mydata$datetime <- do.call(paste, c(mydata[c("Date", "Time")], sep = " ")) 
mydata$datetime <- strptime(mydata$datetime, format="%d/%m/%Y %T")
attr(mydata$datetime, "tzone") <- "America/Los_Angeles"

png(filename = "plot2.png")

plot(mydata$datetime, mydata$Global_active_power, type="l",col="black", ylab = "Global Active Power (kilowatts)", xlab = "")

dev.off()