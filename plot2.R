
#loading the data
data<-read.table("household_power_consumption.txt", sep=";", header=T, na.strings = "?")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

#Subset data from the dates 2007-02-01 and 2007-02-02
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

#converting date and time 
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
data$datetime <- as.POSIXct(data$datetime)

#plotting the second plot
plot(data$Global_active_power ~ data$datetime, type="l",ylab="Global Active Power (kilowatts)",xlab="")

#saving the plot as png
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()