import.packages("kernlab")
library(kernlab)

n <- 150
p <- 2
sigma <- 1
meanpos <- 0
meanneg <- 3
npos <- round(n/2)
nneg <- n-npos
xpos <- matrix(rnorm(npos*p,mean=meanpos,sd=sigma),npos,p) 
xneg <- matrix(rnorm(nneg*p,mean=meanneg,sd=sigma),npos,p)
x <- rbind(xpos,xneg)
y <- matrix(c(rep(1,npos),rep(-1,nneg)))
plot(x,col=ifelse(y>0,1,2))
legend("topleft",c("Positive","Negative"),col=seq(2),pch=1,text.col=seq(2))

ntrain <- round(n*0.8)
tindex <- sample(n,ntrain)
xtrain <- x[tindex,]
xtest <- x[-tindex,]
ytrain <- y[tindex]
ytest <- y[-tindex]
istrain <- rep(0,n)
istrain[tindex] <- 1
plot(x,col=ifelse(y>0,1,2),pch=ifelse(istrain==1,1,2))
legend("topleft",c("Positive train","Positive Test","Negative Train","Negative Test"),col=c(1,1,2,2),pch=c(1,2,1,2))

svp <- ksvm(x=xtrain,y=ytrain,type="C-svc",kernel="vanilladot",scaled=c(),cross=0,cache=40,class.weights=NULL,c=100)
plot(svp,data=xtrain)
ypred=predict(svp,xtest)
table(ytest,ypred)
accuracy <- sum(ypred==ytest)/length(yest)
ypredscore = predict(svp,xtest,type="decision")
