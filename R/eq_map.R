#' Create interactive map with popup annotation
#'
#' This function uses functions from `leaflet package`
#' to create an interactive map with popup annotation.
#' The column to be used for annotation should be a
#' vector character or a string supplied through the
#' `annot_col` argument. Each row of the `data` supplied
#' is represented on the map with a `circle`  at LONGITUDE
#' and LATITUDE on that row. The radius of the circle is
#' proportional to the Mag on that row. The annotation is
#' displayed by clicking on the circle.
#'
#' @param data data frame with LONGITUDE, LATITUDE and
#'             Mag columns
#' @param annot_col string used for popup annotation
#'
#' @return list or map
#'
#' @importFrom dplyr rename
#' @importFrom magrittr %>%
#' @importFrom leaflet leaflet addTiles addCircleMarkers
#'
#' @examples
#' my_data = data.frame(
#' Mag = c(3,2,5,4,2), Deaths = c(0,1,3,2,0),
#' DATE = as.Date(
#'  paste(2001:2005, 1:5, 11:15, sep = "-")),
#' LONGITUDE = 21:25,
#' LATITUDE = 31:35,
#' COUNTRY = c("AAAA", "BBBB", "CCCC", "DDDD", "EEEE"),
#' LOCATION_NAME = c("Aaaa", "Bbbb", "Cccc", "Dddd", "Eeee"),
#' check.names = FALSE
#' )
#' eq_map(my_data, annot_col = "DATE")
#'
#' @export
eq_map <- function(data, annot_col) {

  annot_col = as.character(annot_col)
  df = dplyr::rename(data,
                     "annot_col" = annot_col)
  leaflet::leaflet() %>%
    leaflet::addTiles() %>%
    leaflet::addCircleMarkers(
      data = df,
      lng = ~ LONGITUDE,
      lat = ~ LATITUDE,
      radius = ~ Mag,
      popup = ~ annot_col,
      label = ~ annot_col,
      fillOpacity = .4
    )
}
