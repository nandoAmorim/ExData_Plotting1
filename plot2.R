
colClasses <- c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric')
names_list <- read.csv('household_power_consumption.txt',sep=';',header=T,nrow=1)
names_list <- names_list[-1,]
data <- read.csv('household_power_consumption.txt',sep=';',header=F,skip =66637 ,nrow=2880, colClasses=colClasses)
names(data) <- names(names_list)
data['Date'] <- as.Date(x=data[,'Date'],'%d/%m/%Y')
data['DateTime'] <- paste(data[,'Date'],data[,'Time'])

png('plot2.png',bg='transparent',width=480,height=480)

plot(y = data$Global_active_power,
     x = strptime(data$DateTime, '%Y-%m-%d %H:%M:%S'), 
     type = 'l',
     ylab = 'Global Active Power (kilowatts)',
     xlab = '')


dev.off()
1
