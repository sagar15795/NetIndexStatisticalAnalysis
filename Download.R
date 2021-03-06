#Download
rm(list=ls())

data.india=read.csv(file ="IN.csv",header = T)

download.india1=data.india$download_kbps

t_row=  nrow(data.india)-260

download.india=download.india1[1:t_row]

plot(download.india, type = "l",xlab="Number of days from 20/08/2009",ylab = "Download speed (Kb/s)",main="India",las=1)
legend(0,3000, lty=c(1,1), c("Observed values","Fitted values"),lwd=c(2.5,2.5),col=c("black","red"))
x=seq(from = 1,to = t_row,by = 1)

fit4 <- lm(download.india~poly(x,3,raw=TRUE))

lines(x, predict(fit4, data.frame(x=x)), col="red")

summary(fit4)

fitted_fun <- function(x, m) {
  co <- coef(m)
  r <- co[1] + (co[2] * x) + (co[3] * x^2) + (co[4] * x^3)
  return(r)
}


diff=vector(mode = "numeric",260)

for(i in 1:260){
  diff[i]=abs(download.india1[1606+i]-fitted_fun(1606+i,fit4))
}

mean(diff)

sqrt(var(diff))
diff1=vector(mode = "numeric",260)

for(i in 1:260){
  diff1[i]=third_order(1606+i,fit4)
}

plot(seq(1607,1866,1),download.india1[1607:1866],type = "l",xlab="Number of days from 20/08/2009",ylab = "Download speed (Kb/s)",main="Observed values VS Calculated values from our model",las=1)
lines(seq(1607,1866,1),diff1,col="red")
legend(1600,3600, lty=c(1,1), c("Observed values","Calculated values"),lwd=c(2 ,2 ),col=c("black","red"))
