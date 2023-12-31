setwd("C:/Users/bc115e/OneDrive - University of Glasgow/MSC data/Manuscript/Stats_R")
library(readr)
#library(purrr)
#library(tidyr)
library(ggplot2)
library(dplyr)
#library(MASS)
#library(factoextra)
#library(GGally)        
library(ggcorrplot)

# load dataset
all.data <- read_csv("Dataset.csv")

#remove last 4 rows i.e.: background sites from analysis
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

# correlation matrix
corr_matrix <- cor(data.notrees)
ggcorrplot(corr_matrix)

###### PCA

PCA <- princomp(data.notrees, scale = TRUE)
summary(PCA)
fviz_eig(PCA)

PCA$loadings[, 1:3]

fviz_cos2(PCA, choice = "var", axes = 1:2)

# Graph of individuals sites in dimentions 1 and 2
fviz_pca_ind(PCA,
             col.ind = "cos2", # Color by the quality of representation
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
             repel = TRUE     # Avoid text overlapping
)

# Graph of variables
fviz_pca_var(PCA,
             col.var = "contrib", # Color by contributions to the PC
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
             repel = TRUE     # Avoid text overlapping
)

# Biplot of individuals and variables
fviz_pca_biplot(PCA, repel = TRUE,
                col.var = "#2E9FDF", # Variables color
                col.ind = "#696969"  # Individuals color
)

## biplot with sites and tree species
groups2 <- as.factor(sites$`Tree Species`)
fviz_pca_biplot(PCA,
                col.ind = groups2, # color by groups
                col.var = "black", # Variables color
                addEllipses = TRUE, # Concentration ellipses
                repel = TRUE,
                
)
