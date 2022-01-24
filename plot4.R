#exploratory data analysis project1 (Plot 4).

#load the data 
df <- read.table("household_power_consumption.txt", header = T,
                 sep = ";", na.strings = "?")

#change the date variable into date class
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")

# sub-setting the data
sub_df<- subset(df, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

#convert date and time
sub_df$datetime <- strptime(paste(sub_df$Date, sub_df$Time), "%Y-%m-%d %H:%M:%S")

#Plot 4
sub_df$datetime <- as.POSIXct(sub_df$datetime)
par(mfrow = c(2, 2))
attach(sub_df)

plot(Global_active_power ~ datetime, type = "l", ylab = "Global Active Power", 
     xlab = "")
plot(Voltage ~ datetime, type = "l")
plot(Sub_metering_1 ~ datetime, type = "l", ylab = "Energy sub metering", 
     xlab = "",col="Green")
lines(Sub_metering_2 ~ datetime, col = "Red")
lines(Sub_metering_3 ~ datetime, col = "Blue")
legend("topright", lty = 1, col = c("green", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty = "n",cex=0.9)

plot(Global_reactive_power ~ datetime, type = "l")

#save plot4
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()
detach(sub_df)


