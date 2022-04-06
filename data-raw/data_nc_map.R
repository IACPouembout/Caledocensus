pacman::p_load("tidyverse","here","sf","ggthemes","ggsflabel","ggspatial")





nc_map <- read_sf(here('data-raw',"NC_communes.shp"))%>%
  mutate(Commune=stringi::stri_trans_general(str_to_sentence(nom_minus),id = "Latin-ASCII"),Commune=recode(Commune,"Kaala gomen"="Kaala-gomen")  )%>%
  mutate(Province=case_when(Commune %in% c("Boulouparis" ,"Bourail" ,"Dumbea","Farino","Ile des pins", "La foa","Moindou","Mont dore","Noumea","Paita","Sarramea","Thio","Yate")~"Province Sud",
                            Commune %in% c("Mare","Lifou","Ouvea")~"Province des Iles",
                            TRUE~ "Province Nord"))




data("pop_18plus_communes")

nc_map$Commune
pop_18plus_communes$Commune

nc_map <- nc_map%>%
  left_join(pop_18plus_communes)



usethis::use_data(nc_map, overwrite = TRUE)



