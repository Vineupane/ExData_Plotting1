#exploratory data analysis project1 (Plot 2).
#load the data 
df <- read.table("household_power_consumption.txt", header = T,
                 sep = ";", na.strings = "?")

#change the date variable into date class
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")

# subsetting the data
sub_df<- subset(df, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

#convert date and time
sub_df$datetime <- strptime(paste(sub_df$Date, sub_df$Time), "%Y-%m-%d %H:%M:%S")

#Plot 2
sub_df$datetime <- as.POSIXct(sub_df$datetime)
attach(sub_df)
plot(Global_active_power ~ datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "",col="red")

#save plot2
dev.copy(png, file = "Plot2.png", height = 480, width = 480)
dev.off()
detach(sub_df)
