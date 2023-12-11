#' Get percentage of a value
#'
#' @param data A dataframe 
#' @param var A variable in the dataframe, written as a character in quotes, e.g. "var"
#' @param val A value of variable var of which to get the percentage, also in quotes
#'
#' @return Returns the percentage of value val in relation to all values of var
#' @export
#'
#' @examples
#'  getperc(data.frame(a = c("duck", "duck", "goose")),
#'   "a", 
#'   "duck")
#'  
#'  # Also works when val is indexed (alphabetically)
#'  getperc(data.frame(a = c("duck", "duck", "goose")),
#'   "a", 
#'   2)
#' 
getperc <- function(data, var, val){
  # data must be a dataframe, var must be a variable in this data fram. GOTCHA: var must be written in "" , e.g. "var".
  # Val must be a value in var
  
  n_data <- dim(data)[1]
  
  round(((table(data[var])/n_data)[[val]])*100, 2) # %>% round(2)
}