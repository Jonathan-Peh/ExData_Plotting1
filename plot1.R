plot1 = function(){
  library(lubridate)
  raw = read.table("household_power_consumption.txt", header = TRUE,sep = ";")
  raw$Date = dmy(raw$Date)
  filtered = raw[raw$Date >= ymd("2007-02-01") & raw$Date <= ymd("2007-02-02"),]
  filtered$Global_active_power = as.numeric(filtered$Global_active_power[!filtered$Global_active_power == "?"])
  
  png(filename = "plot1.png", width = 480, height = 480, units = "px", bg = "transparent")
  hist(filtered$Global_active_power,col = "red",xlab = "Global Active Power (kilowatts)",main = "Global Active Power")
  dev.off()
}