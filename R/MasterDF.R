MasterDF <- function(){
  ExtractDB(SLAS2) %>%
    cbind(J_N = (.$Stb_J_N + .$Lin_J_N + .$Jag_J_N)) %>%
    mutate(.,
           Perc_Stb = Stb_J_N/J_N * 100,
           Perc_Lin = Lin_J_N/J_N * 100,
           Perc_Jag = Jag_J_N/J_N * 100) %>%
    cbind(STB_Index = (.$Perc_Stb + (0.5 * .$Perc_Lin) - .$Perc_Jag)) %>%
    cbind(VEC_JCyr = .$Junct_VEC_MeanI/.$Cell_VEC_MeanI) %>%
    cbind(WLR = .$Cell_MinL/.$Cell_MaxL) %>%
    cbind(Un_Cell_Id = paste0(.$Img_N,"_", .$Cell_N)) %>%
    within.data.frame(., rm(Stb_J_N, Lin_J_N, Jag_J_N, NaJ_J_N))
}
