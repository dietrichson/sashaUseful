library(dplyr)
library(stringr)
#' @title Fix Names
#' @description For Pretty printing statistical models
#' @import dplyr stringr
#' @export
fix_names <- . %>%
  str_replace(".Intercept.", "Intercept") %>%
  str_replace_all(":", " x ")
