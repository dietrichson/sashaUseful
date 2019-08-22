#' Format Seconds Nicely
#'
#' @param x Vector of seconds (durations). Numeric or coercible to numeric
#' @param format for consumption by sprintf
#' @importFrom lubridate seconds_to_period
#' @return a vector of characters
#' @export
seconds_as_duration<- function(x, format = '%02d:%02d:%02d' ){
  x <- as.numeric(x)
  if(!is.numeric(x) )stop("Numeric Vector needed") 
  
  td <-x %>% seconds_to_period()
  if(!is.null(format)){
    ret <- sprintf(format, td@hour, minute(td), second(td))
  } else(ret = as.character(td))
  ret
}
