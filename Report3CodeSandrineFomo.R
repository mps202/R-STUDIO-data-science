# Load necessary packages
library(leaps)
library(caret)
library(pROC)

#### Read in data
heartAt.df <- read.csv("Heart Attack.csv")
str(heartAt.df)  # Structure of the data frame
head(heartAt.df, 9)  # Show first 9 records
tail(heartAt.df)   # Show last 6 records
View(heartAt.df)

##### Summary statistics output 
library(dplyr)
library(psych)
describe(heartAt.df)

# Remove observations with missing values
heartAt.df <- na.omit(heartAt.df)

# If the target variable Y is categorical with 2 classes, convert to 1 and 0;
# Convert response variable "class" to 0 and 1
## 0 represents "negative", 1 represents "positive"

heartAt.df$class <- as.numeric(as.factor(heartAt.df$class)) - 1

# check the Structure of the data frame again
str(heartAt.df)  

# Partition data into training and validation sets
set.seed(2) # Set seed for reproducibility
train.index <- sample(1:nrow(heartAt.df), 0.6 * nrow(heartAt.df))  
train.df <- heartAt.df[train.index, ]
valid.df <- heartAt.df[-train.index, ]

str(train.df)
str(valid.df)

# Run logistic regression with all predictors
logit.reg <- glm(class ~ ., data = train.df, family = "binomial") 
summary(logit.reg)



library(caret)
# Assess relative importance of predictors
var_importance <- varImp(logit.reg)

# Plot relative importance
plot(var_importance$Overall, main = "Relative Importance of Predictors", xlab = "Predictors", ylab = "Importance", xlim = c(0, max(var_importance$Overall) * 1.1))
text(var_importance$Overall, labels = rownames(var_importance), pos = 4, cex = 0.8)


# Create classification confusion matrix for validation data
pred <- predict(logit.reg, valid.df, type = "response")    
c.mat <- table(ifelse(pred > 0.5, 1, 0), valid.df$class) 
c.mat  
accuracy <- sum(diag(c.mat))/sum(c.mat)
sensitivity <- c.mat[2,2]/sum(c.mat[,2])
specificity <- c.mat[1,1]/sum(c.mat[,1])
accuracy
sensitivity
specificity

# Create classification confusion matrix for training data
pred <- predict(logit.reg, train.df, type = "response")
c.mat <- table(ifelse(pred > 0.5, 1, 0), train.df$class) 
c.mat
accuracy <- sum(diag(c.mat))/sum(c.mat)
sensitivity <- c.mat[2,2]/sum(c.mat[,2])
specificity <- c.mat[1,1]/sum(c.mat[,1])
accuracy
sensitivity
specificity

# Load the MASS package
library(MASS)

# Perform stepwise variable selection
step <- stepAIC(logit.reg) 
step$anova

# Estimate LR model chosen by stepwise method
logit.reg <- glm(class ~ . + age + gender + kcm + troponin - glucose - pressurehight - impluse - pressurelow, data = train.df, family = "binomial") 
summary(logit.reg)

# Assess relative importance of predictors
varImp(logit.reg)
plot(varImp(logit.reg))

library(caret)
# Assess relative importance of predictors
var_importance <- varImp(logit.reg)

# Plot relative importance
plot(var_importance$Overall, main = "Relative Importance of Predictors", xlab = "Predictors", ylab = "Importance", xlim = c(0, max(var_importance$Overall) * 1.1))
text(var_importance$Overall, labels = rownames(var_importance), pos = 4, cex = 0.8)




# Create classification confusion matrix for validation data after stepwise selection
pred <- predict(logit.reg, valid.df, type = "response")    
c.mat <- table(ifelse(pred > 0.5, 1, 0), valid.df$class) 
c.mat  
accuracy <- sum(diag(c.mat))/sum(c.mat)
sensitivity <- c.mat[2,2]/sum(c.mat[,2])
specificity <- c.mat[1,1]/sum(c.mat[,1])
accuracy
sensitivity
specificity

# Plot ROC curve
roc_score <- roc(valid.df$class, pred)
plot(roc_score, main = "ROC curve -- Logistic Regression")
roc_score$auc

# Create classification confusion matrix for training data
pred <- predict(logit.reg, train.df, type = "response")
c.mat <- table(ifelse(pred > 0.5, 1, 0), train.df$class) 
c.mat
accuracy <- sum(diag(c.mat))/sum(c.mat)
sensitivity <- c.mat[2,2]/sum(c.mat[,2])
specificity <- c.mat[1,1]/sum(c.mat[,1])
accuracy
sensitivity
specificity

# Plot ROC curve
roc_score <- roc(train.df$class, pred)
plot(roc_score, main = "ROC curve -- Logistic Regression")
roc_score$auc


