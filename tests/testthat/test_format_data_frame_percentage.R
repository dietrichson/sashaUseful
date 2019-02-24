library(testthat)

context("Data Frame With Percentags")

test_that('Data Frame is produced from Polling Results',{
  myData <- readRDS('./data_frame_percentage_test_data/poll_percentages.RDS')
  myRes <- readRDS('./data_frame_percentage_test_data/DF_with_percent_format.RDS')
  test1 <- format_data_frame_percentage(myData)
  expect_equivalent(myRes,test1,label = 'The smaller one')
  #A larger one
   myData2 <- readRDS('./data_frame_percentage_test_data/poll_percentages2.RDS')
   myRes2 <- readRDS('./data_frame_percentage_test_data/DF_with_percent_format2.RDS')
   test2 <- format_data_frame_percentage(myData2,na.string = "*")
   expect_identical(myRes2,test2,label = 'The larger one')
  
} )

# myData2 %>% 
#   mutate_if(is.numeric,function(x){ sprintf('%s%%',x*100)}) %>% 
#   mutate_all(function(x){stringr::str_replace(x,'(NA%|NaN%)','')})
