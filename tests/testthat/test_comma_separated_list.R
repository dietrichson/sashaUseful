library(testthat)

context("Comma Separated List")
test_that('Comma Separated List is created',{
  vec <- c("John",'Jack',"Jill")
  expect_equal( get_comma_separated_list_with_and(vec),"John, Jack and Jill")
  expect_equal( get_comma_separated_list_with_and(vec,harvard.comma = TRUE),"John, Jack, and Jill")
} )

test_that('It works in Spahish',{
  vec <- c("John",'Jack',"Jill")
  expect_equal( get_comma_separated_list_with_and(vec,and='y'),"John, Jack y Jill")
  expect_equal( get_comma_separated_list_with_and(vec,and='y',harvard.comma = TRUE),"John, Jack, y Jill")
})