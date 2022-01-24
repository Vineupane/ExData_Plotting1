#exploratory data analysis project1 (Plot 3).

#load the data 
df <- read.table("household_power_consumption.txt", header = T,
                 sep = ";", na.strings = "?")

#change the date variable into date class
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")

# subsetting the data
sub_df<- subset(df, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

#convert date and time
sub_df$datetime <- strptime(paste(sub_df$Date, sub_df$Time), "%Y-%m-%d %H:%M:%S")

#Plot 3
sub_df$datetime <- as.POSIXct(sub_df$datetime)
attach(sub_df)

plot(Sub_metering_1 ~ datetime, type = "l", 
     ylab = "Energy sub metering", xlab = "",col = "Blue")
lines(Sub_metering_2 ~ datetime, col = "Red")
lines(Sub_metering_3 ~ datetime, col = "darkGreen")
legend("topright", lty = 1, col = c("blue", "red", "darkgreen"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# save plot3
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()
detach(sub_df)

