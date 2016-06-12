## Data : .	Dataset: Electric power consumption [20Mb


household_power_data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors=FALSE)
data_for_analysis <- subset(household_power_data, (Date == "1/2/2007") |(Date == "2/2/2007") )

dim(data_for_analysis)
head(data_for_analysis)
tail(data_for_analysis)
str(data_for_analysis)

Date_Time <- strptime(paste(data_for_analysis$Date, data_for_analysis$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
png(filename = "plot4.png", width = 480, height = 480)

par(mfcol = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0), cex = 0.7)

# plot(1,1)
new_Time <- c(as.numeric(data_for_analysis$Time[1:1440]), as.numeric(data_for_analysis$Time[1440])+as.numeric(data_for_analysis$Time[1441:2880]))
with(data_for_analysis, plot(Date_Time, as.numeric(Global_active_power)/500, type = "l", xlab = "", ylab = "Global_active_power"))


# plot(2, 1)
with(data_for_analysis, plot(Date_Time, as.numeric(Sub_metering_1), type = "l", col = "black", ylab = "Energy sub metering", xlab = ""))
with(data_for_analysis, points(Date_Time, as.numeric(Sub_metering_2), type = "l", col = "red"))
with(data_for_analysis, points(Date_Time, as.numeric(Sub_metering_3), type = "l", col = "blue"))
legend("topright", lwd = 1, lty = c(1, 1, 1), col = c("black","red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))


# plot(1,2)
with(data_for_analysis, plot(Date_Time, as.numeric(Voltage)/500, type = "l", xlab = "datetime", ylab = "Voltage"))


#plot(2, 2)
with(data_for_analysis, plot(Date_Time, as.numeric(Global_reactive_power)/500, type = "l", xlab = "datetime", ylab = "Global_reactive_power"))


dev.off()

