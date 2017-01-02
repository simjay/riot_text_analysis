##########################################
###             Classifiers            ###
##########################################
### 1. K Nearest Neighbors             ###
### 2. Suppor Vector Machine           ###
### 3. Random Forest Classifier        ###
##########################################

load("./models.RData")
require(class) # K Nearest Neighbor
require(e1071) # Support Vector Machine
require(randomForest) # Random Forest

trainset = read.csv("trainset.csv", check.names=FALSE)
testset = read.csv("testset.csv", check.names=FALSE)

numbTrainDocuments = dim(trainset)[1]
numbTrainFeatures = dim(trainset)[2] -1
numbTestDocuments = dim(testset)[1]
numbTestFeatures = dim(testset)[2] -1

trainset$`_label_` <- as.factor(trainset$`_label_`)
testset$`_label_` <- as.factor(testset$`_label_`)

train_x = trainset[,1:numbTrainFeatures]
train_y = c(trainset$`_label_`) - 1
test_x = testset[,1:numbTestFeatures]
test_y = c(testset$`_label_`) - 1

##########################################
###               Models               ###
##########################################

# 1. K Nearest Neighbors 
riot.knn.cv <- tune.knn(x = train_x, y = as.factor(train_y), k = 1:20, tunecontrol = tune.control(sampling = "cross"), cross=10)
knn(train_x, train_x, train_y, k=20)

# 2. Suppor Vector Machine
riot.svm <- svm(x = train_x, y = as.factor(train_y), kernel = 'linear', gamma = 0.0001, cost = 0.01)
riot.svm.n <- svm(x = train_x_normalized, y = as.factor(train_y), kernel = 'linear', gamma = 0.0001, cost = 0.01)
riot.svm.cv <- tune.svm(`_label_` ~ ., data = trainset, kernel="linear",
                   cost=c(0.0001,0.001,0.01,0.1,1,10), gamma=c(0.0001,0.001,0.01,0.1))

# 3. Random Forest Classifier
riot.rfc <- randomForest(x = train_x, y = as.factor(train_y), ntree = 300, mtry = 400)
riot.rfc.cv <- tune.randomForest(x = train_x, y = as.factor(train_y), ntree = c(50,100,200), mtry = c(200,300))
riot.rfc.cv2 <- tune.randomForest(x = train_x, y = as.factor(train_y), ntree = c(200,300,400), mtry = c(300,400,500))

##########################################
###           Error Measuring          ###
##########################################

get_error_rate <- function (prediction, label) {
  return(sum(prediction != label)/length(label))
}

get_false_postive_ratio <- function (prediction, label) {
  
  acutal_negative = which(label == 0)
  predicted_positive = which(prediction == 1)
  numb_false_positive = sum(acutal_negative %in% predicted_positive)
  
  return(numb_false_positive/length(acutal_negative))
}

get_false_negative_ratio <- function (prediction, label) {
  
  acutal_positive = which(label == 1)
  predicted_negative = which(prediction == 0)
  numb_false_negative = sum(acutal_positive %in% predicted_negative)
  
  return(numb_false_negative/length(acutal_positive))
}


##########################################
###               Testing              ###
##########################################
get_error_rate(predict(riot.svm, train_x), train_y)

get_error_rate(predict(riot.svm, test_x), test_y)

get_error_rate(predict(riot.rfc, train_x), train_y)

get_error_rate(predict(riot.rfc, test_x), test_y)

