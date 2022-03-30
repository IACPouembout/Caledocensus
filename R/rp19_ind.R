#' Données brutes du recensement 2019 de Nouvelle-Calédonie - Individus
#'
#' Chaque ligne représente un individu, identifié par la variable ID, et dont le logement est identifié par la variable IDLOG.
#' Les données sont géolocalisées à l'échelle Provinciale.
#'
#' @format A tibble with 271 407 rows and 43 variables:
#' \describe{
#' \item{ID}{Numéro d’individu anonymisé}
#' \item{IDLOG}{Numéro de logement anonymisé}
#' \item{AGEA}{Âge atteint}
#' \item{AGER}{Âge révolu}
#' \item{ANNINS}{Année d'installation}
#' \item{APE}{Code APE de l'établissement professionnel}
#' \item{CNAT}{Code nationalité}
#' \item{COUPLE}{Déclaration de vie en couple}
#' \item{CPAYSN}{Code Pays de naissance}
#' \item{CPAYSRA}{Code Pays de résidence antérieure}
#' \item{CS24}{Catégorie socio-professionnelle en 24 postes}
#' \item{CS42}{Catégorie socio-professionnelle en 42 postes}
#' \item{CS8}{Catégorie socio-professionnelle en 8 postes}
#' \item{CSSAL}{Catégorie socioprofessionnelle pour les salariés}
#' \item{DIPL}{Diplôme le plus élevé optenu}
#' \item{EMPL}{Conditions d'emplois}
#' \item{EXER}{Condition d'exercice de la profession}
#' \item{GAD}{Groupe d'âge décennal}
#' \item{GAQ}{Groupe d’âge quinquennal}
#' \item{GENRE}{Genre de l’individu}
#' \item{ILN}{Indicateur du lieu de naissance}
#' \item{IRA}{Indicateur de résidence antérieure}
#' \item{MINE}{Indicateur de travail en lien avec la mine}
#' \item{NAT}{Nationalité}
#' \item{PROV}{Province de résidence}
#' \item{PROVRA}{Province de résidence antérieure}
#' \item{PROVTRA}{Province de travail}
#' \item{RECH}{Ancienneté de recherche d’emploi}
#' \item{SAL}{Nombre de salariés}
#' \item{SCOL}{Inscription dans un établissement d’enseignement}
#' \item{SECT10}{Secteur d’activité en 10 postes}
#' \item{SECT21}{Secteur d’activité en 21 postes}
#' \item{SECT5}{Secteur d’activité en 5 postes}
#' \item{STAT}{Statut professionnel}
#' \item{STATANT}{Statut professionnel antérieur}
#' \item{STM}{Statut matrimonial légal}
#' \item{TACT}{Type d’activité}
#' \item{TP}{Temps de travail}
#' \item{TRAANT}{Travail antérieur}
#' \item{TRANS}{Mode de transport principal}
#' \item{TYP}{Type d’habitat}
#' \item{TYPEMPL}{Type de contrat d’emploi}
#' \item{TYPMENR}{Type de ménage}
#' }
#' @source \url{https://www.isee.nc/publications/la-nouvelle-caledonie-en-cartes-et-en-chiffres/donnees-du-recensement-2019-en-open-data}

"rp19_ind"