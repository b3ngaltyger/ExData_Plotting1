#Source the data
fileName <- "household_power_consumption.txt"
rawdata <- read.table(fileName, header=TRUE, sep=";", quote="\"", dec=".", 
                      fill=TRUE, comment.char="", na.strings="?")
plotdata <- rawdata[rawdata$Date == "1/2/2007" | rawdata$Date == "2/2/2007",]

#Open Graphics Device
png(filename="plot1.png", width=480, height=480, units="px")

#Generate histogram
hist(plotdata$Global_active_power, col="red", breaks=12, xlab="Global Active Power (kilowatts)", 
     main="Global Active Power", ylim=c(0,1200))

#Close Graphics Device
dev.off()