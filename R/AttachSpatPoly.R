AttachSpatPoly <-function(ijroi, exp, cell_type, treatment, image_no){

  ROIs <- list.files(path = ijroi, pattern = "*.roi", all.files = T, full.names = T)
  RoiNames <- list.files(path = ijroi, pattern = "*.roi", all.files = T, full.names = F)
  RoiNames <- gsub('.{4}$', '', RoiNames)

  myfiles <- lapply(ROIs, read.ijroi)
  RP <- map(myfiles, 'coords')
  RPoly1 <- map(RP, Polygon)
  RPoly2 <- map(RPoly1, list)
  RPolySP <- mapply(Polygons, RPoly2, ID = RoiNames) %>% SpatialPolygons()

  nb.list <- poly2nb(RPolySP, snap = 5, queen = F)
  nb.matrix <- nb2listw(nb.list)

  ROInotch_df <- CreateDF(DeList(Master_List))%>%
    subset(Experiment == exp) %>%
    subset(Cell_Type == cell_type) %>%
    subset(Treatment == treatment) %>%
    subset(Img_N == image_no) %>%
    select('data.Tot_NCH')

  ROInotch_df$id <- RoiNames
  ROInotch <- as.list(ROInotch_df)
  SpatPoly <- SpatialPolygonsDataFrame(RPolySP, ROInotch_df, match.ID = F) %>% fortify()

  SpatPoly2 <- SpatPoly %>%
    group_by(id)

  new_dataframe <- CreateDF(DeList(Master_List))%>%
    subset(Experiment==exp) %>%
    subset(Cell_Type==cell_type) %>%
    subset(Treatment==treatment) %>%
    subset(Img_N==image_no) %>%
    left_join(ROInotch_df) %>%
    left_join(SpatPoly2)
}
