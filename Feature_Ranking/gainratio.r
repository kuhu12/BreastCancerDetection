library(FSelector)

bencan <- read.csv("under_grad/breast_cancer/data.csv")

weights <- gain.ratio(Species~., iris)
  print(weights)
  subset <- cutoff.k(weights, 2)
  f <- as.simple.formula(subset, "Species")
  print(f)

 