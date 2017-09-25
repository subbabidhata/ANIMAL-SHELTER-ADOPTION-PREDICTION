# Implement K-means clustering algorithm
# https://en.wikipedia.org/wiki/K-means_clustering

findClusters <- function(Xcoord, Ycoord, K) {
  assignments = rep(0, length(Xcoord))
  # Find centroids randomly
  indexOfCentroids = sample(1:length(Xcoord), K)
  
  # Just initial assignments for the centroids
  class = 1 # Class number starts with 1
  for (i in 1:length(indexOfCentroids)) {
    assignments[indexOfCentroids[i]] = class
    class = class + 1
  }
  
  iteration = 0
  while(TRUE) {
    iteration = iteration + 1
    newAssignments = rep(0, length(Xcoord))
    for (i in 1: length(Xcoord)) {
      dist = c()
      for (j in 1: length(indexOfCentroids)) {
        dist[j] = sqrt((Xcoord[indexOfCentroids[j]] - Xcoord[i])^2 + (Ycoord[indexOfCentroids[j]] - Ycoord[i])^2)
      }
      newAssignments[i] = assignments[indexOfCentroids[which.min(dist)]]
    }
    
    newIndexOfCentroids = c()
    for (i in 1:K) {
      indexes = which(newAssignments == i)
      centerX = sum(Xcoord[indexes])/length(indexes)
      centerY = sum(Ycoord[indexes])/length(indexes)
      dist <- sqrt((Xcoord[indexes] - centerX)^2 + (Ycoord[indexes] - centerY)^2)
      newIndexOfCentroids[i] = indexes[which.min(dist)]
    }
    
    
    if (identical(assignments, newAssignments)) {
      print(paste("Number of iteration:", iteration))
      print(newAssignments)
      print(newIndexOfCentroids)
      plot(Xcoord, Ycoord, col=newAssignments)
      return()
    }
    
    assignments = newAssignments
    indexOfCentroids = newIndexOfCentroids
    #plot(Xcoord, Ycoord, col=assignments)
    #readline(prompt="Press [enter] to continue")
  }
  
}

Xcoord <- c(1,3,1,1,4,5,7,8,9,4,5,1,2)
Ycoord <- c(2,4,5,9,6,5,7,9,7,5,6,1,1)

K <- 3

findClusters(Xcoord, Ycoord, K)
