
## plot3.R
## read in Electric Power Consumption dataset
## read in Electric Power Consumption dataset from the following link
## unzip it and place it in your working directory
## https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

df1<-read.delim("household_power_consumption.txt", header = TRUE, sep = ";", quote = "\"",dec = ".", fill = TRUE, comment.char = "", na.strings="?")



##subset the data for the date range
df1sub <- subset(df1, as.Date(df1$Date, format="%d/%m/%Y") %in% as.Date(c("2007-02-01", "2007-02-02"), format="%Y-%m-%d"))


## remove any NA's
df1sub<-df1sub[complete.cases(df1sub),]
DateTime<-paste(df1sub$Date,df1sub$Time)
DateTime<-strptime(DateTime,"%d/%m/%Y %H:%M:%S")

png("plot3.png",width=480,height=480)

##create plot
plot(DateTime,df1sub$Sub_metering_1,xlab="",ylab="Energy sub metering",type="l",font.axis=1,col="black")

points(DateTime,df1sub$Sub_metering_2,xlab="",ylab="",type="l",col="red")

points(DateTime,df1sub$Sub_metering_3,xlab="",ylab="",type="l",col="blue")

legend("topright",cex=0.9, lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),y.intersp=1)



##dev.copy(png,file="plot3.png",width=480,height=480)
dev.off()
