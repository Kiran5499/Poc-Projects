df <- read.csv("C:\\Users\\radha31\\Downloads\\cereals.csv", header = TRUE,
               stringsAsFactors = FALSE,
               strip.white = TRUE ,
               sep = ',')

str(df)

library(e1071)
df$mfr = factor(df$mfr)
head(df)

library("dplyr")
finaldf <- select(df, mfr,calories,sugars,sodium,rating)

head(finaldf)

finaldf$mfr = factor(finaldf$mfr)

# iris.part = iris.part[, c(3,4,5)]
fit = svm(mfr ~ ., data=finaldf, 
          type='C-classification', kernel='rbf' , cost=0.6, gamma=100)

fit

#  plot(fit, finaldf)
# Error in plot.svm(fit, finaldf) : missing formula.

par(mfrow=c(2,2))

plot(fit, finaldf, rating ~ sugars ,
     col = c("red","green","blue","orange","pink","yellow","black"))


plot(fit, finaldf, rating ~ sodium ,
     col = c("red","green","blue","orange","pink","yellow","black"))


plot(fit, finaldf, rating ~ calories ,
     col = c("red","green","blue","orange","pink","yellow","black"))


library(e1071)
library(rgl)
library(misc3d)

library(plot3D)
# Plot original data
plot3d(finaldf, col = c("red","green","blue","orange","pink","yellow","black"))




sv <- svm(mfr ~ calories+sugars+rating, data=finaldf, 
          kernel="linear", scale=FALSE, type="C-classification")

W <- rowSums(sapply(1:length(sv$coefs), function(i) sv$coefs[i]*sv$SV[2,]))

plot3d(finaldf$calories, finaldf$sugars, finaldf$rating, 
        col= c("red","blue","green"), 
       size = 2, type='s', alpha = .6)
rgl.planes(a = W[1], b=W[2], c=W[3], d=-sv$rho, color="red", alpha=.8)


#install.packages("scatterplot3d") # Install
library("scatterplot3d") # load


# 3D scatter plot
s3d <- scatterplot3d(finaldf, type = "h", color = "blue",
    angle=55, pch = 16)
