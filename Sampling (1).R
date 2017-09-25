

randomSampling <- function(age, fare) {
  sampledAges <- sample(age, 100)
  sampledFares <- sample(fare, 100)
  meanAge <- mean(sampledAges)
  sdAge <- sd(sampledAges)
  meanFare <- mean(sampledFares)
  sdFare <- sd(sampledFares)
  
  print(paste("(Age) (Sample) Mean: ", meanAge, " sd: ", sdAge))
  print(paste("(Fare) (Sample) Mean: ", meanFare, " sd: ", sdFare))
}

# Every 5th element
# Select 100 elements in total
systematicSampling <- function(age, fare) {
  # Select the first element randomly from the first 100 elements
  sampleSize <- 100
  everyNthElement <- 5
  startingElement <- sample(sampleSize, 1)
  sampledAges <- age[seq(startingElement, startingElement + (sampleSize-1) * everyNthElement, everyNthElement)]
  # Calculate the mean and sd
  print("Systematic Sampling\n")
  print("---------------------")
  print(paste("(Age) (Sample) Mean: ", mean(sampledAges), " sd: ", sd(sampledAges)))
  
  # Now lets get the fare
  startingElement <- sample(sampleSize, 1)
  sampledFare <- fare[seq(startingElement, startingElement + (sampleSize-1) * everyNthElement, everyNthElement)]
  print(paste("(Fare) (Sample) Mean: ", mean(sampledFare), " sd: ", sd(sampledFare)))
  
  return(sampledFare)
}



# Main program goes in here
file = "Desktop/train.csv"
data <- read.csv(file)
age <- data$Age
ageWithoutNA <- na.omit(age)
fare <- data$Fare
fareWithoutNA <- na.omit(fare)

meanAge <- mean(ageWithoutNA)
sdAge <- sd(ageWithoutNA)

meanFare <- mean(fareWithoutNA)
sdFare <- sd(fareWithoutNA)

print(paste("(Age) Population mean: ", meanAge, " sd: ", sdAge))
print(paste("(Fare) Population mean: ", meanFare, " sd: ", sdFare))
randomSampling(ageWithoutNA, fareWithoutNA)
systematicSampling(ageWithoutNA, fareWithoutNA)
