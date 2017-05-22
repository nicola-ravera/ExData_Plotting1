library (sqldf)

# read data file
datasource <- "../household_power_consumption.txt"
data <- read.csv.sql(datasource,sep=";",sql="select * from file where Date in ('1/2/2007','2/2/2007')")

# open png connection
png(file="plot1.png", width = 480, height = 480)

hist(data$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")

#save png
dev.off()