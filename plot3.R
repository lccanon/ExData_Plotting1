consumption <- read.csv("household_power_consumption.txt", sep=";",
                        header=T, na.strings="?")
consumption$datetime <- strptime(paste(consumption$Date, consumption$Time),
                                 format="%d/%m/%Y %H:%M:%S")
consumptionSelect <- subset(consumption,
                            datetime >= "2007-02-01 00:00:00 CET"
                            & datetime < "2007-02-03 00:00:00 CET")

png("plot3.png")
with(consumptionSelect, {
    plot(datetime, Sub_metering_1, type="l",
         xlab="", ylab="Energy sub metering")
    lines(datetime, Sub_metering_2, col=2)
    lines(datetime, Sub_metering_3, col=4)
})
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd=1, col=c(1,2,4))
dev.off()
