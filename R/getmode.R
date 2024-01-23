#' Get the mode of a vector or variable
#'
#' The mode is the number that appears the most often in a vector or variable.
#' This measure is especially important for nominal variables since the mean 
#' or median cannot meaningfully be reported.
#'
#' @param v a vector of variable in dataframe
#'
#' @return Returns the mode of v, i.e., the value occurring most often
#' @export
#'
#' @examples
getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}