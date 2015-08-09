data <- read.table("household_power_consumption.txt", header = T, sep = ';')
head(data);names(data)

# extract target Date index
idx <- which(data$Date == "1/2/2007" | data$Date == "2/2/2007")

# subset Date 
my.data <- data[idx,]

# change factor to numeric
my.data[,3:9]  <- lapply(my.data[,3:9], as.numeric)

# plot 4
par(mfcol= c(2,2), mar = c(4,4,2,1)+0.1)

#plot a
x = seq(1, nrow(my.data),1)
plot(x,my.data$Global_active_powe, type = 'n', xlim = c(0,2881), ylim = c(range(my.data$Global_active_powe)), xlab = "", ylab = "Global Active Power (kilowatts)", xaxt="n", yaxt = 'n')
axis(side = 1, at = c(1,1440,2880),labels = c("Thu","Fri","Sat"))
axis(side = 2, at = c(1,1000,2000,3000),labels = c("0","2","4","6"))

lines(x,my.data$Global_active_powe, type = 's')

#plot b
line1 <- my.data[,7]-2
line1[line1 > 2 & line1 < 30 ] <- 2
table(line1)

line2 <- my.data[,8]-2
line2[line2 > 2] <- 2
table(line2)

plot(x,my.data$Sub_metering_1, type = 'n', xlim = c(0,2881), ylim = c(range(my.data[,7:9])), xlab = "", ylab = "Energy sub metering", xaxt="n", yaxt="n")
axis(side = 1, at = c(1,1440,2880),labels = c("Thu","Fri","Sat"))
axis(side = 2, at = seq(0,35,10),labels = TRUE)

lines(x,line1, type = 'S', col = 'black')
lines(x,line2, type = 'S', col = 'red')
lines(x,my.data[,9], type = 'S', col = 'blue')

legend("topright", legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),cex= 0.7, text.font=2,lwd= c(2,2,2),seg.len=0.5,col = c('black','red','blue'), y.intersp=0.3, x.intersp=0.5, xjust =0, yjust= 0, bty = "n",adj = c(0,0))

#plot c
plot(x,my.data$Voltage, type = 'n', xlim = c(0,2881), ylim = c(range(my.data[,5])), xlab = "datetime", ylab = "Voltage", xaxt="n",yaxt="n")
axis(side = 1, at = c(1,1440,2880),labels = c("Thu","Fri","Sat"))
axis(side = 2, at = seq(800,2000,400),labels = seq(234,246,4))

lines(x,my.data$Voltage, type = 'l', col = 'black')


#plot d
plot(x,my.data$Global_reactive_power, type = 'n', xlim = c(0,2881), ylim = c(0,250), xlab = "datetime", ylab = "Global_reactive_power", xaxt="n", yaxt="n")
axis(side = 1, at = c(1,1440,2880),labels = c("Thu","Fri","Sat"))
axis(side = 2, at = c(seq(0,250,50)),labels = seq(0,0.5,0.1))

lines(x,my.data$Global_reactive_power, type = 'h', col = 'black')

# save plot
dev.copy(png,"plot4.png", width=480, height=480)
dev.off()
