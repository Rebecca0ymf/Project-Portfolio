#ctrl+l Clear all
#plot table (you can view the table at the bottom right)
# runuf() function with a range of 0 to 1 obeys the normal distribution of random numbers, and each generation is not the same
list.files() # view the files inside the default folder ps: (character(0) because there is nothing inside the folder)
# <- assign to a local variable <<- assign to a global variable
# ls()=list objective list current variable; str() list details of variable; ls.str() list current variable + details; rm=remove objective.
# rm(list=ls()) removes all objects from workspace; history() lists history functions; history(25) lists last 25
#save.image retains data periodically



5:(2*3+10)  ##Results are the same as 5:16
# The post-entry is a commentary and will not be executed by R

3^4   # Power functions

# Calculate the remainder of 31 divided by 7
31 %% 7 

#Quotient of 31 divided by 7
31%/% 7


# variable.names£º
variable.names()


#Symbolic assignment
variable.name1 <- c(1:36)
c(2:37) -> variable.name2
variable.name3 <- lm(variable.name2 ~ variable.name1)
summary(variable.name3)
# lm function (linear regression)
# myfit <- lm(formua,data) formula refers to the model model to be fitted and data is a data frame containing the data used to fit the model.
# The result object (myfit) is stored in a list and contains a lot of information about the fitted model. The expression (formula) takes the following form
#Y~X1+X2... +Xn
#variable.name2 Dependent variable
#variable.name1 independent variable
variable.name4 <- summary(variable.name3)

# function assign("object name" , object value)
assign("variable.name6",c(2:17))
variable.name6

# ctrl+shift+c Comment code (code comments, code is retained but R is not executed)


# data types
{#numeric number
  num.1 <- 123
  num.1
  #Type function
  mode(num.1)
  #Judgment function
  is.numeric(num.1)
  num.2 <- 1.23
  num.2
  is.numeric(num.2)

# character
char.1 <- "Hello,world."
mode(char.1)
is.character(char.1)
is.numeric(char.1)
char.2 <- "123"
mode(char.2)

#transformation function
as.numeric(char.2)
as.character(num.2)

# logical
TRUE; T
FALSE; F
mode(TRUE)
is.logical(T)
is.logical(F)
is.numeric(T)
is.character(T)

as.numeric(T)
as.numeric(F)
as.logical(1)
as.logical(0)
as.logical(11)
as.logical(-11)
#Numeric to logical conversions, all non-zero values are TRUE

as.character(TRUE)
as.character(F)
as.logical("T")
as.logical("FALSE")
as.logical("false")
as.logical("True")
as.logical("t")
as.logical("TYYH")
#NA=NOT VALUABLE 
as.logical("aa")
as.logical("100")
as.logical('1')
}


