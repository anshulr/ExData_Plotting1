# Load Data From File
data <- read.table(file="household_power_consumption.txt",sep=";",header=TRUE
                   ,stringsAsFactors=FALSE)

#Format and Filter Data
data$Date <- as.Date(data$Date,format="%d/%m/%Y")
data <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]

data$Global_active_power <- as.numeric(data$Global_active_power)
data$Day <- as.POSIXct(paste(as.Date(data$Date, format="%d/%m/%Y"), data$Time, sep=" "))

# Construct Plot
png("plot2.png",width = 480, height = 480)
with(data,plot(x=Day, y=Global_active_power ,xlab="" ,ylab="Global Active Power (kilowatts)"
               ,type="l"))
dev.off()