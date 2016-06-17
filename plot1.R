## Data : .	Dataset: Electric power consumption [20Mb


household_power_data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors=FALSE)
data_for_analysis <- subset(household_power_data, (Date == "1/2/2007") |(Date == "2/2/2007") )

## Plot 01
dim(data_for_analysis)
head(data_for_analysis)
tail(data_for_analysis)
str(data_for_analysis)
png(filename = "plot1.png", width = 480, height = 480)
hist(as.numeric(data_for_analysis$Global_active_power), breaks = 16, col = "red", xlab = "Global Active Power (Kilowatts)", main = "Global Active Power")
dev.off()