#  2.2 Data structures/vectors/integers/matrix/data.frame/list list
{
  # vector
vec.1 <- c(1:3)
vec.1
is.vector(vec.1)
class(vec.1)
#integer


vec.2 <- c("a","b","c")
is.vector(vec.2)
class(vec.2)
class(vec.2)
#c is a concatenation function
vec.3 <- c(T,T,F)
vec.4 <- c(1,"a")
vec.4
class(vec.4)
vec.5 <- c(1,T)
vec.5
class(vec.5)
vec.6 <- c("a",T)
class(vec.6)
vec.7 <- c(1,T,"a",T)
class(vec.7)
#Transformation priority: character > numeric > logical

x <- c(0,7,8)
numbers5to20 <- (5:20)
some.numbers <- c(numbers5to20, x )
as.mess <- c(some.numbers, x, 4:1)
as.mess[22] #[] The bit-order index of the number in the square sign in the original vector (index)
as.mess[4]
as.mess[c(3,9,17)]
as.mess[-c(9,17,19)] # negative index can be used to circumvent some elements
as.mess[x] # zero index does not return anything. Extracting elements in as.messs with x


#matrix matrix function
#matrix function composition: parameters (elements (usually vectors) + dimensional information (nrow rows,ncol columns) + byrow (T - arrange by rows / F - arrange by columns))
mat.1 <- matrix(c(1:4),nrow = 2,  byrow = T)
mat.1
is.matrix(mat.1)
class(mat.1

mat.2 <- matrix(c("a","b","c","d","e","f"), nrow = 3, ncol = 2, byrow = F)
is.matrix(mat.2)
class(mat.2)

as.matrix(vec.1)
y <- (1:6)
as.matrix(y)
as.vector(mat.2)

#  data.frame
df.1 <- data.frame(col1 = c(1:3), col2 = c("a","b","c"), col3 = c(T,F,T))

is.data.frame(df.1)
class(df.1)

as.data.frame(vec.1)
as.data.frame(mat.2)
class(as.vector(df.1))   #data.frame cannot be converted to a vector
as.matrix(df.1)

#list
ls.1 <- list(component1 = c(1:3),
             component2 = matrix(c(1:4), nrow = 2),
             component3 = data.frame(col1 = (1:3)))
is.list(ls.1)
class(ls.1)

as.list(mat.1)  #Convert mat.1 to lis
#list release function
unlist(ls.1)
}

# 2.3 Data object attributes
# dimension dim (how many rows, how many columns)
dim(mat.2) # (returns a result of 3 2, which is three rows and two columns)
dim(df.1)

vec.7 <- c(1,2,3,4)
dim(vec.7) <- c(2,2)
vec.7

length(vec.1)
length(ls.1)
dim(ls.1)

#Index
#vector index
vec.1[c(1,3)]
vec.2[c(1,3)]   #index the first element and the third element of vec.2, index multiple functions with a "c" link

#Matrix indexing
mat.1[2] #Matrices are filled by column
mat.1[1,2]
mat.2[2,] #returns a separate row
mat.2[,2] #returns individual columns
class(mat.2[,2])   

#Data Box Index
df.1[1]
class(df.1[1])
df.1[[1]]
df.1["col1"]
df.1[["col1"]]
df.1$col1
df.1[1,]
df.1[1,1]
class(df.1[1:2,1])
df.1["2","col3"]

#List Index
class(ls.1[2])
ls.1[[2]]
ls.1[[2]][,2]
ls.1["component2"]
ls.1[["component2"]]
ls.1$component1

#names
names(vec.1) <- vec.2
names(vec.1)

dimnames(mat.1) <- list(c("rl","r2"),c("c1","c2")) 
# Two vectors to make a list, one for the row names and one for the column names
dimnames(mat.1)

rownames(df.1)
colnames(df.1)
names(df.1)

names(ls.1)


#2.4 Special values
#Constants
letters
LETTERS #Letters
LETTERS[1:3]
month.name   
month.abb #Abbreviation
pi

# NA, Inf, -Inf, NaN, NULL
# NA: not avaliable, missing value
length(vec.1) <- 4
vec.1


vec.7 <- c(1,2,3,4)
vec.7
dim(vec.7) <- c(2,2)

#Inf positive infinity -Inf negative infinity
2^1024
-1/0
1/0

#NaN No meaningful result
Inf-Inf
0/0

#NULL means the parameter is not assigned a value
dim(ls.1)

###Basic operations of R
##3.1 Mathematical operations

###Add (plus/add) subtract (minus) multiply (times/multiplied by) divide (divide... .into)
c(2,4,5)+c(3,6) #c(3,6) for circular addition
c(2,4,5)-c(3,6,9,10)
c(2,4,5)*c(3,6)
c(2,4,5)/c(3,6)

#quotient
2%/%3
3%/%2

# the remainder
2%%3
3%%2
 
# exponentiation   square root
2^3
27^(1/3)

# summation
sum(vec.1)
vec.0 <- c(1,2,3)
sum(vec.0)
vec.7 <- c(8:12)
sum(vec.7)
sum(1:10)

#   product
prod(vec.7)

#cumulative sum
cumsum(vec.7)

#Cumulative product
cumprod(vec.7)

#Round to the specified number of decimal places
round(4.543672,4)
round(4.6876,2)

#ceiling ceiling rounds the argument number upwards, along the direction of increasing absolute value
ceiling(4.6)
ceiling(4.2)

# floor
floor(4.6)

#Matrix transpose
t(mat.1)

#Matrix multiplication matrix multiplication
mat.3 <- matrix(c(3:8), nrow = 2)
mat.1 %*% mat.3

#Matrix determinant
det(mat.1)

# matrix trace
sum(diag(mat.1))

#inverse of a matrix
solve(mat.1)

#solve a system of linear equations
mat.4 <- matrix(c(7,8),nrow = 2)
# mat.1 %*% x = mat.4
solve(mat.1,mat.4)



n <- 1000
n jnn n n nj  m l;'
;           '
prod(1:5)
prod(1:26)

# prod function, if A is a vector, prod(A) returns the product of the vectors of A; 
#if A is a matrix, prod(A) treats A as a column vector, returns the product of the elements of each column and forms a row vector B
M <- matrix(c(8:19),nrow=3)
M
prod(M)
matrix(c(1:6),nrow=3)
prod(matrix(c(1:6),nrow=3))


# 3.2 Character operations
# Character length
nchar(char.1)
nchar(vec.2)
vec.8 <- c("Hello ", "world", "1998")
nchar(vec.8)

#Character concatenation
paste(char.1,char.2, sep = " ")
nchar(paste(char.1, vec.1, sep = "--"))
paste(colnames(df.1), collapse = "+")

# character splitting
strsplit(char.1, split = ",")
unliststrsplit(char.1, split = ","))

