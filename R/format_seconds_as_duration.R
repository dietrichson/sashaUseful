#' Format Seconds Nicely
#'
#' @param x Vector of seconds (durations). Numeric or coercible to numeric
#' @param format for consumption by sprintf
#' @importFrom lubridate seconds_to_period
#' @return a vector of characters
#' @export
#' 
#' @examples 
#' seconds_as_duration(c(100,200,3024, 16254))
#' seconds_as_duration(c(100,200,3024, 16254), format=NULL)
#' seconds_as_duration(c(100,200,3024, 16254), format='%02dh%02dm%02ds')
seconds_as_duration<- function(x, format = '%02d:%02d:%02d' ){
  x <- as.numeric(x)
  if(!is.numeric(x) )stop("Numeric Vector needed") 
  
  td <-x %>% seconds_to_period()
  if(!is.null(format)){
    ret <- sprintf(format, td@hour, minute(td), second(td))
  } else(ret = as.character(td))
  ret
}
