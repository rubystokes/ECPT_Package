DeList <- function(x){
  x <- do.call(rbind, unlist(x, FALSE)) %>%
    flatten() %>%
    map(., as.data.frame)%>%
    rbindlist()

    x[!duplicated(x)]
}
