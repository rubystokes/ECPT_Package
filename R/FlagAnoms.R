FlagAnoms <- function(x){
  x %>%
    mutate(Cell_Area = ifelse(.$Cell_Area > 51000, "FLAGGED", .$Cell_Area)) %>%
    mutate(J_N = ifelse(.$J_N < 10 & Cell_Cycle !="LM", "FLAGGED", .$J_N)) %>%
    mutate(Nu_Area = ifelse(.$Nu_Area > 6000, "FLAGGED", .$Nu_Area))
}
