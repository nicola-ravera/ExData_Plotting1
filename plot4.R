Sys.setlocale("LC_ALL","English")

#import
library (sqldf)
library(datasets)

# read data source
datasource <- "../household_power_consumption.txt"
data <- read.csv.sql(datasource,sep=";",sql="select * from file where Date in ('1/2/2007','2/2/2007')")

# convert dates to DateTime
dates <- as.POSIXct(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")

# open png connection
png(file="plot4.png", width = 480, height = 480)

# plot parameters
par(mfcol = c(2,2))

# plot gap
plot(dates,data$Global_active_power, type="o", pch=".", xlab="", ylab="Global Active Power (kilowatts)")

# plot esm
plot(dates,data$Sub_metering_1, type="o", pch=".", xlab="", ylab="Energy sub metering")
lines(dates,data$Sub_metering_2, type="o", pch=".", col="red")
lines(dates,data$Sub_metering_3, type="o", pch=".", col="blue")
legend("topright",pch="-", col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

# plot voltage
plot(dates,data$Voltage, type="o", pch=".", xlab="datetime", ylab="Voltage")

# plot grp
plot(dates,data$Global_reactive_power, type="o", pch=".", xlab="datetime", ylab="Global_reactive_power")

#save png
dev.off()