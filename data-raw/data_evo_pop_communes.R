pacman::p_load("tidyverse","here","readxl")


evo_pop_communes <- readxl::read_xlsx(here("data-raw","population-recensements.xlsx"),2)



names <- evo_pop_communes[5,]%>%select(1:12)

names[1,1]="Commune"


evo_pop_communes <- evo_pop_communes%>%
  slice(6:38)%>%
  select(1:12)



colnames(evo_pop_communes) <- names


evo_pop_communes <- evo_pop_communes%>%
  mutate_at(2:6,function(x){str_trim(str_squish(str_remove_all(x,"\\(1\\)|\\(2\\)|NS| " )))})%>% 
  mutate_at(2:6,function(x){as.numeric(as.character(x))})%>%
  pivot_longer(2:12,names_to = "Annee",values_to = "Pop")%>%
  mutate(Commune=stringi::stri_trans_general(str_to_sentence(Commune),id = "Latin-ASCII"))%>%
  mutate(Province=case_when(Commune %in% c("Boulouparis" ,"Bourail" ,"Dumbea","Farino","Ile des pins", "La foa","Moindou","Mont-dore","Noumea","Paita","Sarramea","Thio","Yate")~"Province Sud",
                            Commune %in% c("Mare","Lifou","Ouvea")~"Province des Iles",
                            TRUE~ "Province Nord"),
         Annee=as.numeric(as.character(Annee)))%>%
  relocate(Province,.before = Commune)  

usethis::use_data(evo_pop_communes, overwrite = TRUE)
