#plot1.r
#loading whole dataset
dataset <- read.table("~/R/data/plotting_data_course_project/household_power_consumption.txt", sep=";", header=T, na.strings=c("NA", "?"), stringsAsFactors=F)
#subsetting needed dates by string comparison
used_data <- subset(dataset, dataset$Date == "2/2/2007" | dataset$Date == "1/2/2007")
#setting output device
png(filename="~/R/scripts/plotting_asignment/plot1.png")
#plotting hist
hist(used_data$Global_active_power, main="Global Active Powers", col="red", xlab="Global Active Power (kilowatts)")
dev.off()