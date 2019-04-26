

#Decision trees
install.packages("party")

#Loading the party & other package
library(party)

#Creating a input dataframe
input.dat <- readingSkills[c(1:105),]

#Giving the chart file a name
png(file ="decision_tree.png")

#Creating a tree
output.tree <- ctree(
  nativeSpeaker ~ age + shoeSize + score,
  data = input.dat)


#Plotting the tree
plot(output.tree)

#Saving the file
dev.off()

# Part 2
#Random Foreses
install.packages("randomForest")

#library(party) #already done
library(randomForest)

#Creating the forest
output.forest <- randomForest(nativeSpeaker ~ age + shoeSize + score,
                              data = readingSkills)

#Viewing the forest results
print(output.forest)

#Importance of each predictor
#Last line not working
#print(importance(fit,type =2))



