data <- read.csv("C:\\Users\\radha31\\Downloads\\cereals.csv", header = TRUE,
               stringsAsFactors = FALSE,
               strip.white = TRUE ,
               sep = ',')

str(data)

library("dplyr")
data<- select(data, calories,fat,sugars,fiber,sodium,rating)

head(data)

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
               trainNN, hidden = 3 , linear.output = T )

# plot neural network
plot(NN)

# Our model has 3 neurons in its hidden layer. 
# The black lines show the connections with weights.
# The weights are calculated using the back propagation algorithm 
# The blue line is the displays the bias term.

## Prediction using neural network

predict_testNN = compute(NN, testNN[,c(1:5)])
predict_testNN = ( predict_testNN$net.result )


plot(testNN$rating, predict_testNN, col='blue', pch=16, ylab = "predicted rating NN", xlab = "real rating")

abline(0,1)

cbind(testNN$rating ,predict_testNN)


