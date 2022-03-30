pacman::p_load("tidyverse","openxlsx","here","readxl","sf","stringi","snakecase")

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
  mutate(value=value/sum(value))%>%
  mutate(name=stringi::stri_trans_general(name,id = "Latin-ASCII"),   name=snakecase::to_snake_case(name) )%>%
  pivot_wider(names_from = name,values_from = value,names_prefix = "Part_")%>%
  ungroup()%>%
  muta


assign(sheet[i],data)}

pop_18plus_communes <- left_join(Genre,Communaute)%>%
  left_join(Tranche_age)%>%
  left_join(CSP)%>%
  left_join(Total)%>%
  mutate(Province=case_when(Commune %in% c("Boulouparis" ,"Bourail" ,"Dumbea","Farino","Ile des pins", "La foa","Moindou","Mont dore","Noumea","Paita","Thio","Yate")~"Province Sud",
                            Commune %in% c("Mare","Lifou","Ile des pins")~"Province des Iles",
                            TRUE~ "Province Nord"))%>%
relocate(Province,.before = Commune)  



usethis::use_data(pop_18plus_communes, overwrite = TRUE)


