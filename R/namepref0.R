#' Add variable name prefix (without substitution)
#'
#' This function adds the new prefix and changes the dataframe's names to the new ones.
#'
#' @param dataframe A dataframe
#' @param pref_new New prefix character that shall replace the old one
#'
#' @return Returns dataframe with those variables renamed, that start wwith the old prefix.
#' @export
#'
#' @examples
#' bla <- tibble::tibble(x_ar = 1:5, y_ar = 6:10)
#' blo <- namepref0(bla, "z_")
#' names(bla)
#'  > "x_ar" "y_ar"
#' names(blo)
#'  > "z_x_ar" "z_y_ar"
#' 
namepref0 <- function(dataframe, pref_new){
  
  namedf <- tibble::as_tibble(names(dataframe))  |> 
    dplyr::mutate(new_names = paste0(pref_new, value))
  
  names(dataframe) <- namedf |> dplyr::pull(new_names)
  return(dataframe)
}