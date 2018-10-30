
#  RTextTools package.

library(e1071)
library(RTextTools)

data <- read.csv("C:\\Users\\radha31\\Downloads\\sunnyData.csv", header = TRUE,
                 stringsAsFactors = FALSE,
                 strip.white = TRUE ,
                 sep = ',')

print(str(data))

# Create the document term matrix
dtMatrix <- create_matrix(data["Text"]) 

# Configure the training data
container <- create_container(dtMatrix, data$IsSunny, trainSize=1:11, virgin=FALSE) 

# train a SVM Model
model <- train_model(container, "SVM", kernel="linear", cost=1, gamma=100)

# new data
predictionData <- list("sunny sunny sunny rainy rainy", 
                       "rainy sunny rainy rainy", "hello", "",
                       "this is another rainy world") 

# create a prediction document term matrix 
# create a prediction document term matrix
predMatrix <- create_matrix(predictionData, originalMatrix=dtMatrix )

# trace("create_matrix",edit=T)
# create the corresponding container
predSize = length(predictionData);
predictionContainer <- create_container(predMatrix, 
                                        labels=rep(0,predSize),
                                        testSize=1:predSize, virgin=FALSE) 

# predict
results <- classify_model(predictionContainer, model)
results




predictionData2 <- c("Happy movie", 
                       "Ugly cricket sorrow", "Happy world", "Happy cricket friend",
                       "Ugly happy cricket") 
predictionData2  <- as.data.frame(predictionData2)

cbind(predictionData2,results)


