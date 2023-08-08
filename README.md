
<!-- README.md is generated from README.Rmd. Please edit that file -->

# noaar

<!-- badges: start -->

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

This is a basic example which shows you how to solve a common problem:

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
```

<div class="leaflet html-widget html-fill-item-overflow-hidden html-fill-item" id="htmlwidget-e22f2614b59b51b099dc" style="width:100%;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-e22f2614b59b51b099dc">{"x":{"options":{"crs":{"crsClass":"L.CRS.EPSG3857","code":null,"proj4def":null,"projectedBounds":null,"options":{}}},"calls":[{"method":"addTiles","args":["https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",null,null,{"minZoom":0,"maxZoom":18,"tileSize":256,"subdomains":"abc","errorTileUrl":"","tms":false,"noWrap":false,"zoomOffset":0,"zoomReverse":false,"opacity":1,"zIndex":1,"detectRetina":false,"attribution":"&copy; <a href=\"https://openstreetmap.org\">OpenStreetMap<\/a> contributors, <a href=\"https://creativecommons.org/licenses/by-sa/2.0/\">CC-BY-SA<\/a>"}]},{"method":"addCircleMarkers","args":[[31,32,33,34,35],[21,22,23,24,25],[3,2,5,4,2],null,null,{"interactive":true,"className":"","stroke":true,"color":"#03F","weight":5,"opacity":0.5,"fill":true,"fillColor":"#03F","fillOpacity":0.4},null,null,["2001-01-11","2002-02-12","2003-03-13","2004-04-14","2005-05-15"],null,["2001-01-11","2002-02-12","2003-03-13","2004-04-14","2005-05-15"],{"interactive":false,"permanent":false,"direction":"auto","opacity":1,"offset":[0,0],"textsize":"10px","textOnly":false,"className":"","sticky":true},null]}],"limits":{"lat":[31,35],"lng":[21,25]}},"evals":[],"jsHooks":[]}</script>
