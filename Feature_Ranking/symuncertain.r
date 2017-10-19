library(FSelector)

bencan <- read.csv("under_grad/breast_cancer/data.csv")

weights <- symmetrical.uncertainty(Species~., iris)
  print(weights)
  subset <- cutoff.biggest.diff(weights)
  f <- as.simple.formula(subset, "Species")
  print(f)
