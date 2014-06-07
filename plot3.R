
colClasses <- c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric')
names_list <- read.csv('household_power_consumption.txt',sep=';',header=T,nrow=1)
names_list <- names_list[-1,]
data <- read.csv('household_power_consumption.txt',sep=';',header=F,skip =66637 ,nrow=2880, colClasses=colClasses)
names(data) <- names(names_list)
data['Date'] <- as.Date(x=data[,'Date'],'%d/%m/%Y')
data['DateTime'] <- paste(data[,'Date'],data[,'Time'])

png('plot3.png',bg='transparent',width=480,height=480)

plot(y = data$Sub_metering_1,
     x = strptime(data$DateTime, '%Y-%m-%d %H:%M:%S'), 
     type = 'l',
     ylab = 'Global Active Power (kilowatts)',
     xlab = '')

lines(y = data$Sub_metering_2,
     x = strptime(data$DateTime, '%Y-%m-%d %H:%M:%S'), 
     type = 'l',
     col = 'red',
     ylab = 'Global Active Power (kilowatts)',
     xlab = '')

lines(y = data$Sub_metering_3,
      x = strptime(data$DateTime, '%Y-%m-%d %H:%M:%S'), 
      type = 'l',
      col = 'blue',
      ylab = 'Global Active Power (kilowatts)',
      xlab = '')

legend('topright', c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),lty=1 ,col=c('black','red','blue'))

dev.off()

