library(dplyr)
library(broom)
library(magrittr)
#' @title Pretty Print
#' @description Pretty printing for model summaries etc.
#' @import dplyr broom magrittr
#' @export
prettyPrint <- function(m,stars=FALSE){
  UseMethod("prettyPrint",m)
}

#' @export
prettyPrint.summary.lm <- function(m,stars=FALSE){
  m %>%
    tidy %>%
    format_model_table(stars=stars)
}

two_digits <- . %>% fixed_digits(2)


format_model_table <- function(m,stars=FALSE){
  m %>%
  mutate_each(funs(two_digits),
              -term, -p.value) %>%
  mutate(term = fix_names(term),
         p.value = format_pval(p.value,stars=stars)) %>%
  set_colnames(c("Parameter", "Estimate", "SE", "t", "p"))
}

