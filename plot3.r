#plot3.r
dataset <- read.table("~/R/data/plotting_data_course_project/household_power_consumption.txt", sep=";", header=T, na.strings=c("NA", "?"), stringsAsFactors=F)
#subsetting needed dates by string comparison
used_data <- subset(dataset, dataset$Date == "2/2/2007" | dataset$Date == "1/2/2007")
#concatenating date & time
used_data$Time <- paste(used_data$Date, used_data$Time)
#deleting one unnecessary column
used_data <- used_data[2:length(used_data)]
#converting to POSIXlt
used_data$Time <- strptime(used_data$Time, format="%d/%m/%Y %H:%M:%S")
#setting english locale for correct english weekdays labels
Sys.setlocale("LC_TIME", "en_US.UTF-8")
#setting output device
png(filename="~/R/scripts/plotting_asignment/plot3.png")
#plotting =)
plot(used_data$Time, used_data$Sub_metering_1, type="n", xlab="", ylab = "Energy Sub Metering")
lines(used_data$Time, used_data$Sub_metering_1, xlab="", ylab = "Energy Sub Metering", col="black")
lines(used_data$Time, used_data$Sub_metering_2, xlab="", ylab = "Energy Sub Metering", col="red")
lines(used_data$Time, used_data$Sub_metering_3, xlab="", ylab = "Energy Sub Metering", col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd=1)
dev.off()