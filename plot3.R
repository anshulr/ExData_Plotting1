# Load Data From File
data <- read.table(file="household_power_consumption.txt",sep=";",header=TRUE
                   ,stringsAsFactors=FALSE)

#Format and Filter Data
data$Date <- as.Date(data$Date,format="%d/%m/%Y")
data <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]

data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
data$Day <- as.POSIXct(paste(as.Date(data$Date, format="%d/%m/%Y"), data$Time, sep=" "))

# Construct Plot
png("plot3.png",width = 480, height = 480)
with(data,plot(x=Day, y=Sub_metering_1, xlab="" ,ylab="Energy sub metering" ,type="l"))
with(data,lines(x=Day ,y=Sub_metering_2 ,col="red"))
with(data,lines(x=Day ,y=Sub_metering_3 ,col="blue"))
with(data,legend("topright",lty=c(1,1,1) 
                 ,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
                 ,col=c("black","red","blue")))
dev.off()