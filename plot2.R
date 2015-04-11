rawdata <- read.table("./household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   na.strings = "?",
                   comment.char = "")

rawdata$Date <- as.Date(strptime(rawdata$Date, "%d/%m/%Y"))
data <- rawdata[rawdata$Date == "2007-02-01" | rawdata$Date == "2007-02-02",]

png(file = "plot2.png", width = 480, height = 480)


plot(data$Global_active_power, 
     type = "l", 
     ylab = "Global Active Power (kilowatts)", 
     xlab = "",
     xaxt = "n")
axis(1, labels = c("Thu","Fri","Sat"), at = c(0,nrow(data)/2, nrow(data)))


dev.off()
