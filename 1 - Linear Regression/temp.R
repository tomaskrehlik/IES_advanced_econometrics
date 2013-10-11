

data <- data.frame(age, educ, skill, income)

data$age2 <- (data$age)^2

summary(lm(income ~ ., data=data[1:3000,]))


