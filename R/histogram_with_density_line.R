#' Generate Histogram with Density Line
#'
#' @param myData data.frame with raw data
#' @param binwidth binwidth for the histogram
#' @param variable variable to be plotted
#'
#' @return a ggplot object histogram whith densityline overplotted
#' @export
getHistogramWithDensityLine <- function(myData,binwidth=.1,variable="x"){ #TODO: Move to package
  myData %>%
    ggplot(aes_string(paste0("x=",variable))) +
    geom_histogram(color="red",fill='red',alpha=.4,binwidth = binwidth )+
    geom_density(aes(y=..density..*binwidth*..n..),color="blue",lty=2)
}
#' Generate Histogram with Density Line
#'
#' @param myData data.frame with raw data
#' @param binwidth binwidth for the histogram
#' @param variable variable to be plotted
#'
#' @return a ggplot object histogram whith densityline overplotted
#' @export
getHistogramWithDensityLine2 <- function(myData,binwidth=.1,variable="x"){
  qplot(myData[variable], geom = 'blank') +
    geom_histogram(aes(y = ..density..)) +
    geom_line(aes(y = ..density.., colour = 'Empirical'), stat = 'density',color='blue')

  #+
    #geom_histogram(aes(y = ..count..), alpha = 0.4) +
    #scale_y_continuous(labels=function(x){x*binwidth})
}
