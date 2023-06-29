setwd("C:/Users/bc115e/OneDrive - University of Glasgow/MSC data/Manuscript/Stats_R")

#####
# libraries
library(readr)
library(purrr)
library(tidyr)
library(ggplot2)
library(dplyr)
library(mclust)
library(MASS)
library(factoextra)
library(GGally)        

#####
# load dataset
all.data <- read_csv("Dataset.csv")

#remove last 4 rows i.e. background sites
sites <- all.data[-c(30,31,32,33), ]

#transform elements 
elem <- as.data.frame(scale(log(sites[ , c("Al",	"Ca",	"Na",	"Mg",	"K",	
                                           "Fe",	"Zn")])))

# transform numerical independent variables
x.variables <-  as.data.frame(scale(log(sites[, c("Prox.roads",	"Prox.railway",	
                                       "Prox.military",	"Prox.ILVA",	
                                       "Prox.bridge")])))

# categorical independent variables
trees <- sites$`Tree Species`

# combined transformed data
data <- cbind(x.variables, elem, trees)

# dataset without tree species
data.notrees <- cbind(x.variables, elem)

# histograms check for normality 
elem %>%
  gather() %>% 
  ggplot(aes(value)) +
  facet_wrap(~ key, scales = "free") +
  geom_histogram()

x.variables %>%
  gather() %>% 
  ggplot(aes(value)) +
  facet_wrap(~ key, scales = "free") +
  geom_histogram()

ggpairs(elem)
clPairs(data.notrees)

#####
#cluster analysis of elements only 

MC.1 <- Mclust(elem)
plot(MC.1)

# create a dendrogram of groups - doesn't tell much 
output <- clustCombi(data = elem)
combiTree(output, type = "rectangle", yaxis = "step")

# create a table with tree species in each group from Mclust analysis
table(sites$`Tree Species`, MC.1$classification)

# plot of Dimentions 1 and 2 and the groups of Mclust analysis 
# with labelling of tree species 
fviz_cluster(MC.1) +
  geom_text(aes(label = sites$`Tree Species`))

#####
#cluster analysis of elements AND proximity to pollution sources 

MC.2 <- Mclust(data.notrees)
plot(MC.2)

# create a dendrogram of groups - doesn't tell much 
output.2 <- clustCombi(data = data.notrees)
combiTree(output.2, type = "rectangle", yaxis = "step")

# create a table with tree species in each group from Mclust analysis
table(sites$`Tree Species`, MC.2$classification)

# plot of Dimentions 1 and 2 and the groups of Mclust analysis 
# with labelling of tree species 
fviz_cluster(MC.2) +
  geom_text(aes(label = sites$`Tree Species`))
