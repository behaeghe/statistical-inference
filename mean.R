library(manipulate);library(ggplot2);library(UsingR);data(galton)
myHist <- function(mu){
        g <- ggplot(galton, aes(x = child))
        g <- g + geom_histogram(fill = "salmon",
                                binwidth=1, aes(y = ..density..), color = "black")
        g <- g + geom_density(size = 2)
        g <- g + geom_vline(xintercept = mu, size = 2)
        mse <- round(mean((galton$child - mu)^2), 3)  
        g <- g + labs(title = paste('mu = ', mu, ' MSE = ', mse))
        g
}
manipulate(myHist(mu), mu = slider(62, 74, step = 0.5))