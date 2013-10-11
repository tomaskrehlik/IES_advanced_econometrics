data <- read.csv('/Users/tomaskrehlik/Documents/PHD/Advanced Econometrics/Seminars/0 - Introduction to R/Data manipulation and plotting/TOTPRODUCTION.csv', header=T) # header=T -> first row are names of variables
str(data)
data$Country
data$Country==Yemen
data$Country=="Yemen"
data[data$Country=="Yemen",]
subset(data, Country=="Yemen")

library(reshape)
data_melted <- melt(data, id.vars=c("Country", "Group"), variable_name= "Year")
head(data_melted)
names(data_melted) <- c("Country", "Group", "Year", "Production")
head(data_melted)
strings <- as.character(data_melted$Year) # Convert the factors to strings
# Now note that the strings have particular structure, we dont need anything behind the "." so I split the string by it
list1 <- strsplit(strings,"\\.") # The result is list with first entry that intrest us and the rest that does not
# Lets first make it an array. (This code is esotheric, but usefull for converting lists to arrays.)
list1 <- do.call(rbind, list1) # It essentially calls rbind function over the list
list1 <- list1[,1] # Select only first part
# Again we can split by "X"
list2 <- strsplit(list1, "X")
list2 <- do.call(rbind, list2)
list2 <- list2[,2]
year <- as.integer(list2)
data_melted$Year <- year # R is case sensitive!!!!
head(data_melted)

library(plyr)
ddply(data_melted, .(Year, Group), summarize, mean = mean(Production, na.rm=T))

bla_function <- function(vector) {
return(max(vector, na.rm=T)%%100) # Do the reminder of division by 100 from max value
}
ddply(data_melted, .(Year, Group), summarize, aa = bla_function(Production))

# Plotting
temp <- subset(data_melted, Country == "Brazil")
plot(temp$Year, temp$Production, type="p")
plot(temp$Year, temp$Production, type="l")
plot(temp$Year, temp$Production, type="h")

library(ggplot2)
plot <- ggplot(aes(x=Year, y=mean), data=ddply(data_melted, .(Year), summarize, mean = mean(Production, na.rm=T)))
plot + geom_point()

plot <- ggplot(aes(x=factor(Year), y=Production), data=data_melted)
plot + geom_boxplot()

plot <- ggplot(data_melted, aes(Year, Production))
plot + geom_point(aes(colour=Country))
plot <- ggplot(data_melted, aes(Year, Production))
plot + geom_line(aes(colour=Country))

plot <- ggplot(aes(x=factor(Year), y=Production), data=data_melted)
plot + geom_jitter(aes(colour=Country))

plot <- ggplot(aes(x=factor(Year), y=Production), data=data_melted)
plot + facet_grid(Group~.) + geom_boxplot() + scale_y_log10()
