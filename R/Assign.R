Assign <- function(x){
  x %>%
    mutate(Cell_Cycle = ifelse(x$Cell_Act_Cl == "Dividing", "LM", 
                               (ifelse(x$DNA_IntI_Norm <= 1300, "G0/G1", 
                                       ifelse(x$DNA_IntI_Norm > 1300 & x$DNA_IntI_Norm <= 1600, "S","G2/M")))))
}