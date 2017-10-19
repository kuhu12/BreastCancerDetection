# mRMR Feature Ranking Method

bencan <- read.csv("under_grad/breast_cancer/data.csv")

data <- mRMR.data(data = data.frame(target=cgps.ic50, cgps.ge))
ind <- sapply(bencan, is.integer) #bencan is the Breast Cancer dataset
bencan[ind] <- lapply(bencan[ind], as.numeric)
dd <- mRMR.data(data = bencan)
feats <- mRMR.classic(data = dd, target_indices = c(ncol(bencan)), feature_count = 6)
variableImportance <-data.frame('importance'=feats@mi_matrix[nrow(feats@mi_matrix),])
variableImportance$feature <- rownames(variableImportance)
row.names(variableImportance) <- NULL
variableImportance <- na.omit(variableImportance)
variableImportance <- variableImportance[order(variableImportance$importance, decreasing=TRUE),]
print(variableImportance)

