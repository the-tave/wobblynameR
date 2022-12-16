#' Add variable name suffix (without substitution)
#'
#' This function adds the new suffix and changes 
#' the dataframe's names to the new ones.
#'
#' @param dataframe A dataframe
#' @param suf_new New suffix character to add to the variable names of the dataframe
#'
#' @return Returns dataframe with all variables renamed to end with the new suffix.
#' @export
#'
#' @examples
#' bla <- tibble::tibble(ar_x = 1:5, ar_y = 6:10)
#' blo <- namesuff(bla, "_z")
#' names(bla)
#' names(blo)
#' 
namesuff0 <- function(dataframe, suf_new){
  namedf <- tibble::as_tibble(names(dataframe))  |>
    dplyr::mutate(new_names = paste0(value, suf_new))
  
  names(dataframe) <- namedf |> dplyr::pull(new_names)
  return(dataframe)
}