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
png(filename = "plot2.png", width = 480, height = 480, units = "px", bg= "white")
plot(DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
graphics.off()