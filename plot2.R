plot2 = function(){
  library(lubridate)
  raw = read.table("household_power_consumption.txt", header = TRUE,sep = ";")
  raw$Date = dmy(raw$Date)
  filtered = raw[raw$Date >= ymd("2007-02-01") & raw$Date <= ymd("2007-02-02"),]
  filtered$DateTime = ymd_hms(paste(filtered$Date,filtered$Time))
  filtered$Global_active_power = as.numeric(filtered$Global_active_power)
  
  png(filename = "plot2.png", width = 480, height = 480, units = "px", bg = "transparent")
  plot(filtered$Global_active_power~filtered$DateTime,type = "l", xaxt="n", xlab = '', ylab = "Global Active Power (kilowatts)")
  ticks = seq(min(filtered$DateTime), max(filtered$DateTime), by = "day")
  axis(1, at = c(ticks,max(filtered$DateTime)), labels = c(weekdays(ticks, abbreviate = TRUE),"Sat"))
  dev.off()
}