pacman::p_load("tidyverse","openxlsx","here","readxl","stringi","snakecase")

sheet <- openxlsx::getSheetNames(here("data-raw","pop-18ansetplus.xlsx"))

sheet <- sheet[2:5]
i <- 1


for (i in 1:4) {
  data <-   read_xlsx(here("data-raw","pop-18ansetplus.xlsx"),sheet = sheet[i])
varnames <- data[5,]
data <- data%>%slice(7:39)
colnames(data) <- varnames
col <- ncol(data)
col2 <- col-1



data <- data%>%
  rename( "Commune"=1)%>%
  mutate(Commune=str_to_sentence(Commune),Total=as.numeric(as.character(Total)))

Total <- data%>%select(Commune,Total)%>%
  rename("Pop_18_plus_total"=Total)

data <- data%>%
  mutate_at(2:col,function(x){as.numeric(x)})%>%
  select(-c(col))%>%
  pivot_longer(2:all_of(col2))%>%
  group_by(Commune)%>%
  mutate(value=value/sum(value,na.rm = T))%>%
  mutate(name=stringi::stri_trans_general(name,id = "Latin-ASCII"),   name=snakecase::to_snake_case(name) )%>%
  pivot_wider(names_from = name,values_from = value,names_prefix = "Part_")%>%
  ungroup()


assign(sheet[i],data)}

referendum_2020 <- readxl::read_xlsx(here("data-raw", "ref2020.xlsx"))%>%
  mutate(Commune=stringi::stri_trans_general(str_to_sentence(Communes),id = "Latin-ASCII"),
         Commune=recode(Commune,"Kaala gomen"="Kaala-gomen"),
         Part_Oui_2020=Oui/Votants)%>%
  select(Commune,Part_Oui_2020)


pop_18plus_communes <- left_join(Genre,Communaute)%>%
  left_join(Tranche_age)%>%
  left_join(CSP)%>%
  left_join(Total)%>%
  mutate(Province=case_when(Commune %in% c("Boulouparis" ,"Bourail" ,"Dumbea","Farino","Ile des pins", "La foa","Moindou","Mont dore","Noumea","Paita","Sarramea","Thio","Yate")~"Province Sud",
                            Commune %in% c("Mare","Lifou","Ouvea")~"Province des Iles",
                            TRUE~ "Province Nord"))%>%
relocate(Province,.before = Commune)%>%
  left_join(referendum_2020)

options(scipen = 999)
pop_18plus_communes$Pop_18_plus_classe <- cut(pop_18plus_communes$Pop_18_plus_total,
       include.lowest = TRUE,
       right = FALSE,
       dig.lab = 6,
       breaks = c(440, 1200, 1800, 2600, 4000, 73000)
)

pop_18plus_communes <- pop_18plus_communes%>%
  relocate(Pop_18_plus_classe,.after =Pop_18_plus_total)


pop_18plus_communes$Pop_18_plus_classe<- pop_18plus_communes$Pop_18_plus_classe %>%
  fct_recode(
    "De 440 à 1200 individus" = "[440,1200)",
    "De 1200 à 1800 individus" = "[1200,1800)",
    "De 1800 à 2600 individus" = "[1800,2600)",
    "De 2600 à 4000 individus" = "[2600,4000)",
    "Plus de 4000 individus" = "[4000,73000]"
  )



pop_18plus_communes$Pop_18_plus_classe <- pop_18plus_communes$Pop_18_plus_classe %>%
  fct_relevel(
    "De 440 à 1200 individus", "De 1200 à 1800 individus", "De 1800 à 2600 individus",
    "De 2600 à 4000 individus", "Plus de 4000 individus"
  )




usethis::use_data(pop_18plus_communes, overwrite = TRUE)


