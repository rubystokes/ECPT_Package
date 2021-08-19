CalculateTotNCH <- function(x){
  mutate(x, Tot_NCH = x$Nu_NCH_IntI + x$Cy_NCH_IntI)
}