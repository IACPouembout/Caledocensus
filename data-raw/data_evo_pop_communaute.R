pacman::p_load("tidyverse","here","readxl")


evo_pop_communaute <- readxl::read_xlsx(here("data-raw","evolution-pop-communautes.xlsx"),2)

i <- 2
for (i in 2:ncol(evo_pop_communaute)){
  
evo_pop_communaute[4,i] <-ifelse(is.na(evo_pop_communaute[4,i]) == TRUE,evo_pop_communaute[4,i-1] ,evo_pop_communaute[4,i])
  

  
  
}
  
names1 <- evo_pop_communaute[4,]
names2 <- evo_pop_communaute[5,]
names_1_2 <- paste(names2,names1,sep="_")


evo_pop_communaute <- evo_pop_communaute%>%slice(6:15)
colnames(evo_pop_communaute) <- names_1_2


evo_pop_communaute<- evo_pop_communaute%>%
  pivot_longer(2:21,names_to = c("Province","Annee"), values_to = "Pop",names_sep = "_")%>%
  rename("Communaute"=1)%>%
  mutate(Pop=as.numeric(as.character(Pop)),Annee=as.numeric(as.character(Annee)))

evo_pop_communaute$Communaute <- evo_pop_communaute$Communaute %>%
  fct_recode(
    "Autres" = "Autres (a)",
    "Autres dont plusieurs communautés" = "dont plusieurs communautés"
  )



usethis::use_data(evo_pop_communaute, overwrite = TRUE)

