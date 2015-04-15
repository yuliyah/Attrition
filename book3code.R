install.packages('rattle')
install.packages('rpart')
install.packages('rpart.plot')
install.packages('RColorBrewer')
library(rattle)
library(rpart)
library(rpart.plot)
library(RColorBrewer)

mydata<-read.table("book.csv", sep=",", fill=T, header=T)
mydata1<-mydata
mydata1[is.na(mydata1)]<-0

rpart_model <- rpart(y ~ age+job+marital+education+campaign+month+day_of_week
                     , data=mydata1, method="class",control=rpart.control(minsplit=20, cp=0))
dev.copy(png, width=1300, height=1300)
fancyRpartPlot(rpart_model, uniform=TRUE, main="Classification Tree for Subscription")
text(rpart_model, use.n=TRUE, all=TRUE, cex=2)
dev.off()