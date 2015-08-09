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

par(mfrow = c(1,1), mar= c(5,5,4,2)+0.1)
x = seq(1, nrow(my.data),1)

line1 <- my.data$Sub_metering_1 -2
line1[line1 > 2 & line1 < 30 ] <- 2
table(line1)

line2 <- my.data$Sub_metering_2 - 2
line2[line2 > 2] <- 2
table(line2)

plot(x,my.data$Sub_metering_3, type = 'n', xlim = c(0,2885), ylim = c(range(my.data[,7:9])), xlab = "", ylab = "Energy sub metering", xaxt="n", yaxt="n")
axis(side = 1, at = c(1,1440,2880),labels = c("Thu","Fri","Sat"))
axis(side = 2, at = seq(0,35,10),labels = TRUE)

lines(x,line1, type = 'S', col = 'black')
lines(x,line2, type = 'S', col = 'red')
lines(x,my.data[,9], type = 'S', col = 'blue')

legend("topright", legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), lwd= c(2,2,2),seg.len=1,col = c('black','red','blue'), cex = 0.7,text.font = 2, y.intersp=0.4, x.intersp=1,adj = c(0,0))

# save plot
dev.copy(png,"plot3.png", width=480, height=480)
dev.off()
