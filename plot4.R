#Source the data
fileName <- "household_power_consumption.txt"
rawdata <- read.table(fileName, header=TRUE, sep=";", quote="\"", dec=".", 
                      fill=TRUE, comment.char="", na.strings="?")
plotdata <- rawdata[rawdata$Date == "1/2/2007" | rawdata$Date == "2/2/2007",]

#Add datetime column
datetime <- strptime(paste(plotdata$Date,plotdata$Time),"%d/%m/%Y %H:%M:%S")
plotdata <- cbind(datetime,plotdata)

#Open Graphics Device
png(filename="plot4.png", width=480, height=480, units="px")

#Set palette to 2x2 plots
par(mfcol=c(2,2))

#Make Top Left Plot
plot(plotdata$datetime,plotdata$Global_active_power,type="n",
     xlab="",ylab="Global Active Power")
lines(plotdata$datetime,plotdata$Global_active_power)

#Make Bottom Left Plot
plot(plotdata$datetime,plotdata$Sub_metering_1,type="n",
     xlab="",ylab="Energy sub metering")
lines(plotdata$datetime,plotdata$Sub_metering_1,col="black")
lines(plotdata$datetime,plotdata$Sub_metering_2,col="red")
lines(plotdata$datetime,plotdata$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lty=1)

#Make Top Right Plot
plot(plotdata$datetime,plotdata$Voltage,type="n",
     xlab="datetime",ylab="Voltage")
lines(plotdata$datetime,plotdata$Voltage)

#Make Bottom Right Plot
plot(plotdata$datetime,plotdata$Global_reactive_power,type="n",
     xlab="datetime",ylab="Global_reactive_power")
lines(plotdata$datetime,plotdata$Global_reactive_power)

#Close Graphics Device
dev.off()