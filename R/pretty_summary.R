library(dplyr)
library(broom)
library(magrittr)
#' @title Pretty Summary
#' @description Pretty Summary for various objects.
#' @param input The Object to Pretty Summarize
#' @param digits Significant digits
#' @import dplyr broom magrittr
#' @export
prettySummary <- function(input,digits=3){
  UseMethod("prettySummary",input)
}

#' @export
prettySummary.data.frame <- function(df,digits=3){
  tmp <- do.call(data.frame,
          list(Mean = apply(df, 2, mean,na.rm=TRUE),
               Std.Dev = apply(df, 2, sd,na.rm=TRUE),
               Median = apply(df, 2, median,na.rm=TRUE),
               Min = apply(df, 2, min,na.rm=TRUE),
               Max = apply(df, 2, max,na.rm=TRUE),
               N = apply(df, 2, length),
               Missing=apply(df,2,function(x){sum(is.na(x))}))) %>% signif(digits)
  data.frame(Statistics="",tmp)
}

