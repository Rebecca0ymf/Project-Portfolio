#if-else,if-else if-else, ifelse foubction
if(a > 22){
  print("h")
}else{print("g")
  }

if(a > 2){
  print("...")
}else if(b > 0){
  print("n")
}else{print("h")
}

d <- 3 
d <- 5
ifelse(d > 4, d, d*2)

# for  while
for(i in c(1:4)){
  print(i+1)
}

i <- 10
while (i < 15){
  print(i)
  i <- i+1
}

install.packages("tidyverse")
library(tidyverse)
# sT merging 
#inner_join(file1,file2,by="comdition")Take the intersection
#full_join(file1,file2, by ="comdition¡°)Fetching a merged set
#semi_join(file1,file2,by="comdition")Retain the "conditions" that appear in file2
#anti_join(file1,file2,by="comdition")Do not retain the contents of file2 where "condition" appears
#left_join(file1,file2,by="comdition")Keep all the contents of file1 and merge the contents of file2 over
#right_join(file1,file2,"")


#Descriptive data analysisi
set.seed(42) #After setting the same seed, the result of the subsequent samples is the same
test<-sample(1:10,30,replace=T)
mean(test)
set.seed(42)
weight<-sample(1:5,30,replace=T)
weighted.mean(test,weight)
sort(test) #Sort by samllest to largest
mode(test) #data type
sort(table(test),decreasing=T)
quantile(test,0.5)
quantitle(test,c(0.25,0.75))
#min();max()
range(test) #extreme value
#variance: variance model
var(test)

#standard diviation
sd(test)
sqrt(var(test))

summary(test) 

#install.packages("fBasics")
library(fBasics)
basicStats(test)
install.packages("psych")
library(psych)
describe(test)

# Hypothesis testing Means testing; Parameter testing
set.seed(42)
shapiro.test() #Whether or not it follows a normal distribution



#install.packages("readxl")
library(readxl)
read_excel("Testplan_week_2.xlsx")

#install.packages("R.utils")
library(R.utils)
unzip("RawData")

#install.packages("xlsx")
library(xlsx)

#install.packages("gdata")
library(gdata)
#install.packages("readxl")
library(readxl)

#install.packages("tidyverse")
library(tidyverse)
d.export_completedataset <- read.csv("C:/Users/lenovo/Downloads/RawData/RawData/20210805_06/export_data/export_completedataset.csv",header = T)
d.CompleteDataset <- read.csv("C:/Users/lenovo/Downloads/CompleteDataset.csv",header = T)

numeric_data <- subset(d.CompleteDataset, subset = dataType == "N")
numeric_data <- transform(numeric_data, value = as.numeric(value))
class(numeric_data$value)
#yeay we got it. Finally
#Lets get the batch names
dbatch <- split(numeric_data, numeric_data$batch)


#install.packages("stringr")
library(stringr)
library(tidyverse)
library(dplyr)
library(tidyr)
d.Dataset <- d.CompleteDataset %>% separate(timestamp, c("Year", "Time"), " ")
#d.batch <- d.Dataset %>% separate(batch, c("batch_OSDi", "batch_P","batch_Rampe","batch_number"), " ")
d.datatime <- d.Dataset %>% separate(Year, c("Year", "Month","Day"), "-")
d.06 <- filter(d.datatime, Day == "06")
str(d.06)
library(tidyverse)
library(lubridate)
#date.txt <- d.CompleteDataset %>% mutate_at(.vars = vars(timestamp), .fun = as.POSIXct)
newData <- d.CompleteDataset %>% 
  mutate_at(.vars = vars(value), .fun = as.numeric)
DP0003 <- filter(newData, variable == "DP0003" )
DP0006 <- filter(newData, variable == "DP0006" )
DP0007 <- filter(newData, variable == "DP0007" )
DP0010 <- filter(newData, variable == "DP0010" )
DP0011 <- filter(newData, variable == "DP0011" )
#d.DP0003 <- DP0003 %>% mutate_at(.vars = vars(timestamp), .fun = as.POSIXct)
d.DP0006 <- DP0006 %>% mutate_at(.vars = vars(timestamp), .fun = as.POSIXct)
d.DP0010 <- DP0010 %>% mutate_at(.vars = vars(timestamp), .fun = as.POSIXct)
main.compression <- select(d.compression,c("value","timestamp")) 



d.compression <- filter(newData, value <=8, value >= 5.95 )
d.precompresion <- filter(newData, value <=5.05, value >= 5 )
d.rotorspeed <- filter(newData, value <=100, value >= 50 )
main.compression <- select(d.compression,c("value","timestamp")) 
pre.compression <- select(d.precompresion, c("value","timestamp"))
rotor.speed <- select(d.rotorspeed, c("value","timestamp"))
timestamp <- select(d.rotorspeed, c("timestamp"))


data.frame(¡­, row.names = NULL, check.rows = FALSE,
            check.names = TRUE, fix.empty.names = TRUE,)
library(tidyverse)
library(lubridate)

df1 <- as.data.frame(list(v1, v2, v3, wday))
colnames(df1) <- c("v1", "v2", "v3", "wday")

plot(variable,value)

file_name$colum_name <- factor(file_name$colum_name,
                               levels = c("pass_name",""),
                               labels = c("new_name",""))


#plot(x, y, main="title", sub="subtitle",
#     xlab="X-axis label", ylab="y-axixlabel",
#     xlim=c(xmin, xmax), ylim=c(ymin,ymax))

#install.packages("esquisse")
library(esquisse)
esquisse::esquisser()

