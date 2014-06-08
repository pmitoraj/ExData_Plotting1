# define coloumn names
colnames <- c('Date', 'Time', 'Global_active_power', 'Global_reactive_power',
              'Voltage', 'Global_intensity','Sub_metering_1','Sub_metering_2',
              'Sub_metering_3')

# read data
household <- read.table('../household_power_consumption.txt',header=TRUE,
                        sep=";", na.strings="?",
                        col.names=colnames)

# convert date column to Date class
household$Date <- as.Date(household$Date,format="%d/%m/%Y")

# subset the data
household_subset <- subset(household, Date >= as.Date("2007-02-01") &
                           Date <= as.Date("2007-02-02"))

# save the histogram into png file
png(filename="figure/plot1.png")
hist(household_subset$Global_active_power, col='red', main="Global Active Power",
     xlab="Global Active Power")
dev.off()
