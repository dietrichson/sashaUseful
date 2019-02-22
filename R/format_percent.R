#' Format data.frame with Percentage
#'
#' Will format all numbers in a data.frame as percentage. And replace NA with string specified in *replace* parameter.
#' 
#' 
#' @param df 
#' @param na.string what to replace NA's with 
#' @import dplyr
#' @return a formatted data.frame
#' @export
format_percent <- function(df, na.string = ''){
  tmp <- df %>% mutate_if(is.numeric,scales::percent)
  tmp <-  lapply(tmp, gsub, pattern = "NA%",  replacement =  na.string, fixed = TRUE)
  tmp <-  lapply(tmp, gsub, pattern = "NaN%", replacement =  na.string, fixed = TRUE)
  tmp <- as.data.frame(tmp)
  names(tmp) <- names(df)
  tmp
}