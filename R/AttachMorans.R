AttachMorans <- function(ijroi, exp, cell_type, treatment, image_no){

ROIs <- list.files(path = ijroi, pattern = "*.roi", all.files = T, full.names = T)
RoiNames <- list.files(path = ijroi, pattern = "*.roi", all.files = T, full.names = F)
RoiNames <- gsub('.{4}$', '', RoiNames)

myfiles <- lapply(ROIs, read.ijroi)
RP <- map(myfiles, 'coords')
RPoly1 <- map(RP, Polygon)
RPoly2 <- map(RPoly1, list)
RPolySP <- mapply(Polygons, RPoly2, ID = RoiNames) %>%
  SpatialPolygons()

nb.list <- poly2nb(RPolySP, snap = 5, queen = F)
nb.matrix <- nb2listw(nb.list)

Morans <- moranNP.randtest(new_dataframe$data.Tot_NCH, nb.matrix, nrepet = 999, alter = "two-sided")

LMDF <- new_dataframe %>%
  select(data.Tot_NCH, id) %>%
    RemoveDup() %>%
      group_by(data.Tot_NCH) %>%
        as.list()

LMorans <- localmoran(LMDF$data.Tot_NCH, nb.matrix, zero.policy = T) %>%
  as.data.frame() %>%
    select('Ii', 'Pr(z > 0)')%>%
      rename(., c('Pr(z > 0)' = 'P')) %>%
        rownames_to_column(., 'id')

new_dataframe <- new_dataframe %>%
  group_by(id) %>%
    left_join(LMorans, 'id')
}
