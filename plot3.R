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


#plot3
png("plot3.png",width=480,height=480,bg="white")
with(data,plot(dt,sub_metering_1,type="l",xlab="",ylab="Energy sub metering"))
with(data,lines(dt,sub_metering_2,col="red"))
with(data,lines(dt,sub_metering_3,col="blue"))
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),pch="_____________________________________")
dev.off()


#clean up
rm("a","dt","data")
