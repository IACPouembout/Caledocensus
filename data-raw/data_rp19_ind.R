## code to prepare `DATASET` dataset goes here
pacman::p_load("tidyverse","haven","sjlabelled","here")


rp19_Nord=readr::read_delim(url("https://www.isee.nc/component/phocadownload/category/193-recensement?download=2133:donnees-detaillees-rp19-open-data-individus-nord"), 
                     delim = ";", escape_double = FALSE, trim_ws = TRUE)

rp19_Iles=readr::read_delim(url("https://www.isee.nc/component/phocadownload/category/193-recensement?download=2132:donnees-detaillees-rp19-open-data-individus-iles"), 
                     delim = ";", escape_double = FALSE, trim_ws = TRUE)


rp19_Sud1=readr::read_delim(url("https://www.isee.nc/component/phocadownload/category/193-recensement?download=2135:donnees-detaillees-rp19-open-data-individus-sud-1-2"), 
                     delim = ";", escape_double = FALSE, trim_ws = TRUE)



rp19_Sud2=readr::read_delim(url("https://www.isee.nc/component/phocadownload/category/193-recensement?download=2136:donnees-detaillees-rp19-open-data-individus-sud-2-2"), 
                     delim = ";", escape_double = FALSE, trim_ws = TRUE)



rp19_ind=rp19_Nord%>%
  rbind(rp19_Iles)%>%
  rbind(rp19_Sud1)%>%
  rbind(rp19_Sud2)%>%
  set_variable_labels(AGEA="Âge atteint",AGER="Âge révolu",ANNINS="Année d'installation",
                      APE="Code APE de l'établissement professionnel",CNAT="Code nationalité",COUPLE="Déclaration de vie en couple",
                      CPAYSN="Code Pays de naissance",CPAYSRA="Code Pays de résidence antérieure",CS24="Catégorie socio-professionnelle en 24 postes",
                      CS42="Catégorie socio-professionnelle en 42 postes",CS8="Catégorie socio-professionnelle en 8 postes",
                      CSSAL = "Catégorie socioprofessionnelle pour les salariés",DIPL = "Diplôme le plus élevé optenu",EMPL="Conditions d'emplois",
                      EXER="Condition d'exercice de la profession",GAD="Groupe d'âge décennal",GAQ = "Groupe d’âge quinquennal" ,GENRE = "Genre de l’individu",
                      ID = "Numéro d’individu anonymisé",IDLOG = "Numéro de logement anonymisé" ,ILN = "Indicateur du lieu de naissance",
                      IRA = "Indicateur de résidence antérieure",MINE = "Indicateur de travail en lien avec la mine",NAT = "Nationalité",
                      PROV = "Province de résidence",PROVRA = "Province de résidence antérieure", PROVTRA = "Province de travail",
                      RECH = "Ancienneté de recherche d’emploi",SAL = "Nombre de salariés",SCOL = "Inscription dans un établissement d’enseignement",
                      SECT10 = "Secteur d’activité en 10 postes",SECT21 = "Secteur d’activité en 21 postes",SECT5 = "Secteur d’activité en 5 postes",
                      STAT = "Statut professionnel",STATANT = "Statut professionnel antérieur",STM =  "Statut matrimonial légal",
                      TACT = "Type d’activité",TP = "Temps de travail",TRAANT = "Travail antérieur",TRANS = "Mode de transport principal",
                      TYP = "Type d’habitat",TYPEMPL = "Type de contrat d’emploi",TYPMENR = "Type de ménage" 
  )%>%
  set_value_labels(COUPLE = c("Vit en couple"=1 , "Ne vit pas en couple" =2),
                   
                   CS24=c('Agriculteurs exploitants' = 10 , 'Artisans' = 21 , 'Commerçants et assimilés' = 22 , "Chefs d'entreprise de 10 salariés ou plus" = 23 , 'Professions libérales et assimilés' = 31 , 'Cadres de la fonction publique, professions intellectuelles et artistiques' = 32 , "Cadres d'entreprise" = 36 ,
                          "Professions intermédiaires de l'enseignement, de la santé, de la fonction publique et assimilés" = 41 , 'Professions intermédiaires administratives et commerciales des entreprises' = 46 , 'Techniciens' = 47 , 'Contremaîtres, agents de maîtrise' = 48 , 'Employés de la fonction publique' = 51 , "Employés administratifs d'entreprise" = 54 , 
                          'Employés de commerce' = 55 , 'Personnels des services directs aux particuliers' = 56 , 'Ouvriers qualifiés' = 61 , 'Ouvriers non qualifiés' = 66 , 'Ouvriers agricoles' = 69),
                   
                   CS42=c("Agriculteurs sur petites exploitations" = 11 , "Agriculteurs sur moyennes exploitations" = 12 , "Agriculteurs sur grandes exploitations" = 13 , "Artisans" = 21 , "Commerçants et assimilés" = 22 , "Chefs d'entreprise de 10 salariés ou plus" = 23 , "Professions libérales" = 31 , "Cadres de la fonction publique" = 33 , "Professeurs, professions scientifiques" = 34 , "Professions de l'information, des arts et des spectacles" = 35 , "Cadres administratifs et commerciaux d'entreprise" = 37 , "Ingénieurs et cadres techniques d'entreprise" = 38 , "Professeurs des écoles, instituteurs et assimilés" = 42 , "Professions intermédiaires de la santé et du travail social" = 43 , "Clergé, religieux" = 44 , "Professions intermédiaires administratives de la fonction publique" = 45 , "Professions intermédiaires administratives et commerciales des entreprises" = 46 , "Techniciens" = 47 , "Contremaîtres,agents de maîtrise" = 48 , "Employés civils et agents de service de la fonction publique" = 52 , "Policiers et militaires" = 53 , "Employés administratifs d'entreprise" = 54 , "Employés de commerce" = 55 , "Personnels des services directs aux particuliers" = 56 , "Ouvriers qualifiés de type industriel" = 62 , "Ouvriers qualifiés de type artisanal" = 63 , "Chauffeurs" = 64 , "Ouvriers qualifiés de la manutention du magasinage et du transport" = 65 , "Ouvriers non qualifiés de type industriel" = 67 , "Ouvriers non qualifiés de type artisanal" = 68 , "Ouvriers agricoles" = 69),
                   
                   CS8    =c("Agriculteurs exploitants" = 1 ,
                             "Artisans, commerçants et chefs d'entreprise" = 2 ,
                             "Cadres et professions intellectuelles supérieures" = 3 ,
                             "Professions Intermédiaires" = 4, 
                             "Employés" = 5, 
                             "Ouvriers"= 6 ,
                             "Retraités"=7,
                             "Autres personnes sans activité professionnelle"=8),
                   CSSAL=c("Manœuvre, ouvrier spécialisé"  = 1 ,
                           "Ouvrier qualifié ou hautement qualifié, technicien d’atelier"  = 2 ,
                           "Technicien (non cadre)"  = 3 ,
                           "Agent de catégorie B de la fonction publique"  = 4 ,
                           "Agent de maîtrise, maîtrise administrative ou commerciale, VRP"  = 5 ,
                           "Agent de catégorie A de la fonction publique"  = 6 ,
                           "Ingénieur, cadre d’entreprise"  = 7 ,
                           "Agent de catégorie C ou D de la fonction publique"  = 8 ,
                           "Employé (par exemple : de bureau, de commerce, de la restauration, de maison)" = 9),
                   DIPL=c("Pas de scolarisation"  = "01" ,
                          "Aucun diplôme mais scolarisation jusqu’en primaire"  = "02" ,
                          "Aucun diplôme mais scolarisation jusqu’au collège"  = "03" ,
                          "Aucun diplôme mais scolarisation au-delà du collège"  = "04" ,
                          "CEP"  = "11" ,
                          "BEPC, brevet élémentaire, brevet des collèges, DNB"  = "12" ,
                          "CAP, BEP ou diplôme de niveau équivalent"  = "13" ,
                          "Bac général ou technologique, brevet supérieur, capacité en droit, DAEU, ESEU"  = "14" ,
                          "Bac professionnel, brevet professionnel de technicien ou d’enseignement, diplôme équivalent"  = "15", 
                          "BTS, DUT, Deug, Deust, diplôme de santé ou du social niveau bac + 2, diplôme équivalent"  = "16" ,
                          "Licence, Licence pro, maîtrise, diplôme équivalent de niveau bac + 3 ou bac + 4 " = "17", 
                          "Master, DEA, diplôme grande école niveau bac + 5, doctorat de santé"= "18", 
                          "Doctorat de recherche (hors santé)" = "19") ,
                   EMPL=c("Artisan, commerçant, industriel, travailleur indépendant"  = 3, 
                          "Stagiaire rémunéré, apprenti sous contrat"  = 4 ,
                          "Salarié du secteur privé à durée déterminée"  = 5, 
                          "Salarié du secteur privé à durée indéterminée"  = 6, 
                          "Salarié du secteur public à durée déterminée"  = 7, 
                          "Salarié du secteur public à durée indéterminée" = 8 ),
                   EXER=c("Continue" =  1 ,
                          "Intermittente ou saisonnière" =  2 ,
                          "Exceptionnelle" =  3 ),
                   GAD=c("0 à 9 ans"  = 0 ,
                         "10 à 19 ans"  = 1 ,
                         "20 à 29 ans"  = 2 ,
                         "30 à 39 ans"  = 3 ,
                         "40 à 49 ans"  = 4 ,
                         "50 à 59 ans"  = 5 ,
                         "60 à 69 ans"  = 6 ,
                         "70 à 79 ans"  = 7, 
                         "80 à 89 ans"  = 8 ,
                         "90 ans ou " = 9),
                   GAQ = c("0 à 4 ans"  = 0 ,
                           "5 à 9 ans"  = 1 ,
                           "10 à 14 ans"  = 2 ,
                           "15 à 19 ans"  = 3 ,
                           "20 à 24 ans"  = 4 ,
                           "25 à 29 ans"  = 5 ,
                           "30 à 34 ans"  = 6 ,
                           "35 à 39 ans"  = 7 ,
                           "40 à 44 ans"  = 8 ,
                           "45 à 49 ans"  = 9 ,
                           "50 à 54 ans"  = 10, 
                           "55 à 59 ans"  = 11, 
                           "60 à 64 ans"  = 12, 
                           "65 à 69 ans"  = 13, 
                           "70 à 74 ans"  = 14, 
                           "75 à 79 ans"  = 15, 
                           "80 à 84 ans"  = 16, 
                           "85 à 89 ans"  = 17, 
                           "90 à 94 ans"  = 18, 
                           "95 ans ou +" = 19),
                   GENRE =c("Homme"= 1,
                            "Femme" = 2),
                   
                   ILN= c("Nouvelle-Calédonie" = 1 ,
                          "Wallis-et-Futuna" = 2 ,
                          "Polynésie française" =3 ,
                          "Métropole, DOM ou autre territoire français" =4 ,
                          "Étranger"= 5 ),
                   
                   IRA= c("Dans le même logement que maintenant" = 1 ,
                          "Dans un autre logement de la même commune" = 2 ,
                          "Dans une autre commune en Nouvelle-Calédonie" = 3, 
                          "En métropole, DOM" = 4 ,
                          "A l’étranger" = 5 ,
                          "Non renseigné" = 9),
                   
                   MINE=c( "L’individu travaille en lien avec la mine"=1),
                   
                   NAT= c("Française (de naissance)"  = 1, 
                          "Française (par acquisition)"  = 2 ,
                          "Étrangère" = 3 ),
                   
                   
                   RECH= c("Cherche un emploi depuis moins d'un an"  = 1 ,
                           "Cherche un emploi depuis un an ou plus"  = 2 ,
                           "Ne recherche pas d’emploi" = 3), 
                   
                   SAL= c("Aucun" =  1 ,
                          "1 à 9 salarié" =  2 ,
                          "10 salariés ou plus" =  3 ,
                          "Non renseigné" =9),
                   
                   SCOL= c("Est inscrit dans un établissement d’enseignement" =  1, 
                           "N’est pas inscrit dans un établissement d’enseignement" = 2),
                   
                   SECT10 = c("Agriculture, sylviculture et pêche"  = "AZ" ,
                              "Industrie manufacturière, industries extractives  et autres " = "BE" ,
                              "Construction"  = "FZ" ,
                              "Commerce de gros et de détail, transports, hébergement et restauration"  = "GI" ,
                              "Information et communication"  = "JZ" ,
                              "Activités financières et d'assurance" = "KZ" ,
                              "Activités immobilières" = "LZ" ,
                              "Activités scientifiques et techniques ; services administratifs et de soutien "= "MN" ,
                              "Administration publique, enseignement, santé humaine et action sociale" = "OQ" ,
                              "Autres activités de services"= "RU"),
                   
                   
                   SECT21 =c("Agriculture, sylviculture et pêche" =  "A" ,
                             "Industries extractives" =  "B" ,
                             "Industrie manufacturière" =  "C" ,
                             "Production et distribution d’électricité, de gaz, de vapeur et d’air conditionné" ="D" ,
                             "Production et distribution d’eau, assainissement, gestion des déchets et pollution" =  "E" ,
                             "Construction" =  "F" ,
                             "Commerce ; réparation d'automobiles et de motocycles" ="G" ,
                             "Transports et entreposage" = "H" ,
                             "Hébergement et restauration" = "I" ,
                             "Information et communication" ="J" ,
                             "Activités financières et d'assurance" =  "K" ,
                             "Activités immobilières" =  "L" ,
                             "Activités spécialisées, scientifiques et techniques" =  "M" ,
                             "Activités de services administratifs et de soutien" =  "N" ,
                             "Administration publique" =  "O" ,
                             "Enseignement" =  "P" ,
                             "Santé humaine et action sociale" =  "Q" ,
                             "Arts, spectacles et activité récréatives" =  "R" ,
                             "Autres activités de services" =  "S" ,
                             "Activités des ménages en tant qu’employeurs ; activités indifférenciées des ménages en tant que producteurs de biens et services pour usage propre" =  "T" ,
                             "Activités extra territoriales" =  "U"),
                   
                   SECT5=c("Agriculture"  = 1,
                           "Industrie"  = 2 ,
                           "Construction"  = 3,
                           "Commerce"  = 4 ,
                           "Services" = 5),
                   
                   
                   STAT = c("Indépendant ou à son compte" =   1 ,
                            "Chef d’entreprise salarié, PDG, gérant minoritaire de SARL" =   2 ,
                            "Salarié" = 3 ,
                            "Aide familial" =   4 ,
                            "Autre" =    5, 
                            "Non renseigné" = 9),
                   
                   STATANT =c("Salarié" = 1 ,
                              "Indépendant ou à son compte"  = 2 ,
                              "Aide familial"  = 3 ,
                              "Non renseigné" = 9),
                   
                   
                   STM= c("Marié" = 1, 
                          "Pacsé" = 2, 
                          "En concubinage ou union libre" =  3, 
                          "Veuf" =  4, 
                          "Divorcé" = 5, 
                          "Célibataire" = 6),
                   
                   TACT = c("Emploi" =1, 
                            "Apprentissage sous contrat ou stage rémunéré" =2, 
                            "Études ou stage non rémunéré" =3, 
                            "Chômage" = 4, 
                            "Retraite ou pré-retraite" = 5, 
                            "Femme ou homme au foyer" = 6, 
                            "Autre situation" = 7 ),
                   
                   TP = c("Temps complet" =  1 ,
                          "Temps partiel" =  2),
                   
                   TRAANT = c("A déjà travaillé"  = 1 ,
                              "N’a jamais travaillé" = 2),
                   
                   TRANS =c("Marche à pied" =  1 ,
                            "Vélo" = 2 ,
                            "Deux-roues motorisé" = 3 ,
                            "Voiture, camion, fourgonnette, pick-up" = 4 ,
                            "Transports en commun" = 5 ),
                   
                   
                   TYP = c("Logement ordinaire"  = 2, 
                           "Communauté" = 3),
                   
                   TYPEMPL = c("Emploi sans limite de durée, CDI, titulaire de la fonction publique" =  1 ,
                               "CDD autre que saisonnier" =  2 ,
                               "Contrat saisonnier" =  3 ,
                               "Contrat d’intérim ou de travail temporaire" =  4 ,
                               "Contrat d’apprentissage" =  5 ,
                               "Non renseigné" = 9 ),
                   
                   TYPMENR=c(          "Personne seule" =  1, 
                                       "Couple sans enfant" =  2, 
                                       "Couple avec enfant(s)" =  3, 
                                       "Famille monoparentale" =  4, 
                                       "Autres : ménage complexe" =  5 )
                   
  )%>%
  mutate_if(sjlabelled::is_labelled,sjlabelled::as_label)


usethis::use_data(rp19_ind, overwrite = TRUE)
