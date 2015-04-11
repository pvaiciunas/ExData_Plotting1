rawdata <- read.table("./household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   na.strings = "?",
                   comment.char = "")

rawdata$Date <- as.Date(strptime(rawdata$Date, "%d/%m/%Y"))
data <- rawdata[rawdata$Date == "2007-02-01" | rawdata$Date == "2007-02-02",]

png(file = "plot3.png", width = 480, height = 480)


plot(data$Sub_metering_1, 
     type = "l", 
     ylab = "Energy sub metering", 
     xlab = "",
     xaxt = "n")
axis(1, labels = c("Thu","Fri","Sat"), at = c(0,nrow(data)/2, nrow(data)))
lines(data$Sub_metering_2, type = "l", col = "red")
lines(data$Sub_metering_3, type = "l", col = "blue")
legend("topright", 
       c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), 
       lty = 1, 
       col = c("black","red","blue"))



dev.off()
