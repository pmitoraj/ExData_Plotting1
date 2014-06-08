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
time <- seq(as.POSIXct("2007-02-01 00:00:00"),by="min",length.out=nrow(household_subset))
household_subset$Time <- time

# save the plot into png file
png(filename="figure/plot3.png")
plot(household_subset$Time,
     household_subset$Sub_metering_1,
     type="l",
     ylab="Energy sub metering",
     xlab="",
     col='black')
lines(household_subset$Time,
     household_subset$Sub_metering_2,
     type="l",
     ylab="Energy sub metering",
     xlab="",
     col='red')
lines(household_subset$Time,
     household_subset$Sub_metering_3,
     type="l",
     ylab="Energy sub metering",
     xlab="",
     col='blue')
legend(x='topright', c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
       col=c("black","red","blue"),lty=c(1,1,1))
dev.off()