# character substitution
gsub(",", "!" , char.1)
gsub("H", "!" , char.1)

# Convert uppercase letters
toupper(char.1)

#Convert to lowercase
tolower(char.1)


###### 3.3 Logical operations/whether/with or without
{
  # whether equal
  2 == 3
  
  # if not equal
  2 ! = 3
  
  # Is it greater than
  2 > 3
  
  #Is it greater than or equal to
  2 >= 3
  
  # Is it less than
  2 < 3
  
  # Is it less than or equal to
  2 <= 3
  
  # whether it is contained
  2 %in% c(2:3)
  3 %in% c(4:9)
  
  2 %in% c(2:3) & 3 %in% c(4:9)
  2 %in% c(2:3) | 3 %in% c(4:9)
  
  
  # with &
  (2 <= 3 ) & (4 <= 5)
  (2 <= 3) & (4 >= 5)
  # or |
  (2 >= 3 ) | (4 <= 5)
  (2 <= 3) | (4>= 5)
  # Not !
}

### Conditional and looping statements
# - conditional statements
# if-else constructs
{
a <-  2
if(a > 2){
  print("a > 2")
} else{
  print("a < 2")
}


xx <- c(2:10)
if(xx > 19){
  print("xx > 19")
} else{
  print("xx <= 19")
}


# if-else if-else structure
b <- 1
if(b > 2){
  print("b > 2")
}else if(b > 0){
  print("b <= 2, but b > 0")
} else{
  print("b <= 0")
}
#Two if's can have two conditional judgments, each with two conditions following the if, using {}

#ifelse function
d <- 2
ifelse(d > 4, d, d*2) #(define condition, output result if condition is met, output result if other)


## - Loop statements
#for loop i is the loop factor, (i in XX) i loops in the range XX
for(i in c(1:2)){
  print(i + 1)
}

for(i in c(19:24)){
  print(i + 2)
}

# while
i <- 10
while(i < 15){
  print(i)
  i <- i+1
}

i <- 100
while(i > 1){
  print(i)
  i <- i-1
}
}

###3.5 Custom Functions
choose(10,4)
choose(5,3) #choose function finds how many possibilities/combinations (overall, number of choices)
choose(4,3)
factorial(4) #multiply by order
factorial(6)


