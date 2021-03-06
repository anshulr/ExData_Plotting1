# Load Data From File
data <- read.table(file="household_power_consumption.txt",sep=";",header=TRUE
                   ,stringsAsFactors=FALSE)

#Format and Filter Data
data$Date <- as.Date(data$Date,format="%d/%m/%Y")
data <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]

data$Global_active_power <- as.numeric(data$Global_active_power)

# Construct Hist Plot
png("plot1.png",width = 480, height = 480)
with(data,hist(x=Global_active_power ,main="Global Active Power" 
               ,xlab="Global Active Power (kilowatts)" ,col="red"))

dev.off()