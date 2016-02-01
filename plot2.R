# Set as English
Sys.setlocale(category = "LC_ALL", locale = "english") #"pt_BR.UTF-8/pt_BR.UTF-8/pt_BR.UTF-8/C/pt_BR.UTF-8/pt_BR.UTF-8"

# Read Data
dados <- read.table("household_power_consumption.txt", na.strings = "?", sep = ";", skip = 1, stringsAsFactors = FALSE)
names(dados)<- c("Date","Time","Global.active.power", "Global.reactive.power", "Voltage", "Global.intensity", "Sub.metering1", "Sub.metering2", "Sub.metering3")
dados$datahora <- strptime(paste(dados$Date,dados$Time), "%d/%m/%Y %H:%M:%S")

# Subset data
dados2 <- dados[which(dados$datahora >= strptime("01/02/2007", "%d/%m/%Y") & dados$datahora < strptime("03/02/2007", "%d/%m/%Y")),]

# Plot
png("plot2.png")
with(dados2,plot(x=datahora, y=Global.active.power, xlab="", ylab="Global Active Power (kilowatts)", type="l"))
dev.off()