my.permutation.func <- function(argument1, argument2){
  result <- choose(argument1, argument2) * factorial(argument2)
  return(result)
}
my.permutation.func(6,3)

# Custom binary operations
"%npm%" <- function(n,m){
  choose(n,m) * factorial(m)
}
10 %npm% 4

"%nn%" <- function(n,m){
  choose(n,m) * factorial(n)
}
3 %nn% 2

###Package Management
### View installed packages
library()

### View loaded packages
(.packages())

# View package version overview
packageStatus()

# -Install packages
plot.missing(airquality)
# 1. install by code
install.packages()

# View package help
help(package = "")

### Help, code writing style
##### for help
### Function help
help(lm)
? lm
example(lm)

# Keyword help
help.search("regression")
? ? regression

##### data generation function
# random numbers
rnorm(100, mean = 10, sd = 2)
rnorm(10, mean = 3, sd = 1) # normal distribution normal distribution, sd (standard diviation) standard deviation
runif(100, min = 1, max = 10) #uniform distribution

dnorm
pnorm
qnorm
rnorm

# Random variable distribution series functions
dnorm(100, mean = 10, sd = 2)
dnorm(12, mean = 10, sd = 2)
dnorm(0.67, mean = 10, sd = 2)

#rep function and usage 
# rep(x, time = , len = , each = ) 
# x represents the repetition object, times the repetition number, each represents the repetition number of each element of the vector, length.out represents the output length
rep(1,10) #repeat The repetition function
rep(c(1:3), times = 2)
rep(c(1:3), times = c(3:1))
rep(c(1:3), times = c(2:3))
rep(c(1:3), each = 2)
rep(c(1:3), each = c(3:1))
rep(c(1:3), each = c(2:3))

rep(c(1:3), each = 2, times = 3)
rep(c(1:3),  each = 2)

rep(c(1:3), times = 5, len = 7)
rep(c(1:3), each = 2, len = 5)
rep(c(1:3), each = 2, times = 2, len =10)

# seq function and usage
# seq(from, to, length, by) by = ((to -from)/(lenght.out-1))
1:10
seq(from = 1, by = 1.5, length = 6)
seq(from = 1, to =10, by=1.3)
seq(from = 1, to =10, length = 5)

# Random sampling
# sample(x, size = , replace = ) 
# random sampling of the range x; size the number of elements in the vector; replace whether to repeat the sampling of the elements; prob the probability of each function being sampled
sample(1:10, size = 15, replace = T)
sample(1:15, size = 5, replace = F)
sample(1:10, size = 10, replace = T, prob = c(rep(0.05,9),0.55))
sample(1:15, size = 15, replace = T, prob = c(rep(0.05,14),0.55))

data <- data.frame(a=c(1,2,3,4,5),b=c(3,4,5,6,7))
sample(data, size = 1, replace = T)
data[sample(nrow(data),2,replace = F)]

# stratified sampling
library(sampling)
# install.packages("sampling")
head(iris)
head(iris, n =10)
table(iris$Species) #table makes a statistic 
# strate £¬ stratanames £¬ size£¬method"srswr "¡°srswor ¡±
strata(iris, stratanames = "Species", size = c(3:5), method = c("srswr")) 
strata(iris, stratanames = "Species", size = c(3:5), method = c("srswor"))


# Import and export of data
{
  # text file
  text.t <- read.table(file.choose(), header = T, sep = "\t")
  text.c <- read.table(file.choose(), header = F, sep = ",")
  #header: "T" first row for column name, "F" first row for data
  # sep What symbol between the data is used as a splitting symbol
  
  #csv file
  csv <- read.csv(file.choose())
  
  # excel-xls/xlsx file
install.packages("readxl")
library(readxl)
excel <- read_excel(file.choose())
class(excel)

#SAS\Stata\SPSS data files
install.packages("haven")
library(haven)
help(package = "haven")

#Batch data import
files <- list.files("")

data.df <- data.frame()
for(i in 1:length(files)){
  filepath.i() <- paste("",
                        files[i], sep = )
  data.i <- read_excel(filepath.i)
  data.df <- rbind(data.df, data.i)
}

data.ls <- list()
for (i in 1:length(files)){
  filepath.i <- paste("", 
                      files[i],sep = )
  dtat.ls[[i]] <- read_excel(filepath.i)
}


#Data Export
Write.table(txt.t, "txt2.txt", sep = "\t", row.names = F)
Write.table(csv, "csv2.csv", sep = ",", row.names = F)

}

