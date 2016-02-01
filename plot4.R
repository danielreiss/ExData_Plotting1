# Set as English
Sys.setlocale(category = "LC_ALL", locale = "english") #"pt_BR.UTF-8/pt_BR.UTF-8/pt_BR.UTF-8/C/pt_BR.UTF-8/pt_BR.UTF-8"

# Read Data
dados <- read.table("household_power_consumption.txt", na.strings = "?", sep = ";", skip = 1, stringsAsFactors = FALSE)
names(dados)<- c("Date","Time","Global.active.power", "Global.reactive.power", "Voltage", "Global.intensity", "Sub.metering1", "Sub.metering2", "Sub.metering3")
dados$datahora <- strptime(paste(dados$Date,dados$Time), "%d/%m/%Y %H:%M:%S")

# Subset data
dados2 <- dados[which(dados$datahora >= strptime("01/02/2007", "%d/%m/%Y") & dados$datahora < strptime("03/02/2007", "%d/%m/%Y")),]

# Plot
png("plot4.png")	
par(mfcol=c(2,2))	
with(dados2,plot(x=datahora, y=Global.active.power, xlab="", ylab="Global Active Power (kilowatts)", type="l"))	
with(dados2, 
	{
	plot(x=datahora, y= Sub.metering1, xlab="", ylab="Energy sub metering", type="l", col = "black")
	lines(x=datahora, y= Sub.metering2,col="red")
	lines(x=datahora, y= Sub.metering3,col="blue")
	legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lwd=1, bty = "n")
	})	
plot(x=dados2$datahora, y=dados2$Voltage, xlab="datetime", ylab="Voltage", type="l", col = "black")
plot(x=dados2$datahora, y=dados2$Global.reactive.power, xlab="datetime", ylab="Global_reactive_power", type="l", col = "black")
dev.off()