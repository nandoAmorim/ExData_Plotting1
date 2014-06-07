
colClasses <- c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric')
names_list <- read.csv('household_power_consumption.txt',sep=';',header=T,nrow=1)
names_list <- names_list[-1,]
data <- read.csv('household_power_consumption.txt',sep=';',header=F,skip =66637 ,nrow=2880, colClasses=colClasses)
names(data) <- names(names_list)
transform(data,Date = as.Date(Date), Time = strptime(Time,'%H:%M:%S'))

png('plot1.png',bg='transparent',width=480,height=480)

hist(x=data$Global_active_power, 
     col='red', 
     main='Global Active Power', 
     xlab = 'Global Active Power')

dev.off()

