
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
library(leaflet)
library(raster)
#> Loading required package: sp
#> The legacy packages maptools, rgdal, and rgeos, underpinning the sp package,
#> which was just loaded, will retire in October 2023.
#> Please refer to R-spatial evolution reports for details, especially
#> https://r-spatial.org/r/2023/05/15/evolution4.html.
#> It may be desirable to make the sf package available;
#> package maintainers should consider adding sf to Suggests:.
#> The sp package is now running under evolution status 2
#>      (status 2 uses the sf package in place of rgdal)
library(terra)
#> terra 1.7.39

my_df = data.frame(
  Year = 2001:2005, Mo = 1:5, Dy = 11:15,
  Longitude = 21:25, Latitude = 31:35,
  `Location Name` = paste(
    c("AAAA", "BBBB", "CCCC", "DDDD", "EEEE"),
    c("AAAA", "BBBB", "CCCC", "DDDD", "EEEE"), sep = ":"),
  Mag = 3, Deaths = 0,
  check.names = FALSE
)

  my_loc_clean_df = data.frame(
    Mag = my_df$Mag, Deaths = my_df$Deaths,
    DATE = as.Date(
      paste(my_df$Year, my_df$Mo, my_df$Dy, sep = "-")),
    LONGITUDE = my_df$Longitude,
    LATITUDE = my_df$Latitude,
    COUNTRY = c("AAAA", "BBBB", "CCCC", "DDDD", "EEEE"),
    LOCATION_NAME = c("Aaaa", "Bbbb", "Cccc", "Dddd", "Eeee"),
    check.names = FALSE
  )
  
  eq_map(my_loc_clean_df, annot_col = "DATE")
```

<div class="leaflet html-widget html-fill-item-overflow-hidden html-fill-item" id="htmlwidget-998de93825ced02b6b7e" style="width:100%;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-998de93825ced02b6b7e">{"x":{"options":{"crs":{"crsClass":"L.CRS.EPSG3857","code":null,"proj4def":null,"projectedBounds":null,"options":{}}},"calls":[{"method":"addTiles","args":["https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",null,null,{"minZoom":0,"maxZoom":18,"tileSize":256,"subdomains":"abc","errorTileUrl":"","tms":false,"noWrap":false,"zoomOffset":0,"zoomReverse":false,"opacity":1,"zIndex":1,"detectRetina":false,"attribution":"&copy; <a href=\"https://openstreetmap.org\">OpenStreetMap<\/a> contributors, <a href=\"https://creativecommons.org/licenses/by-sa/2.0/\">CC-BY-SA<\/a>"}]},{"method":"addCircleMarkers","args":[[31,32,33,34,35],[21,22,23,24,25],[3,3,3,3,3],null,null,{"interactive":true,"className":"","stroke":true,"color":"#03F","weight":5,"opacity":0.5,"fill":true,"fillColor":"#03F","fillOpacity":0.4},null,null,["2001-01-11","2002-02-12","2003-03-13","2004-04-14","2005-05-15"],null,["2001-01-11","2002-02-12","2003-03-13","2004-04-14","2005-05-15"],{"interactive":false,"permanent":false,"direction":"auto","opacity":1,"offset":[0,0],"textsize":"10px","textOnly":false,"className":"","sticky":true},null]}],"limits":{"lat":[31,35],"lng":[21,25]}},"evals":[],"jsHooks":[]}</script>
