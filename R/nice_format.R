#' @title  Nice format
#' @export
.mf <- function(x){
  if(is.numeric(x)) return(format(x,big.mark = ","))
  myDate <- tryCatch(as.Date(x), error=function(x)x)
  if(inherits(myDate, 'Date')) return(format(as.Date(x),"%b %d %Y"))
  #If not found just return string
  x
}