# K-means clustering Demo
# Petri Montonen 2022

# Loading necessary packages

library(NbClust)
library(scales)
library(purrr)
library(factoextra)
library(gridExtra)

rm(list=ls())
setwd("C:/Users/petri/Desktop/GitHub töitä/R/K_means_clustering")

# Data loading and pre-processing

data = read.delim("predicate-matrix-continuous.txt", header = FALSE, sep = "")

attributes = read.delim("predicates.txt", header = FALSE, sep = "")
attributes = attributes[2]

classes = read.delim("classes.txt", header = FALSE, sep = "")
classes = classes[2]

rownames(data) = classes[1:50,1]
colnames(data) = attributes[1:85,1]

# Cluster number visualization

p1 = fviz_nbclust(data, kmeans, k.max = 20, nstart=100, method = "silhouette")
p2 = fviz_nbclust(data, kmeans, k.max = 20, nstart=100, method = "wss")
p3 = fviz_nbclust(data, kmeans, k.max = 20, nstart=100, method = "gap_stat")
grid.arrange(p1,p2,p3, ncol = 3)

kmeans_facto = kmeans(data, centers = 12, nstart = 100)

# Final model

kmeans_model=kmeans(data, centers = 12, nstart = 100)

kmeans_model$cluster
kmeans_model$centers

kmeans_model_table = data.frame(kmeans_model$size, kmeans_model$centers)
data_with_cluster = data.frame(Cluster = kmeans_model$cluster, data)
head(data_with_cluster)

# cluster visualization with PCA

fviz_cluster(kmeans_facto, data, geom = c("point"),ellipse.type = "euclid")

data.pca = prcomp(data, center = TRUE, scale. = TRUE)
summary(data.pca)
str(data.pca)

ggbiplot(data.pca, ellipse=TRUE, labels=rownames(data), groups=data_with_cluster$Cluster)

ggbiplot(data.pca, ellipse=TRUE, choices=c(3,4), labels=rownames(data), groups=data_with_cluster$Cluster)


# EOF #
