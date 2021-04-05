
### AUTHOR:        ERIC ODONGO
### DATE :         05TH/04/2021
### FUNCTION NAME: SUM_STATS
### PURPOSE : COMPUTES SUMMARY STATISTICS ACROSS COLUMNS IN A DATAFRAME.

sum_stats <- function(z) {
  N    <- apply(z, 2, function(x) length(which(!is.na(x))))
  Mean <- apply(z, 2, mean, na.rm = T)
  Var  <- apply(z, 2, var,  na.rm = T)
  SD   <- apply(z, 2, sd,   na.rm = T)
  Min  <- apply(z, 2, min,  na.rm = T)
  Max  <- apply(z, 2, max,  na.rm = T)
  return (data.frame(N, Mean = round(Mean,2), Var = round(Var,2), 
                     SD = round(SD,2), Min, Max, Range = Max-Min))
}