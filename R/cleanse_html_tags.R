#' Clean out HTML tags
#'
#' @param stringVec 
#'
#' @return clean string or list of strings
#' @export
clean_html_tags <- function(stringVec){
  sapply(stringVec, function(x){ #move to sashaUseful
    rvest::html_text(xml2::read_html(paste0("<h>",x)))
  })
}