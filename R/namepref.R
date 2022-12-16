#' Add variable name prefix (with substitution)
#'
#' This function strips the old prefix from the variable names of dataframe.
#' It then adds the new prefix where the old one was and changes the dataframe's names to the new ones.
#'
#' @param dataframe A dataframe
#' @param pref_old Old prefix character that some or all variables in the dataframe have
#' @param pref_new New prefix character to replace the old one
#'
#' @return Returns dataframe with those variables renamed that start with the old prefix.
#' @export
#'
#' @examples
#' bla <- tibble::tibble(x_ar = 1:5, y_ar = 6:10)
#' blo <- namepref(bla, "x_", "z_")
#' names(bla)
#' names(blo)
#'
namepref <- function(dataframe, pref_old, pref_new){
 # pref_old and pref_new must be character strings, dataframe must be a dataframe
  namedf <- tibble::as_tibble(names(dataframe))  |>
    dplyr::mutate(stripped = ifelse(startsWith(value, pref_old), 
                                    substr(value, (nchar(pref_old)+1), nchar(value)), 
                                    value),
                  new_names = ifelse(startsWith(value, pref_old), 
                                     paste0(pref_new, stripped), 
                                     value))

  names(dataframe) <- namedf |> dplyr::pull(new_names)
  return(dataframe)
}
