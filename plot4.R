workfile <- "./household_power_consumption.txt"
filereader <- read.table(workfile, header = TRUE, sep = ";", colClasses = c("character", "character", rep("numeric",7)), na = "?")
#to directly work on dataset, I'm using attach()
attach(filereader)
data_to_plot <- Date == "1/2/2007" | Date == "2/2/2007"
#subset only data of two dates from whole dataset
data_plot <- filereader[data_to_plot, ]
#only data needed to plot Global Active Power is attached
attach(data_plot)
rm(filereader) #saves space
var1 <- paste(Date, Time)
data_plot$DateTime <- strptime(var1, "%d/%m/%Y %H:%M:%S")
rownames(data_plot) <- 1:nrow(data_plot)
png(filename = "plot4_1.png", width = 480, height = 480, units = "px", bg= "white")
par(mfrow = c(2, 2))
plot(DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
plot(DateTime, Sub_metering_1, type = "l", col = "dark blue", xlab = "", ylab = "Energy sub metering")
lines(DateTime, Sub_metering_2, col = "dark red")
lines(DateTime, Sub_metering_3, col = "dark green")
legend("topright", 
       bty = "n",
       col = c("dark blue", "dark red", "dark green"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = 1)
plot(DateTime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(DateTime, Global_reactive_power, type = "l", col = " dark red ", xlab = "datetime", ylab = colnames(data_plot)[4])
graphics.off()