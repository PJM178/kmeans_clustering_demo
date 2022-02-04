# K-means clustering demo

This is a demo of k-means clustering using R. A list of animals is clustered together into groups based on their shared featuresets. It's a useful method in wide variety of situations, for example in data exploration or customer segmentation. 

## Methodology and data

K-means clustering is an unsupervised learning method. The idea is to assign each observation to its nearest center, the number of which is determined beforehand, so that the average squared distance between the points belonging to a center is minimized. First, the centers are initialized in some way, for example randomly, and then each point is assigned to its nearest center and the center is updated to be the mean of the points assigned to it. The last step is repeated until convergence, local optimum is found. The way the centers are initialized is an important step.

The dataset contains 85 features, such as "big", "small", and "hairless", of 50 animals. The data is numerical and continous, and has no missing values. Of the same dataset there also exists a dataset of binary values, which can be useful in other types of classification techniques. Predicates.txt contains the full feature list, classes.txt contains the names of the observations, and predicate-matrix-continuous.txt contains the numerical data associated with the classes.

When the feature number is high, the results can be hard to visualize. However, using principal component analysis, it's possbile to make somewhat meaningful visualizations as the principal components capture more information than single features.

## Results

