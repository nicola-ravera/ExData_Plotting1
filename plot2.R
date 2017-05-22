Sys.setlocale("LC_ALL","English")

#import 
library (sqldf)
library(datasets)

# read data source
datasource <- "../household_power_consumption.txt"
data <- read.csv.sql(datasource,sep=";",sql="select * from file where Date in ('1/2/2007','2/2/2007')")

# open png connection
png(file="plot2.png", width = 480, height = 480)

plot(as.POSIXct(paste(data$Date,DF$Time),format="%d/%m/%Y %H:%M:%S"),data$Global_active_power, 
      type="o", pch=".", xlab="", ylab="Global Active Power (kilowatts)")

#save png file
dev.off()