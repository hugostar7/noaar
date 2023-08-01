
<!-- README.md is generated from README.Rmd. Please edit that file -->

# noaar

<!-- badges: start -->

[![Travis build
status](https://travis-ci.com/hugostar7/noaar.svg?branch=main)](https://travis-ci.com/hugostar7/noaar)
[![R-CMD-check](https://github.com/hugostar7/noaar/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/hugostar7/noaar/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The goal of noaar is to provide means to analyse earthquakes data.
Functions in this package can be used to create data visualization tools
time series plots and maps of earthquakes data with specific columns.
The functions eq_clean_data() and eq_location_clean() can be used to
clean the data and create the columns necessary(DATE, COUNTRY,
LOCATION_NAME) for our data analysis. The function geom_timeline()
creates time series plots which can be annotated with
geom_timeline_label(). The function eq_create_label() helps create
popups on interactive maps created using eq_map().

## Installation

You can install the development version of noaar from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("hugostar7/noaar")
```

## Example

This is a basic example which shows you how to an interactive map using
`eq_map()` :

``` r
library(noaar)

my_data = data.frame(
  
 Mag = c(3,2,5,4,2), Deaths = c(0,1,3,2,0),
 DATE = as.Date(
  paste(2001:2005, 1:5, 11:15, sep = "-")),
 LONGITUDE = 21:25,
 LATITUDE = 31:35,
 COUNTRY = c("AAAA", "BBBB", "CCCC", "DDDD", "EEEE"),
 LOCATION_NAME = c("Aaaa", "Bbbb", "Cccc", "Dddd", "Eeee"),
 check.names = FALSE
)
  
  eq_map(my_data, annot_col = "DATE")
#>   Mag Deaths  annot_col LONGITUDE LATITUDE COUNTRY LOCATION_NAME
#> 1   3      0 2001-01-11        21       31    AAAA          Aaaa
#> 2   2      1 2002-02-12        22       32    BBBB          Bbbb
#> 3   5      3 2003-03-13        23       33    CCCC          Cccc
#> 4   4      2 2004-04-14        24       34    DDDD          Dddd
#> 5   2      0 2005-05-15        25       35    EEEE          Eeee
```
