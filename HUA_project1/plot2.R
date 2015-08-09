data <- read.table("household_power_consumption.txt", header = T, sep = ';')
head(data);names(data)

# extract target Date index
idx <- which(data$Date == "1/2/2007" | data$Date == "2/2/2007")

# subset Date 
my.data <- data[idx,]

# change factor to numeric
my.data[,3:9]  <- lapply(my.data[,3:9], as.numeric)


x = seq(1, nrow(my.data),1)

#plot2
x = seq(1, nrow(my.data),1)
par(mfrow = c(1,1), mar= c(5,5,4,2)+0.1)

plot(x,my.data$Global_active_powe, type = 'n', xlim = c(0,nrow(my.data)), ylim = c(range(my.data$Global_active_powe)), xlab = "", ylab = "Global Active Power (kilowatts)", xaxt="n", yaxt = 'n')
lines(x,my.data$Global_active_powe, type = 's')
axis(side = 1, at = c(1,1440,2880),labels = c("Thu","Fri","Sat"))
axis(side = 2, at = c(1,1000,2000,3000),labels = c("0","2","4","6"))

# save plot
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()

