plot4 = function(){
  library(lubridate)
  par(mfcol = c(2,2),bg=NA)
  raw = read.table("household_power_consumption.txt", header = TRUE,sep = ";")
  raw$Date = dmy(raw$Date)
  filtered = raw[raw$Date >= ymd("2007-02-01") & raw$Date <= ymd("2007-02-02"),]
  filtered$DateTime = ymd_hms(paste(filtered$Date,filtered$Time))
  ticks = seq(min(filtered$DateTime), max(filtered$DateTime), by = "day")
  
  #png(filename = "plot4.png", width = 480, height = 480, units = "px", bg = "transparent")
  
  #plot2
  filtered$Global_active_power = as.numeric(filtered$Global_active_power)
  plot(filtered$Global_active_power~filtered$DateTime,type = "l", xaxt="n", xlab = '', ylab = "Global Active Power")
  axis(1, at = c(ticks,max(filtered$DateTime)), labels = c(weekdays(ticks, abbreviate = TRUE),"Sat"))
  
  #plot3
  filtered$Sub_metering_1 = as.numeric(filtered$Sub_metering_1)
  filtered$Sub_metering_2 = as.numeric(filtered$Sub_metering_2)
  filtered$Sub_metering_3 = as.numeric(filtered$Sub_metering_3)
  plot(filtered$Sub_metering_1~filtered$DateTime,type = "l", xaxt="n", xlab = '', ylab = "Energy sub metering")
  lines(filtered$Sub_metering_2~filtered$DateTime,col = "red")
  lines(filtered$Sub_metering_3~filtered$DateTime,col = "blue")
  legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),lty=1,bty = "n")
  axis(1, at = c(ticks,max(filtered$DateTime)), labels = c(weekdays(ticks, abbreviate = TRUE),"Sat"))
  
  #newplot1
  filtered$Voltage = as.numeric(filtered$Voltage)
  plot(filtered$Voltage~filtered$DateTime,type = "l", xaxt="n", xlab = 'datetime', ylab = "Voltage")
  axis(1, at = c(ticks,max(filtered$DateTime)), labels = c(weekdays(ticks, abbreviate = TRUE),"Sat"))
  
  #newplot2
  filtered$Global_reactive_power = as.numeric(filtered$Global_reactive_power)
  plot(filtered$Global_reactive_power~filtered$DateTime,type = "l", xaxt="n", xlab = 'datetime', ylab = "Global_reactive_power")
  axis(1, at = c(ticks,max(filtered$DateTime)), labels = c(weekdays(ticks, abbreviate = TRUE),"Sat"))
  
  dev.copy(png, file = "plot4.png",width = 480, height = 480, units = "px", bg = "transparent")
  dev.off()
  dev.off()
}