## Data : .	Dataset: Electric power consumption [20Mb


household_power_data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors=FALSE)
data_for_analysis <- subset(household_power_data, (Date == "1/2/2007") |(Date == "2/2/2007") )


dim(data_for_analysis)
head(data_for_analysis)
tail(data_for_analysis)
str(data_for_analysis)

Date_Time <- strptime(paste(data_for_analysis$Date, data_for_analysis$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
png(filename = "plot2.png", width = 480, height = 480)
with(data_for_analysis, plot(Date_Time, as.numeric(Global_active_power), type = "l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()