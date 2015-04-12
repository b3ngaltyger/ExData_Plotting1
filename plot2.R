#Source the data
fileName <- "household_power_consumption.txt"
rawdata <- read.table(fileName, header=TRUE, sep=";", quote="\"", dec=".", 
                      fill=TRUE, comment.char="", na.strings="?")
plotdata <- rawdata[rawdata$Date == "1/2/2007" | rawdata$Date == "2/2/2007",]

#Add datetime column
datetime <- strptime(paste(plotdata$Date,plotdata$Time),"%d/%m/%Y %H:%M:%S")
plotdata <- cbind(datetime,plotdata)

#Open Graphics Device
png(filename="plot2.png", width=480, height=480, units="px")

#Generate plot
plot(plotdata$datetime,plotdata$Global_active_power,type="n",
     xlab="",ylab="Global Active Power (kilowatts)")
lines(plotdata$datetime,plotdata$Global_active_power)

#Close Graphics Device
dev.off()