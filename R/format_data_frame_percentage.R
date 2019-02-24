#' Format data.frame with Percentages
#'
#' Will format all numbers in a data.frame as percentage. 
#' And replace NA with string specified in *na.string* parameter.
#' 
#' 
#' @param df the data.frame to format
#' @param na.string what to replace NA's with 
#' @import dplyr
#' @return a formatted data.frame
#' @export
format_data_frame_percentage <- function(df, na.string = ''){
 df %>% mutate_if(is.numeric,function(x){ sprintf('%s%%',x*100)}) %>% 
    mutate_all(function(x){stringr::str_replace(x,'(NA%|NaN%)',na.string)})
}
  