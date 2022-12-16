#' Remove a suffix from all variable names in a datafrme
#'
#' @param dataframe A dataframe
#' @param suf_old Old suffix to be removed from all variables 
#'
#' @return Returns a dataframe with all variables renamed that used to have the old suffix. 
#' Any variable without the old suffix will be kept without changes.
#' @export
#'
#' @examples
#' bla <- tibble::tibble(ar_x = 1:5, ar_y = 6:10)
#' blo <- namesuff(bla, "_x")
#' names(bla)
#' names(blo)
#' 
suffstrip <- function(dataframe, suf_old){
  # This function strips the old suffix and changes the dataframe's names to end with the suffix.
  # suf_new must be a character string, dataframe must be a dataframe
  
  namedf <- tibble::as_tibble(names(dataframe))  %>% 
    mutate(new_names = ifelse(endsWith(value, suf_old), substr(value, 1,  (nchar(value)-nchar(suf_old))), value))
  # new_names = paste0(value, suf_new))
  
  names(dataframe) <- namedf %>% pull(new_names)
  return(dataframe)
}