### Data collation
install.packages("tidyverse")
library(tidyverse)

test <- data.frame(x = rnorm(10, mean = 50, sd = 5),
                   y = sample(letters[1:3], 10, replace = T),
                   z_1 = 1:10,
                   z_2 = 2:11)

#Sample filter ("==" means all equal)
test %>% filter(x > 50)
test %>% filter(x > 50 & y == "a")
test %>% filter(x > 50 & z_1 %in% c(1:20))

# filter variables
test %>% select(y) 
test %>% select(starts_with("z"))
test %>% select(ends_with("1"))

test %>% filter(x > 50) %>% select(y)

# Generate new variables
test %>% mutate(x_1 = x+1,
                x_2 = x_1 +1,
                x_3 = if_else(x_2 > 50, 1, 0))

test %>% filter(x>50) %>% select(x) %>% mutate(x_1 = x+1,
                                               x_2 = x_1 +1,
                                               x_3 = if_else(x_2 > 50, 1, 0)
                                               )%>% arrange(x)

# sort
test %>% arrange(x)
test %>% arrange(desc(x))#decsc desc
test %>% arrange(x,y)
test %>% arrange(y,x)


# length and width data conversion
library(tidyverse)
dat <- data.frame(year = 2011:2015,
                  a_city = rnorm(5, mean = 1),
                  b_city = rnorm(5, mean = 2),
                  c_city = rnorm(5, mean = 3))
dat
dat.long <- gather(dat, key = "city", value = "gdp", -year)
dat.long

spread(dat.long, key = city, value = gdp)
spread(dat.long, key = year, value = gdp)

#DataMerge
library(tidyverse)

test.1 <- data.frame(a = letters[1:3],
                     b = rnorm(3))
test.2 <- data.frame(a = letters[4:6],
                     c = 1:3)
test.3 <- data.frame(a = letters[3:5],
                     c = c(4,1,5))
bind_rows(test.1, test.2, test.3) #combine by rows
bind_cols(test.1, test.2, test.3) #combine by columns

inner_join(test.2, test.3, by = "a") #Intersection
full_join(test.2, test.3, by = "a") # for the union

semi_join(test.2, test.3, by = "a") #filter operation, test.2 values appear in test.3 when
anti_join(test.2, test.3, by = "a") #filter the variables that appear in test.3

left_join(test.2, test.3, by = "a") #Filter the left database to join the data of test3
right_join(test.2, test.3, by = "a") 

install.packages("RJDBC")

install.packages("rJava")
install.packages(DBI)

library(RODBC)
install.packages("RODBC")


### Descriptive data analysis
set.seed(42)
  <- sample(1:10, 30, replace = T)

#Arithmetic mean
mean(test)
sum(test)/length(test)

#weighted mean
set.sedd(42)
weight <- sample(1:5, 30, replace = T)
weighted.mean(test,wight)

t(test) %*% weight / sum(weight)
crossprod(test,weight) / sum(weight)

#median
median(test)
sort(test)[15]
sort(test)[16]

#mode
mode(test)
sort(table(test),decreasing = T)

#quantile
quantile(test, 0.5)
quantile(test, c(0.25,0.75))


# Data-based data analysis
set.seed(42) 
test <- sample(1:10,30,replace = T)

# Arithmetic mean
mean(test)
sum(test)/length(test)

# Weighted average value
set.seed(42)
weight <- sample(1:5, 30, replace = T)
weighted.mean(test,weight)


