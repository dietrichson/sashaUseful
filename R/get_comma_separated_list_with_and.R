#' Format Vector as Comma Separated
#'
#' @param vec A character vector
#' @param and the 'and' word. i.e in spansh 'y'
#' @param harvard.comma should a harvard comma be inserted
#'
#' @return a formatted character string.
#' @export
get_comma_separated_list_with_and <- function(vec, and='and', harvard.comma = FALSE){
  x <- length(vec)-1
  
  paste(vec[1:x], collapse = ', ')  %>% 
    paste0(paste0(ifelse(harvard.comma,", "," "),and,' '))  %>% 
    paste0(vec[x+1])
}