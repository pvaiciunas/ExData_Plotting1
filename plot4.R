rawdata <- read.table("./household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   na.strings = "?",
                   comment.char = "")

rawdata$Date <- as.Date(strptime(rawdata$Date, "%d/%m/%Y"))
data <- rawdata[rawdata$Date == "2007-02-01" | rawdata$Date == "2007-02-02",]

png(file = "plot4.png", width = 480, height = 480)


par(mfrow = c(2,2))

# plot top left
plot(data$Global_active_power, 
     type = "l",
     ylab = "Global Active Power",
     xlab = "",
     xaxt = "n")
axis(1, labels = c("Thu","Fri","Sat"), at = c(0,nrow(data)/2, nrow(data)))

# plot top right
plot(data$Voltage, 
     type = "l",
     ylab = "Voltage",
     xlab = "datetime",
     xaxt = "n")
axis(1, labels = c("Thu","Fri","Sat"), at = c(0,nrow(data)/2, nrow(data)))

# plot bottomr left
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
       col = c("black","red","blue"),
       box.col = "white",
       inset = 0.01
       )


# plot bottom right
plot(data$Global_reactive_power, 
     type = "l",
     ylab = "Global_reactive_power",
     xlab = "datetime",
     xaxt = "n")
axis(1, labels = c("Thu","Fri","Sat"), at = c(0,nrow(data)/2, nrow(data)))


dev.off()
