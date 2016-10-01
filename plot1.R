filename <- "household_power_consumption.txt"

header <- read.table(filename, header = F, sep = ";", nrows = 1, stringsAsFactors = F)
mydata <- read.table(filename, skip = 66637, header = FALSE, sep =';', nrows = 2880)
colnames(mydata) <- unlist(header)

png(filename = "plot1.png")

hist(mydata$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")

dev.off()