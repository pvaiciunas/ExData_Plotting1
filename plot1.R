rawdata <- read.table("./household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   na.strings = "?",
                   comment.char = "")

rawdata$Date <- as.Date(strptime(rawdata$Date, "%d/%m/%Y"))
data <- rawdata[rawdata$Date == "2007-02-01" | rawdata$Date == "2007-02-02",]

png(file = "plot1.png", width = 480, height = 480)

hist(data$Global_active_power, 
     col = "red1",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",
     ylim = c(1,1200))

dev.off()
