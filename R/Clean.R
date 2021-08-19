Clean <- function(x){
  x %>%
    mutate(Cy_NCH_IntI = ifelse(is.na(.$Cy_NCH_IntI) , 0, .$Cy_NCH_IntI)) %>%
    mutate(Nu_NCH_IntI = ifelse(is.na(.$Nu_NCH_IntI) , 0, .$Nu_NCH_IntI)) %>%
    mutate(STB_Index = ifelse(is.na(.$STB_Index), "FLAGGED", .$STB_Index))%>%
    mutate(Cell_Act_Cl = ifelse(.$Cell_Act_Cl == "NC", "FLAGGED", .$Cell_Act_Cl))
}
