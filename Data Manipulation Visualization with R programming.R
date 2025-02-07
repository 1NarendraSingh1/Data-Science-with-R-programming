#Different types of charts and graphs in R

"""Pie chart
Bar Chart
Histogram
Kernal Density plots
Lie chart
Box Ploit
Heat map
Word CLoud"""
#DPLYR package used to transform and summarize data into rows and columns
"""1. filter() – Selects rows based on conditions

2. select() – Selects specific columns

3. mutate() – Creates new columns or modifies existing ones

4. arrange() – Sorts rows based on column values

5. summarize() / summarise() – Computes summary statistics

6. group_by() – Groups data for aggregation

7. rename() – Renames columns

8. distinct() – Removes duplicate rows

9. count() – Counts occurrences of unique values

10. left_join(), right_join(), inner_join(), full_join() – Joins datasets"""
#Installing DPLYR Pckages 

install.packages("dplyr")

library("dplyr") #call it by using library function

#importing new york flights data

install.packages('nycflights13')
library(nycflights13) #call it by using library function

View(flights)
head(flights)

#subset of data using filter function

f1<- filter(flights, month==7)
f1
View(f1)

f2<- filter(flights, month==7, day==3)
f2
View(f2)

View(filter(flights,month==8,origin=='LGA'))

#or

#flights['origin'].unique()?
head(flights[flights$month==9 & flights$day==2 & flights$origin=='LGA', ])

#Slice()allow us to slect rows by position
slice(flights,1:5)
slice(flights,5:15)

#mutate() used to add new column/ variables

overall_dealay <-mutate(flights,overall_delay=arr_delay-dep_delay)
head(overall_dealay)
View(overall_dealay)

#transmute() ise used to display only new column

overall_dealay <-transmute(flights,overall_delay=arr_delay-dep_delay)
View(overall_dealay)

#summarize() is used to find descriptive statistics

summarise(flights,avg_airtime=mean(air_time,na.rm=T))
summarise(flights,avg_airtime=sum(air_time,na.rm=T))
summarise(flights,avg_airtime=sd(air_time,na.rm=T))
summarise(flights,avg_airtime=mean(air_time,na.rm=T),sd_airtime=sd(air_time,na.rm=T),sum_airtime=sum(air_time,na.rm=T))

#group by calculation using group_by() function

#Example 1
head(mtcars)
View(mtcars)

bygear<-mtcars %>% group_by(gear) #piping function %>% 
bygear
View(bygear)
 summarise(bygear,gear1=sum(gear),gear2=mean(gear))
 
 bycyl<-mtcars %>% group_by(cyl)
bycyl %>% summarise(gear=mean(gear),hp=mean(hp)) 

#sample_n() and sample_frac for creating sample

sample_n(flights,20)
sample_frac(flights,0.4)

#arrange function to sort the data

arrange(flights,year,dep_time)
View(arrange(flights,desc(dep_time)))

df<-mtcars
df

#nesting using piping operator %>% 

result<-arrange(sample_n(filter(df,mpg>20),10),desc(mpg))
View(result)

#multi assignmet

a<-filter(df,mpg>20)
b<-sample_n(a,10)
result<-arrange(b,desc(mpg))
result

# using piping operator

result<- df %>% filter(mpg>20) %>% sample_n(size=10) %>% arrange(desc(mpg))
result

df1<-df %>% select(mpg,cyl,gear)

## Data Manipulation using tydr
# tidyr use to make the data tidy and make the use for visualise and model easily
#gather() make wide dzta longer
#spread() make long data wider
#sperate() splits sigle column into multiple columns
#unite() combines multiple columns into single columns

#install.packages('tidyr')
#long<-wide %>% gather(df1,golu,mpg:gear)


#Data visualization in R
#GGPLOT enables the users to create sophisticated vusualizations with litle code using grammer of graphics
#PLYLY creates interactive web based graphs via the open source javascripts graphing library pltly.js

installed.packages("datasets")
plot(ChickWeight)

#base graphics
library(MASS)
plot(UScereal$sugars,UScereal$calories)
title("plot(UScereal$sugars,UScereal$calories)")

x<-UScereal$sugars
y<-UScereal$calories
library(grid)

