# Implement K-means clustering algorithm
# https://en.wikipedia.org/wiki/K-means_clustering


assignClusterToPoints <- function(Xcoord, Ycoord, K) {
  
  
}

Xcoord <- c(1,3,1,1,4,5,7,8,9,4,5,1,2)
Ycoord <- c(2,4,5,9,6,5,7,9,7,5,6,1,1)

K <- 3

clusters = rep(1, length(Xcoord))
plot(Xcoord, Ycoord, col=clusters)
clusters = assignClusterToPoints(Xcoord, Ycoord, K)

# Plot the cluster
#plot(Xcoord, Ycoord, col=clusters)

