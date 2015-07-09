consumption <- read.csv("household_power_consumption.txt", sep=";",
                        header=T,
                        na.strings="?")
consumption$datetime <- strptime(paste(consumption$Date, consumption$Time),
                                 format="%d/%m/%Y %H:%M:%S")
consumptionSelect <- subset(consumption,
                            datetime >= "2007-02-01 00:00:00 CET"
                            & datetime < "2007-02-03 00:00:00 CET")

png("plot2.png")
with(consumptionSelect, plot(datetime, Global_active_power, type="l", xlab="",
                             ylab="Global Active Power (kilowatts)"))
dev.off()