#GRID Graphics
pushViewport(plotViewport())
pushViewport(dataViewport(x,y))
grid.rect()
grid.xaxis()
grid.yaxis()
grid.points(x,y)
grid.text("UScereal$sugars",x=unit(-3,"lines"),rot=90)
grid.text("UScereal$calories",y=unit(-3,"lines"),rot=0)
popViewport(2)

#Bar Chatr comparision across discrete categories ,x axix represnet categories and y axis show measured value
#GGPLOT uses geom or geometric objectsto form basis of diff type of charts
#asthetic parameter


#Pie Chart
x<-c(75,45,70,110)
labels <- c("Soap", "Spices", "Oil", "Shampoo")
#pie charts
pie(x,labels)

pie(x,labels,main = "Shop Pie CHart",col = rainbow(length(x)))

piepercent<- round(100*x/sum(x),1)

pie(x,labels=piepercent,main = "Shop Pie CHart",col = rainbow(length(x)))
legend("topright",c("Soap", "Spices", "Oil", "Shampoo"),cex=0.8
    ,fill=rainbow(length(x)))
#3D pie charts

install.packages("plotrix")
library(plotrix)

lbl<-c("Soap", "Spices", "Oil", "Shampoo")
pie3D(x,labels=lbl,explode = 0.1,main="3D piechar")

#create the histograms
v<-c(9,8,7,12,23,21,24,34,35,42,24,35,65,45,56,67)

hist(v,xlab = "weight",col = "red",border = "green")

hist(v,xlab = "weight",col = "red",border = "green",xlim = c(0,40)
     ,ylim = c(0,5),breaks=5)

#Scatter Plots
data('airquality')
View(airquality)

plot(airquality)

hist(airquality$Solar.R,xlab = "weight",col = "red",border = "green")

#Box plot
boxplot(airquality$Solar.R)
boxplot(airquality[,0:4],main="multiple boxplots")

#Use of GGPLOT to analyse mtcars datasets
install.packages("ggplot2")
library(ggplot2)
attach(mtcars)

p1<-ggplot(mtcars,aes(factor(cyl),mpg))
p1+geom_boxplot()

p1+geom_boxplot()+coord_flip()

p1+geom_boxplot(aes(fill=factor(cyl)))+coord_flip()

# create factor with value labels

mtcars$gear<-factor(mtcars$gear,levels = c(3,4,5),
                    labels = c("3gears","4gears","5gears"))
mtcars$am<-factor(mtcars$am,levels = c(0,1),
                    labels = c("Automatics","Manual"))
mtcars$cyl<-factor(mtcars$cyl,levels = c(4,6,8),
                    labels = c("4cyl","6cyl","8cyl"))
mtcars$cyl
mtcars$gear
mtcars$am

#Scatter plots

ggplot(data=mtcars,mapping = aes(x=wt,y=mpg))+geom_point()

#scater plots by factor

View(mtcars)

ggplot(data = mtcars,mapping = aes(x=wt,y=mpg,col="red"))+geom_point()

#Scater plot by size

ggplot(data = mtcars,mapping = aes(x=wt,y=mpg,col="red",size=qsec))+geom_point()
ggplot(data = mtcars,mapping = aes(x=wt,y=mpg,size = qsec))+geom_point()

#Visualization using mpg dataset

k<-ggplot2::mpg
View(ggplot2::mpg)
#Bargraph
ggplot(data=k,aes(class))+geom_bar()

#Stacked Bar Charts

ggplot(data=k,aes(class))+geom_bar(aes(fill=drv))

#Dodge
ggplot(data=k,aes(class))+geom_bar(aes(fill=drv),position = "dodge")

ggplot(data=k)+geom_point(mapping = aes(x=displ,y=hwy))

ggplot(data=k)+geom_point(mapping = aes(x=displ,y=hwy,color=class))

#using plotly library

install.packages("plotly")
library(plotly)

p<-plot_ly(data=mtcars,x=~hp,y=~wt,marker=list(size=10,
          color='rgba(255,182,193,.9)',line=list(color='rgba(152,0,0,.8)',
                                                 width=2))
p
p<-plot_ly(data=mtcars,x=~hp,y=~wt,color=~hp,size=~hp)
p
