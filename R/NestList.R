NestList <- function(x){
  x[order(x$Img_N),] %>%
    group_by(Img_N, Treatment, Experiment, Img_Nuclei_N, Cell_Type, Replicate, Well)%>%
    nest %>%
    apply(., 1, as.list) %>%
    list.group(., Experiment, Cell_Type, Treatment)
}