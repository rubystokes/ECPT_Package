CreateDF <- function(x){
  flatten(x) %>%
    map(., as.data.frame) %>%
    rbindlist() %>%
    RemoveDup()
}
