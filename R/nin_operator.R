#' @title Redefinition of %nin% operator
#' @export
"%nin%" <- function(x, table) match(x, table, nomatch = 0) == 0
