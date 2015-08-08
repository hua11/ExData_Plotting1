data <- read.table("household_power_consumption.txt", header = T, sep = ';')
head(data);names(data)

# extract target Date index
idx <- which(data$Date == "1/2/2007" | data$Date == "2/2/2007")

# subset Date 
my.data <- data[idx,]
head(my.data); tail(my.data)

# change factor to numeric
my.data[,3:9]  <- lapply(my.data[,3:9], as.numeric)

#plot1
par(mfrow = c(1,1), mar= c(5,5,4,2))

B <- seq(0,3700,l=16)
hist(my.data$Global_active_powe, breaks=B,main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col="red", xaxt="n")
axis(side = 1, at = B[c(1,5,9,13)],labels = seq(0,6,2))

# save plot
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()

