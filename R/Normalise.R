Normalise <- function(x, intI, ...){
  as.data.frame(x %>%
                  select(...) %>%
                  cbind(intI) %>%
                  group_by(...) %>%
                  summarise(
                    n    = length(intI),
                    mean = mean(intI),
                    sd   = sd(intI))) %>%
    mutate(.,
           GlbMean = mean(mean),
           NormFact = GlbMean/mean)
}
