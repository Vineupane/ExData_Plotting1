## Plot 1

#load the data 
df <- read.table("household_power_consumption.txt", header = T,
                 sep = ";", na.strings = "?")

#change the date variable into date class
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")

# subsetting the data
sub_df<- subset(df, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

#convert date and time
sub_df$datetime <- strptime(paste(sub_df$Date, sub_df$Time), "%Y-%m-%d %H:%M:%S")

#plot 1
attach(sub_df)
hist(Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "Blue")

#Save plot
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
detach(sub_df)




