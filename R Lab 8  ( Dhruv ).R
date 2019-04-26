install.packages("datasets")
install.packages("ggplot2")
install.packages("mclust")
library(datasets)
library(ggplot2)
library(mclust)

#IRIS
ggplot(iris,aes(Petal.Length,Petal.Width,color=Species)) + geom_point()
set.seed(20)
model <- kmeans(iris[,3:4],3,nstart=20)
Species <- factor(iris$Species)
table(model$cluster,Species)
model$cluster <- as.factor(model$cluster)
ggplot(iris, aes(Petal.Length, Petal.Width, color=model$cluster)) + geom_point()

#DIABETES
class.d <- diabetes$class
train <- diabetes[,-1]
clPairs(train,class.d)
model <- Mclust(train)
plot(model,what="BIC")
plot(model,what="classification")
plot(model,what="uncertainty")
plot(model,what="density")