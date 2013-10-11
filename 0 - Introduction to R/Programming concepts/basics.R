# Set a scalar
x <- 10

# Set a vector
v <- c(3,4,5)
# a = 4 7 6 8

# Set a matrix
M <- matrix( c(1,2,3,4,5,6,7,8,9), byrow=TRUE, ncol=3)

# Summing and multiplying scalars
x*x
x^3
x+x
sqrt(x)
# etc...
M%*%M # Matrix multiplication is %*%
M%*%v # Multiply by vector
t(M) # Transpose

# Make a sequence
1:5

M <- matrix( 1:9, byrow=TRUE, ncol=3) # command is equal to the above creating the matrix
# it is particularly useful when you have big matrices

# Loops
# If you want to perform an operation multiple times you will use for loop or while loop
# For loop -> you know how many times you want to do the operation
# while loop -> you dont know how many times, but you have a variable that will turn FALSE when it should stop

# Easy loop, prints 1, 5, 5
for (j in c(1,5,6)) {
  print(j)
}

# The loop above does the following commands
j = 1
{print(j)}
j = 5
{print(j)}
j = 6
{print(j)}

# You can put anything into the iterating vector
for (i in c("auto","motorka")) {
  print(i)
}

# When do you use for loop? When you know how many times it will run!
# The following example shows a weighted mean example

# Generate something that looks like stock price
x <- cumsum(rnorm(900)) # cumsum -> cummulative sum of vector, rnorm(900) -> generate 900 standard normal values
output <- c() # make a variable into which I will store the means
for (i in 1:850) { # The loop will run 850 times, because I am taking window 50 and have total of 900 observations
  value <- mean(x[1:50+i]) # Take values i+1 to i+50 from vector x and take mean
  output <- c(output, value) # Add (in programming: append) the "value" to the vector of output
}
  
# While is a type of loop that is repeating the code until some condition is evaluated as false
i <- 2 # Set i equal to 2
while (i < 100) { # The condition here is (i<100) which is true if i<100 and false otherwise, so if i>100 the code will stop repeating
  i <- i^2 # Make i bigger. If I didn't do this the code would run forever! Do you see why?
  print(i) # Print the value
}

# Typically you might want to use while when you dont know how many times the function will have to loop
# A textbook example is either optimizing some criterion. Another example might be if you wanted a first Fibonacci
# number higher than some value. Fibonacci series is hard to analyse so it is not obvious how many times you have to evaluate.
# Here is first Fibonacci number higher than 1000
fib_series <- c(0,1) # If you dont know what is Fibonacci, look here http://en.wikipedia.org/wiki/Fibonacci_number

while (fib_series[length(fib_series)]<1000) { # length() tells me how long is the vector. So in here I am asking if last number is lower than 1000
  n <- length(fib_series)
  fib_series <- c(fib_series, fib_series[n-1]+fib_series[n]) # Next fib number is defined as sum of previous two fib_series[n-1]+fib_series[n]
}
print(fib_series[length(fib_series)])


# Conditionals
# Evaluate the code only if some variable is TRUE

i <- 1000

if (i > 100) {
  print("i is bigger than 100.")
} else {
  print("i is lower or equal to 100.")
}