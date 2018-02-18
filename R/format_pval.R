library(stringr)
#' @title P-Value formatter
#' @description For reporting on statistical models
#' @export
format_pval <- function(ps, html = FALSE,stars=FALSE) {
  tiny <- ifelse(html, "&lt;&nbsp;.001", "< .001")
  myStars <- ifelse(ps<=0.001,"***",
                    ifelse(ps<=0.01,"**",
                           ifelse(ps<=0.05,"*","")
                    )
  )
  ps_chr <- ps %>% fixed_digits(3) %>%
    remove_leading_zero
  ps_chr[ps < 0.001] <- tiny

  if(stars==TRUE) ps_chr <-ps_chr %>% paste0(myStars)

  ps_chr
}

