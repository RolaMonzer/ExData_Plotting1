
#loading the data
data<-read.table("household_power_consumption.txt", sep=";", header=T, na.strings = "?")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

#Subset data from the dates 2007-02-01 and 2007-02-02
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

#converting date and time 
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
data$datetime <- as.POSIXct(data$datetime)

#plotting the different plots

png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))

plot(data$Global_active_power ~ data$datetime, type="l",ylab="Global Active Power (kilowatts)",xlab="")

with(data, plot(Voltage ~datetime,type="l"))

plot(data$Sub_metering_1 ~ data$datetime , ylab="Energy sub metering", xlab="", type='l')
lines(data$Sub_metering_2 ~ data$datetime ,col="red")
lines(data$Sub_metering_3 ~ data$datetime ,col="blue")
legend("topright", col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, bty='n')

with(data, plot(Global_reactive_power ~ datetime, type="l"))

#saving the plot as png
#dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()