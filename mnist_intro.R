library(dplyr)

show_number <- function(m, i, oriented=T)
{
  im <- matrix(mtrain[i,], byrow=T, nrow=28)
  
  if (oriented) {
    im_orient <- matrix(0, nrow=28, ncol=28)
    for (i in 1:28)
      im_orient[i,] <- rev(im[,i])
    
    im <- im_orient
  }
  image(im)
}


# get the training datasets
if (!exists("mtrain")) {
  mtrain <- read.csv("mnist_train.csv", header=F) %>% as.matrix
  train_classification <- mtrain[,1]
  mtrain <- mtrain[,-1]/256
  
  colnames(mtrain) <- NULL
  rownames(mtrain) <- NULL
}

# look at a sample
show_number(mtrain, 6)
