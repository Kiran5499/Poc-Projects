data <- read.csv("C:\\Users\\radha31\\Downloads\\cereals.csv", header = TRUE,
                 stringsAsFactors = FALSE,
                 strip.white = TRUE ,
                 sep = ',')

str(data)

library("dplyr")
data<- select(data, calories,fat,sugars,fiber,sodium,rating)

head(data)
scaleddata<-scale(data) # sacle

# Random sampling
samplesize = 0.80 * nrow(data)
set.seed(80)
index = sample( seq_len ( nrow ( data ) ), size = samplesize )

# load library
library(neuralnet)
# creating training and test set
trainNN = data[ index, ]
testNN = data[ -index, ]
# fit neural network
set.seed(222)
# fit neural network


NN = neuralnet(rating ~ calories + sugars + fat + sodium + fiber,
               trainNN, hidden = 10 , linear.output = T )

# plot neural network
plot(NN) 


predict_testNN = compute(NN, testNN[,c(1:5)])
predict_testNN = ( predict_testNN$net.result )
plot(testNN$rating, predict_testNN, col='blue', pch=16, ylab = "predicted rating NN", xlab = "real rating")
abline(0,1)
cbind(testNN$rating ,predict_testNN)



nn.results <- compute(NN, testNN[,c(1:5)])
results <- data.frame(actual = testNN$rating, prediction =predict_testNN)
results
deviation = (results$actual-results$prediction)/results$actual
accuracy=1-abs(mean(deviation))
accuracy
