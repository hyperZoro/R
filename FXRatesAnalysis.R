data<-read.table("C:/data/FXRates.csv",header = T, sep = ",")
attach(data)
names(data)

Num = length(End.Date)



for(i in names(data)[2:5])
{
  #revert data order because of time direction
  assign(paste("fx",i, sep = ""),get(i)[Num:1])
  assign(paste("logFX",i, sep = ""),log(get(i)[Num:1]))
}

