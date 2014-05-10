
## plot4.R
## read in Electric Power Consumption dataset

df1<-read.delim("household_power_consumption.txt", header = TRUE, sep = ";", quote = "\"",dec = ".", fill = TRUE, comment.char = "", na.strings="?")



##subset the data for the date range
df1sub <- subset(df1, as.Date(df1$Date, format="%d/%m/%Y") %in% as.Date(c("2007-02-01", "2007-02-02"), format="%Y-%m-%d"))


## remove any NA's
df1sub<-df1sub[complete.cases(df1sub),]
DateTime<-paste(df1sub$Date,df1sub$Time)
DateTime<-strptime(DateTime,"%d/%m/%Y %H:%M:%S")

png("plot4.png",width=504,height=504)

##set for 4 plots
par(mfrow = c(2, 2),cex.lab=0.9)

##plot top left
plot(DateTime,df1sub$Global_active_power,xlab="",ylab="Global Active Power",type="l",font.axis=1)

##plot top right
plot(DateTime,df1sub$Voltage,xlab="datetime",ylab="Voltage",type="l",font.axis=1)

##plot bottom left
plot(DateTime,df1sub$Sub_metering_1,xlab="",ylab="Energy sub metering",type="l",font.axis=1,col="black")

points(DateTime,df1sub$Sub_metering_2,xlab="",ylab="",type="l",col="red")

points(DateTime,df1sub$Sub_metering_3,xlab="",ylab="",type="l",col="blue")

legend("topright",cex=0.9, lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),y.intersp=1,bty="n")

##par(cex.lab=0.9)

##plot bottom right
plot(DateTime,df1sub$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="l",font.axis=1)



##dev.copy(png,file="plot3.png",width=480,height=480)
dev.off()
