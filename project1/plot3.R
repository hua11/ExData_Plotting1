data <- read.table("household_power_consumption.txt", header = T, sep = ';')
head(data);names(data)

# extract target Date index
idx <- which(data$Date == "1/2/2007" | data$Date == "2/2/2007")
length(idx)

# subset Date 
my.data <- data[idx,]
head(my.data); tail(my.data)

# change factor to numeric
my.data[,3:9]  <- lapply(my.data[,3:9], as.numeric)

# check base line for each group
min(my.data[,7])
min(my.data[,8])
min(my.data[,9])

#plot 3
plot(x,my.data$Sub_metering_1, type = 'n', xlim = c(0,2881), ylim = c(range(my.data[,7:9])), xlab = "", ylab = "Energy sub metering", xaxt="n", yaxt="n")
lines(1:2880,my.data[,7]-2, type = 'S', col = 'black')
lines(1:2880,my.data[,8]-2, type = 'S', col = 'red')
lines(1:2880,my.data[,9], type = 'S', col = 'blue')
axis(side = 1, at = c(1,1440,2880),labels = c("Thu","Fri","Sat"))
axis(side = 2, at = seq(0,35,10),labels = TRUE)

legend("topright", legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), lty=c(1,1,1), lwd= c(2,2,2),col = c('black','red','blue'), cex = 0.75,y.intersp=0.6, x.intersp= 0.3, xjust=0, yjust=0)

# save plot
dev.copy(png,"plot3.png", width=500, height=480)
dev.off()

