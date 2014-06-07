names_list <- read.csv('household_power_consumption.txt',sep=';',header=T,nrow=1)
names_list <- names_list[-1,]
data <- read.csv('household_power_consumption.txt',sep=';',header=F,skip =66637 ,nrow=2880)
names(data) <- names(names_list)


