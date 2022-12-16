#' Add variable name suffix (with substitution)
#' 
#' This function strips the old suffix from the variable names of dataframe. 
#' It then adds the new suffix where the old one was and changes the dataframe's names to the new ones.
#'
#' @param dataframe A dataframe
#' @param suf_old Old suffix character that some or all variables in the dataframe have
#' @param suf_new New suffix character to replace the old one 
#'
#' @return Returns dataframe with those variables renamed that end with the old suffix.
#' @export
#'
#' @examples
#' bla <- tibble::tibble(ar_x = 1:5, ar_y = 6:10)
#' blo <- namesuff(bla, "_x", "_z")
#' names(bla)
#' names(blo)
#' 
namesuff <- function(dataframe, suf_old, suf_new){
  # pref_old and pref_new must be character strings, dataframe must be a dataframe
  namedf <- tibble::as_tibble(names(dataframe))  |> 
    dplyr::mutate(stripped = ifelse(endsWith(value, suf_old), 
                                    substr(value, 1,  (nchar(value)-nchar(suf_old))), 
                                    value),
           new_names = ifelse(endsWith(value, suf_old), 
                              paste0(stripped, suf_new), 
                              value))
  
  names(dataframe) <- namedf |> dplyr::pull(new_names)
  return(dataframe)
}