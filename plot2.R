# Johns Hopkins Data Science Track
#
# Exploratory Data Science
# Course Project 1
#
# plot2.R - script creating the second required plot. Script assumes that data file is in
# current working directory (zipped or unzipped)
library("dplyr")
library("lubridate")

# unzip file if zipped
if(file.exists("exdata-data-household_power_consumption.zip")) {
  unzip("exdata-data-household_power_consumption.zip")
}
# read in file
df <- read.delim("household_power_consumption.txt",sep=";",
                     na.strings = c("NA","?"))
# translate date/times and filter by date
df <- mutate(df,Date = dmy(Date)) %>% 
        filter(Date %in% ymd(c("2007-02-01", "2007-02-02")))
df$Time <- hms(df$Time)

# change graphic device to png file
png("plot2.png")

#create graph
plot(df$Date+df$Time,df$Global_active_power,type="l",xlab = "",
       ylab = "Global Active Power (kilowatts)")

# close png graphic device
dev.off()