# is_in_test_dir<-(getwd() %>% gsub("\\/$","",.) %>% strsplit("/") %>% .[[1]] %>% last)=="unit_tests"
# if(!is_in_test_dir){setwd("./internal/R/unit_tests/")}

context("Unit tests for set intersection")
print(getwd())
print(list.files())
source("test_utilities.R")


example<-load.example("example1",F)
data <- example$data
data_not_num <- sapply(data,as.character)
tf <- example$tf
good_vector <- example$names_good
bad_vector <- example$names_bad
good_vector_bad_sign <- example$names_good_bad_sign
# design <- svydesign(~0, data = data)


#
# test_that("confidence_intervals_mean inputs correct",{
#   ###This needs to be tested with a dependent var thats select one, one that's select multiple, one that's numeric etc
#   expect_is(expand_to_set_intersections(tf$numeric[1], design = design), "data.frame") #numerical var
#   expect_is(expand_to_set_intersections(tf$numeric_NA_heavy[1], design = design), "data.frame") #numerical var
#   expect_is(expand_to_set_intersections(tf$logical[1], design = design), "data.frame")
#   expect_warning(expand_to_set_intersections(tf$numeric[1], tf$select_one[2] , design = design))
#   expect_error(expand_to_set_intersections(example$data, bad_vector))
#   expect_error(expand_to_set_intersections(tf$select_one[1], design = design))
#   expect_error(expand_to_set_intersections(tf$NAs[1], design = design))
#   expect_error(expand_to_set_intersections(tf$fake[1], design = design)) #nonexistent.var
#   expect_error(expand_to_set_intersections(tf$select_multiple[1], design = design)) # select multiple
# })

test_that("expand_to_set_intersections inputs correct",{
expect_error(expand_to_set_intersections(example$data, bad_vector))
expect_error(expand_to_set_intersections(example$data, good_vector_bad_sign), "can't have the '&' sign in your variable names, it will mess everything up!")
expect_error(expand_to_set_intersections(example$data_no_num, good_vector), "data.frame")
expect_is(expand_to_set_intersections(example$data, good_vector), "data.frame")
  })

#
# test_that("set_intersection_plot inputs correct",{
#   expect_error(set_intersection_plot(example$data, bad_vector))
#   expect_error(set_intersection_plot(example$data, good_vector_bad_sign), "can't have the '&' sign in your variable names, it will mess everything up!")
#   expect_error(set_intersection_plot(example$data_no_num, good_vector), "data.frame")
#   expect_is(set_intersection_plot(example$data, good_vector), "data.frame")
# })

test_that("set_intersection_plot inputs correct",{
  expect_error(make_set_percentages(example$data, bad_vector))
  expect_error(make_set_percentages(example$data, good_vector_bad_sign), "can't have the '&' sign in your variable names, it will mess everything up!")
  expect_error(make_set_percentages(example$data_no_num, good_vector), "data.frame")
  expect_is(make_set_percentages(example$data, good_vector), "data.frame")
})