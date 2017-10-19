library(FSelector)

bencan <- read.csv("under_grad/breast_cancer/data.csv")

weights <- information.gain(class~., bencan)
print(weights)

subset <- cutoff.k(weights,6 )

f <- as.simple.formula(subset, "class")
print(f)