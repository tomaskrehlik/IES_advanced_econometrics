educ_range <- 9:15 # Let's say we want education from 9:15
educ <- sample(educ_range, 50, replace = T)
epsilon <- rnorm(50, sd=300) # Generate 3000 normally distributed variables with sd=200
income <- 7000 + 100 * educ + epsilon # Set up some theoretical model

data <- data.frame(income = income, educ = educ)

ggplot_outliers <- function(data, y_of_outlier, x_of_outlier) {
  require(ggplot2)
  plot_data <- rbind(data, c(y_of_outlier, x_of_outlier))
  estim <- coef(lm(income ~ educ, data = plot_data)) # Gives the beta coefficients
  plot <- ggplot(aes(x=educ, y=income), data=plot_data)
  plot <- plot + geom_point()
  plot <- plot + geom_abline(intercept = 7000, slope = 100, aes(colour="red")) # Show the true line
  plot <- plot + geom_abline(intercept = estim[1], slope = estim[2], aes(linetype="dot")) # Show the estimate
  print(summary(lm(income ~ educ, data = plot_data)))
  print(plot)
}

m <- 7000 + 100 * (15-9)

library(manipulate)
manipulate(
  ggplot_outliers(data, y_of_outlier, x_of_outlier),
  y_of_outlier = slider(m-3*400,m+3*400),
  x_of_outlier = slider(9, 15)
  )