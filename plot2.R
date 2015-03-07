library(lubridate)
library(datasets)
Sys.setlocale("LC_TIME", "English")

#please make sure the source file is located under your working directory before you proceed
#get records for 1/1/2007 and 1/2/2007 only
 a<-grep("(^1/2/2007)|(^2/2/2007)",readLines("household_power_consumption.txt"))

#read data in for 1/1/2007 and 1/2/2007 only
data<-read.table("household_power_consumption.txt",skip=a[1]-1,nrow=length(a),sep=";")

#convert the Date and Time variables to Date/Time classes
# data$date<-as.Date(strptime(data$date,format="%d/%m/%Y"))

dt<-paste(data$V1,data$V2)
dt<-strptime(dt,format="%d/%m/%Y %H:%M:%S ")
data<-cbind(data,dt)



#apply appropriate name label
 names(data)<-c("date","time","global_active_power","global_reactive_power","voltage","global_intensity","sub_metering_1","sub_metering_2","sub_metering_3","dt")

#plot2
png("plot2.png",width=480,height=480,bg="white")
plot(data$dt,data$global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()


#clean up
rm("a","dt","data")
