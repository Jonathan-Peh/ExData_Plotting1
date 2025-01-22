plot3 = function(){
  library(lubridate)
  raw = read.table("household_power_consumption.txt", header = TRUE,sep = ";")
  raw$Date = dmy(raw$Date)
  filtered = raw[raw$Date >= ymd("2007-02-01") & raw$Date <= ymd("2007-02-02"),]
  filtered$DateTime = ymd_hms(paste(filtered$Date,filtered$Time))
  filtered$Sub_metering_1 = as.numeric(filtered$Sub_metering_1)
  filtered$Sub_metering_2 = as.numeric(filtered$Sub_metering_2)
  filtered$Sub_metering_3 = as.numeric(filtered$Sub_metering_3)
  
  png(filename = "plot3.png", width = 480, height = 480, units = "px", bg = "transparent")
  plot(filtered$Sub_metering_1~filtered$DateTime,type = "l", xaxt="n", xlab = '', ylab = "Energy sub metering")
  lines(filtered$Sub_metering_2~filtered$DateTime,col = "red")
  lines(filtered$Sub_metering_3~filtered$DateTime,col = "blue")
  ticks = seq(min(filtered$DateTime), max(filtered$DateTime), by = "day")
  legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),lty=1)
  axis(1, at = c(ticks,max(filtered$DateTime)), labels = c(weekdays(ticks, abbreviate = TRUE),"Sat"))
  dev.off()
}