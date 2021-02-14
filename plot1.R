
#loading the data
data<-read.table("household_power_consumption.txt", sep=";", header=T, na.strings = "?")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

#Subsetting data from the dates 2007-02-01 and 2007-02-02
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

#plotting the histogram
hist(data$Global_active_power,col='red',xlab="Global Active Power (kilowatts)", main="Global Active Poweer")

#saving the plot as png
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()