
#Lab 11 Code ( Untested )

# Multilayer perceptron

#installing packages
install.packages("neuralnet")
library("neuralnet")
data <- data.frame(name = c("A","B","C","D","E","F","G","H"),x=
                     c(0.0,1.0,2.0,3.0,4.0,5.0,6.0,7.0),
                   y = c(0.0,1.0,2.0,3.0,4.0,5.0,6.0,7.0),
                   output = c(0,1,1,0,1,1,1,0))

#Scaling the data
maxs <- as.numeric(apply(data[2:length(data)],2,max))
mins <- as.numeric(apply(data[2:length(data)],2,min))


# 2 used as argument suggests that the function
#is applied to each column indivisually

scale <- as.data.frame(scale(data[2:length(data)],
                             center = mins,
                             scale = maxs - mins))

#scale can't be applied to non numeric values

#random sampling

samplesize = 0.60*nrow(data)
set.seed(80)
index = sample(seq_len(nrow(data)), size = samplesize)
train_ <- scale[index,]
test_ <- scale[index,]

# Defining our network

NN = neuralnet(output~x+y, train_, hidden = c(3,3), linear.output = T)
plot(NN)


#Prediction
predict_testNN = compute(NN, test_[,c(1:2)])
predict_testNN = (predict_testNN$net.result
                  *(max(data$output)-min(data$output)))
+ min(data$output)


#calculating the Root mean square error (RMSE)
# Below code is not working

#RMSE = (sum((test_unscaled$output - predict_testNN)^2)
 #       /nrow(test_unscaled))^0.5
