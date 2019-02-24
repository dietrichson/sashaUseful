#' Format data.frame with Percentages
#'
#' Will format all numbers in a data.frame as percentage. And replace NA with string specified in *replace* parameter.
#' 
#' 
#' @param df the data.frame to format
#' @param na.string what to replace NA's with 
#' @import dplyr
#' @return a formatted data.frame
#' @export
format_data_frame_percentage <- function(df, na.string = ''){
  # tmp <- df %>% mutate_if(is.numeric,scales::percent) #Breaks in some circumstances
  tmp <- df %>% mutate_if(is.numeric,function(x){ sprintf('%s%%',x*100)})
  tmp <-  lapply(tmp, gsub, pattern = "NA%",  replacement =  na.string, fixed = TRUE)
  tmp <-  lapply(tmp, gsub, pattern = "NaN%", replacement =  na.string, fixed = TRUE)
  tmp <- as.data.frame(tmp)
   #names(tmp) <- names(df)
  tmp
}