#!perl

use Cwd;
use HTML::Entities;
use RTF::Writer;

print "\n\n\n\nCe script a pour but de transformer les fichier .xml de l'application Apafis en fichiers lisibles dans un traitement de texte.\n Chaque fichier .xml sera converti en .doc \n
ATTENTION, si un fichier du nom de la saisine (.doc) existe, il sera repris par le script.\n-
Aucune garantie n'est fournie sur l'exactitude de la retranscription par le script, si vous constatez un souci, merci de m'en faire part.\n-
Benoit Petit-Demouliere : petitd\@igbmc.fr\n

Script Version 1.02 - 07/03/2019.

Continuez en tapant 1 puis Valider, ou quittez en tapant une autre touche.\n";
chomp (my $result = <STDIN>);
if ($result == 1){
my $dir = cwd();

opendir DIR, $dir or die "cannot open dir $dir: $!";
my @files = glob "$dir/*.xml";
closedir(DIR);

foreach(@files){
  my $qfn = $_;

open IN,$qfn or die $!;
open OUT,">",$qfn."\.doc" or die $!;

while (<IN>) {
my $line = $_;
chomp $line;


my %balises = (
"InformationsGenerales"=>"1. Informations Générales",
"TitreProjet"=>"1.2. Titre du projet :",
"NumVersion"=>"Numéro de version :",
"ReferenceDossier"=>"1.1. Référence Dossier :",
"DureeProjet"=>"1.2. Durée du projet :",
"DureeAnnees"=>"Années :",
"DureeMois"=>"Mois :",
"DureeJours"=>"Jours :",
"DebutQuandProjetAutorise"=>"Dès que le projet est autorisé :",
"DatePrevueDebutProjet"=>"1.3. Date prévue de début du projet (Année-Mois-Jour):",
"Date"=>"Date :",
"RNT"=>"2. Rnt (inutilisé)",
"InformationsAdministrativesEtReglementaires"=>"3. Informations Administratives et Réglementaires",
"EtablissementUtilisateur"=>"3.1. L établissement utilisateur (EU)",
"AgrementUE"=>"3.1.1. Agrément de l'EU où seront utilisés les animaux :",
"NomUE"=>"Nom :","NumeroAgrement"=>"Numéro d'agrément :",
"DateDelivrance"=>"Date de délivrance de l'agrément :",
"CiviliteResponsable"=>"Civilité :",
"NomResponsable"=>"Nom du responsable :",
"PrenomResponsable"=>"Prénom du responsable :",
"EMailResponsable"=>"Adresse électronique du responsable :",
"CiviliteDelegataire"=>"Civilité du délégataire :",
"NomDelegataire"=>"Nom de la personne délégataire du responsable présente dans l'EU :",
"PrenomDelegataire"=>"Prénom de la personne délégataire du responsable présente dans l'EU :",
"EMailDelegataire"=>"Adresse électronique de ce délégataire :",
"ComiteEthiqueAgree"=>"3.1.2. Comité d'éthique agréé par le MESR dont relève l'EU :",
"ResponsablesMiseEnOeuvre NombreResponsablesMiseEnOeuvre=\"1\""=>"3.1.3. Responsable(s) de la mise en oeuvre générale du projet dans l'EU et de sa conformité à l'autorisation de projet :",
"ResponsablesMiseEnOeuvre NombreResponsablesMiseEnOeuvre=\"2\""=>"3.1.3. Responsable(s) de la mise en œuvre générale du projet dans l'EU et de sa conformité à l'autorisation de projet :",
"ResponsablesMiseEnOeuvre NombreResponsablesMiseEnOeuvre=\"3\""=>"3.1.3. Responsable(s) de la mise en œuvre générale du projet dans l'EU et de sa conformité à l'autorisation de projet :",
"ResponsablesMiseEnOeuvre NombreResponsablesMiseEnOeuvre=\"4\""=>"3.1.3. Responsable(s) de la mise en œuvre générale du projet dans l'EU et de sa conformité à l'autorisation de projet :",
"CoordonneesResponsablesMiseEnOeuvre"=>"Responsable(s) :",
"Civilite"=>"Civilité :",
"Nom"=>"Nom :",
"Prenom"=>"Prenom :",
"AdressePostale"=>"Adresse postale :",
"NomLaboratoire"=>"Nom du Laboratoire :",
"ComplementAdresse"=>"Complément :",
"NumeroRue"=>"Numéro de rue :",
"Voie"=>"Voie :",
"CodePostal"=>"Code Postal :",
"Ville"=>"Ville :",
"Pays"=>"Pays :",
"Email"=>"Email :",
"NumTelephone"=>"Téléphone :",
"ResponsablesBienEtre NombreResponsablesBienEtre=\"1\""=>"3.1.4. Responsable(s) du bien-être des animaux :",
"ResponsablesBienEtre NombreResponsablesBienEtre=\"2\""=>"3.1.4. Responsable(s) du bien-être des animaux :",
"ResponsablesBienEtre NombreResponsablesBienEtre=\"3\""=>"3.1.4. Responsable(s) du bien-être des animaux :",
"ResponsablesBienEtre NombreResponsablesBienEtre=\"4\""=>"3.1.4. Responsable(s) du bien-être des animaux :",
"CoordonneesResponsablesBienEtre"=>"Responsable(s) :",
"Personnel"=>"3.2. Le personnel ",
"ConceptionProceduresExp"=>"Compétences des personnes participant au projet : - la conception des procédures expérimentales et des projets : ",
"ApplicationProceduresExp"=>" - l'application de procédures expérimentales aux animaux : ",
"SoinAuxAnimaux"=>" - les soins aux animaux : ",
"MiseAMort"=>" - la mise à mort des animaux : ",
"Projet"=>"3.3. Le projet",
"ObjectifDuProjet"=>"3.3.1. L'objectif du projet :",
"JustificationProjet"=>"Est-il :",
"JustifieEducativement"=>" - justifié du point de vue éducatif ?	: ",
"RequisLoi"=>" - requis par la loi ?	: ",
"JustifieScientifiquement"=>" - justifié du point de vue scientifique ?	: ",
"InformationsJustification"=>"Quelle est l’instance qui a évalué l’intérêt de ce projet ? ",
"DescriptionProjet"=>"3.3.2. Description du projet :",
"DescriptionProjet2"=>"3.3.2. Description du projet :",
"ObjectifsDuProjet"=>"3.3.2.1. Objectifs du projet :",
"DerouleDuProjet"=>"3.3.2.2. Déroulé du projet :",
"BeneficesDuProjet"=>"3.3.2.3. Bénéfices attendus du projet (version scientifique):",
"NuisancesAnimaux"=>"3.3.2.4. Nuisances ou effets indésirables attendus sur les animaux (version scientifique):",
"MethodeMiseAMort"=>"3.3.3. Précisez, le cas échéant, la ou les méthodes de mise à mort prévue(s) :",
"ElementsScientifiquesJustifiantDemandeMiseAMort"=>"3.3.4. Précisez, le cas échéant, les éléments scientifiques justifiant la demande de dérogation concernant la méthode de mise à mort envisagée :",
"StrategieExperimentations"=>"3.3.5. Stratégie d'expérimentation ou d'observation et approche statistique utilisée afin de réduire au minimum le nombre d'animaux, la douleur, la souffrance et l'angoisse, infligées et l'impact environnemental, le cas échéant . si une étude statistique est prévue, indiquez et justifiez les tests choisis (INUTILISE):",
"Strategies3R"=>"3.3.6. Stratégies de Remplacement, de Réduction et de Raffinement",
"Remplacement"=>"3.3.6.1. Remplacement",
"Reduction"=>"3.3.6.2. Réduction",
"Raffinement"=>"3.3.6.3. Raffinement",
"Animaux"=>"3.4. Les animaux",
"JustificationRecoursAuxAnimaux"=>"3.4.1. Justifiez la nécessité d'avoir recours à des animaux pour atteindre les objectifs du projet (inutilisé):",
"ListeAnimaux"=>"3.4.2. Espèces animales ou types d'animaux utilisés (le champ 3.4.1. est supprimé) :",
"Souris"=>"Souris (Mus musculus) [A1]&emsp;",
"Rats"=>"Rats (Rattus norvegicus) [A2]&emsp;",
"Cobayes"=>"Cobayes (Cavia porcellus) [A31]&emsp;",
"HamstersSyriens"=>"Hamsters (syriens) (Mesocricetus auratus) [A4]&emsp;",
"HamstersChinois"=>"Hamsters (chinois) (Cricetulus griseus) [A5]&emsp;",
"Gerbille"=>"Gerbilles de Mongolie (Meriones unguiculatus) [A6]&emsp;",
"AutresRongeurs"=>"Autres rongeurs (Rodentia) [A7]&emsp;",
"Lapins"=>"Lapins (Oryctolagus cuniculus) [A8]&emsp;",
"Chats"=>"Chats (Felis catus) [A9]&emsp;",
"Chiens"=>"Chiens (Canis familiaris) [A10];&emsp;",
"Furets"=>"Furets (Mustela putorius furo) [A11]&emsp;",
"AutresCarnivores"=>"Autres carnivores (carnivora) [A12]&emsp;",
"Chevaux"=>"Chevaux, ânes et croisements (Equidae) [A13]&emsp;",
"Porcs"=>"Porcs (Sus scrofa domesticus) [A14]&emsp;",
"Caprins"=>"Caprins (Capra aegagrus hircus) [A15]&emsp;",
"Ovins"=>"Ovins (Ovis aries) [A16]&emsp;",
"Bovins"=>"Bovins (Bos taurus) [A17]&emsp;",
"Prosimien"=>"Prosimiens (prosimia) [A18]&emsp;",
"Ouistitis"=>"Ouistitis et tamarins (par exemple, Callithrix jacchus) [A19]&emsp;",
"SingeCynomologue"=>"Singe cynomolgus (Macaca fascicularis) [A20]&emsp;",
"SingeRhesus"=>"Singe rhésus (Macaca mulatta) [A21]&emsp;",
"Vervets"=>"Vervets (Chlorocebus spp.) (soit pygerythrus, soit sabaeus) [A22]&emsp;",
"Babouins"=>"Babouins (Papio son.) [A23]&emsp;",
"Sairimis"=>"Saïmiris (par exemple, Saimiri sciureus) [A24]&emsp;",
"AutresSingesAncienMonde"=>"Autres espèces de singes de l'Ancien Monde (autres espèces de Cercopithecoidea)[A25-1]&emsp;",
"AutresSingesNouveauMonde"=>"Autres espèces de singes du Nouveau Monde[A25-2]&emsp;",
"AutresPrimateNonHumain"=>"Autres espèces de primates non humains [cocher [A25-1] ou [A25-2]]&emsp;",
"SingesAntropoides"=>"SingesAntropoides&emsp;",
"AutresMammiferes"=>"Autres mammifères (autres Mammalia) [A27]&emsp;",
"PoulesDomestiques"=>"Poules domestiques (Gallus gallus domesticus) [A28]&emsp;",
"Dindes"=>"Dindes&emsp;",
"AutresOiseaux"=>"Autres oiseaux (autres Aves) [A29]&emsp;",
"Reptiles"=>"Reptiles (Reptilia) [A30]&emsp;",
"GrenouillesRana"=>"Grenouilles Rana (Rana temporaria et Rana pipiens) [ABI]&emsp;",
"GrenouillesXenopus"=>"Grenouilles Xenopus (Xenopus laevis et Xenopus tropicalis) [A32]&emsp;",
"AutresAmphibiens"=>"Autres amphibiens (autres Amphibia) [A33]&emsp;",
"PoissonsZebres"=>"Poissons zèbres (Danio rerio) [A34]&emsp;",
"Bars"=>"Bars&emsp;",
"Saumons"=>"Saumons&emsp;",
"Guppies"=>"Guppies&emsp;",
"AutresPoissons"=>"Autres poissons (autres Pisces) [A35]&emsp;",
"Cephalopodes"=>"Céphalopodes (Cephalopoda) [A36]&emsp;",
"PertinenceAnimauxChoisis"=>"3.4.3. Justifiez la pertinence de l'(des) espèce(s) animale(s) choisie(s) :",
"EspecesMenacees"=>"3.4.4. S'agit-il de spécimens d'espèces menacées énumérées à l'annexe A du règlement (CE) n° 338/97 du Conseil du 9 décembre 1996 relatif à la protection des espèces de faune et de flore sauvages par le contrôle et leur commerce ?",
"OuiEspecesMenacees"=>"Si oui, éléments scientifiques démontrant que la finalité de la procédure expérimentale ne peut être atteinte en utilisant d'autres espèces que celles énumérées dans cette annexe :",
"Primate"=>"3.4.5. S'agit-il de spécimens de primates non humains ?",
"OuiPrimate"=>"Si oui, éléments scientifiques démontrant que la finalité de la procédure expérimentale ne peut être atteinte en utilisant d'autres espèces de primates non humains:",
"CaptureNature"=>"3.4.6. S'agit-il d'animaux capturés dans la nature ? ",
"OuiCaptureNature"=>"Si oui, éléments scientifiques démontrant que la finalité de la procédure expérimentale ne peut être atteinte en utilisant d'autres animaux que ceux  capturés dans la nature :",
"EspeceDomestique"=>"3.4.7. S'agit-il d'animaux d'espèces domestiques, errants ou vivant à l'état sauvage ?",
"OuiEspeceDomestique"=>"Si oui, éléments scientifiques démontrant que la finalité de la procédure expérimentale ne peut être atteinte qu'en utilisant ces animaux.",
"CategorieAnimauxUtilises"=>"3.4.8. Catégorie des animaux utilisés dans le projet :",
"AnimauxEnCaptivite"=>" - Animaux tenus en captivité (domestiques ou non domestiques)	: ",
"AnimauxNonDomNonCaptifs"=>" - Animaux non domestiques non tenus en captivité	: ",
"ReferencesDerogationsEspProtegee"=>"Si les animaux utilisés sont des spécimens d'espèces protégées en application de l'article L. 411-1 du Code de l'environnement, indiquez les références de la dérogation accordée pour effectuer la capture des animaux dans le milieu naturel (4° de l'article L. 411-2 du Code de l'environnement) :",
"ReferencesDerogationsChasseAutorisee"=>"Si les animaux utilisés sont des spécimens d'espèces dont la chasse est autorisée, indiquez ici les références de l'autorisation de prélèvement accordée pour effectuer la capture des animaux dans le milieu naturel (article L. 424-11 du Code de l'environnement) :",
"Justification"=>"Justification scientifique montrant que l'objectif de la procédure expérimentale ne peut être atteint en utilisant un animal élevé en vue d'une utilisation dans des procédures expérimentales :",
"OuiAnimauxGenetiquementAlteres"=>"Animaux génétiquement altérés",
"AnimauxGenetiquementModifiesEtSoucheMutante"=>"Animaux génétiquement modifiés ET Souche mutante autre",
"AnimauxGenetiquementModifies2"=>" - Animaux génétiquement modifiés",
"CreationLignee"=>"Création d'une lignée : ",
"MaintienLigneeEtablie"=>"Maintien d'une lignée établie et/ou utilisation : ",
"PhenotypeDommageable"=>"Phénotype dommageable : ",
"NumeroRecipisse"=>"Numéro d’agrément, le cas échéant : ",
"SoucheMutante2"=>" - Souche mutante autre",
"CreationMutant"=>"Création d'un mutant : ",
"MaintienLigneeEtablieMutant"=>"Maintien d'une lignée établie et/ou utilisation : ",
"PhenotypeDommageableMutant"=>"Phénotype dommageable : ",
"CategorieAnimauxUtilises"=>"3.4.8. Catégorie des animaux utilisés dans le projet :",
"OrigineAnimaux"=>"3.4.9. Origine des animaux tenus en captivité :",
"ElevesAFinExperimentale"=>"Les animaux destinés à être utilisés dans les procédures expérimentales appartenant aux espèces dont la liste est fixée réglementairement sont-ils élevés à cette fin et proviennent-ils d'éleveurs ou de fournisseurs agréés ?",
"OuiEleves NombreEtablissementEleveur=\"1\""=>"Nombre d’établissements éleveur ou fournisseur agréés français fournissant tout ou partie des animaux
du projet : 1",
"OuiEleves NombreEtablissementEleveur=\"2\""=>"Nombre d’établissements éleveur ou fournisseur agréés français fournissant tout ou partie des animaux
du projet : 2",
"OuiEleves NombreEtablissementEleveur=\"3\""=>"Nombre d’établissements éleveur ou fournisseur agréés français fournissant tout ou partie des animaux
du projet : 3",
"OuiEleves NombreEtablissementEleveur=\"4\""=>"Nombre d’établissements éleveur ou fournisseur agréés français fournissant tout ou partie des animaux
du projet : 4",
"OuiEleves NombreEtablissementEleveur=\"5\""=>"Nombre d’établissements éleveur ou fournisseur agréés français fournissant tout ou partie des animaux
du projet : 5",
"OuiEleves NombreEtablissementEleveur=\"6\""=>"Nombre d’établissements éleveur ou fournisseur agréés français fournissant tout ou partie des animaux
du projet : 6",
"OuiElevesAFinExperimentale"=>"Nom de l'établissement :",
"NomEtablissement"=>" Nom de l'établissement :",
"AdressePostaleEtablissement"=>" Adresse postale",
"AnimauxFournis"=>" Animaux Fournis : ",
"OuiEleves"=>"",
"NonEleves"=>"Si non, justifier scientifiquement l'utilisation d'animaux qui ne proviennent pas d'éleveurs ou de fournisseurs agréés :",
"VotreEUFournitToutOuPartieAnimaux"=>"Votre propre établissement utilisateur fournit-il tout ou partie des animaux du projet ?",
"AutreEUFournitToutOuPartieAnimaux"=>"Un autre établissement utilisateur fournit-il tout ou partie des animaux du projet ?",
"EtablissementsNonAgreesFournissantAnimaux NombreEtablissementsNonAgreesFournissantAnimaux=\"1\""=>"Nombre d'établissements éleveur occasionnel non agréés fournissant tout ou partie des animaux du projet ? 1",
"EtablissementsNonAgreesFournissantAnimaux NombreEtablissementsNonAgreesFournissantAnimaux=\"2\""=>"Nombre d'établissements éleveur occasionnel non agréés fournissant tout ou partie des animaux du projet ? 2",
"EtablissementsNonAgreesFournissantAnimaux NombreEtablissementsNonAgreesFournissantAnimaux=\"3\""=>"Nombre d'établissements éleveur occasionnel non agréés fournissant tout ou partie des animaux du projet ? 3",
"EtablissementsNonAgreesFournissantAnimaux NombreEtablissementsNonAgreesFournissantAnimaux=\"4\""=>"Nombre d'établissements éleveur occasionnel non agréés fournissant tout ou partie des animaux du projet ? 4",
"NomEtablissementsNonAgreesFournissantAnimaux"=>"Nom de l'établissement :",
"EtablissementsNonAgreesFournissantAnimaux"=>"Nom de l'établissement :",
"EtablissementsEtatsMembresFournissantAnimaux NombreEtablissementsEtatsMembresFournissantAnimaux=\"1\""=>"Nombre d'établissements éleveur ou fournisseur localisés dans des Etats membres autres que la France fournissant tout ou partie des animaux du projet ? 1",
"EtablissementsEtatsMembresFournissantAnimaux NombreEtablissementsEtatsMembresFournissantAnimaux=\"2\""=>"Nombre d'établissements éleveur ou fournisseur localisés dans des Etats membres autres que la France fournissant tout ou partie des animaux du projet ? 2",
"EtablissementsEtatsMembresFournissantAnimaux NombreEtablissementsEtatsMembresFournissantAnimaux=\"3\""=>"Nombre d'établissements éleveur ou fournisseur localisés dans des Etats membres autres que la France fournissant tout ou partie des animaux du projet ? 3",
"EtablissementsEtatsMembresFournissantAnimaux NombreEtablissementsEtatsMembresFournissantAnimaux=\"4\""=>"Nombre d'établissements éleveur ou fournisseur localisés dans des Etats membres autres que la France fournissant tout ou partie des animaux du projet ? 4",
"EtablissementEtatMembre"=>"Informations sur l'établissement :",
"NomEtablissementsEtatsMembresFournissantAnimaux"=>"Nom de l'établissement :",
"PaysEtablissementsEtatsMembresFournissantAnimaux"=>"Pays de l'établissement :",
"EtablissementsEtatsTiersFournissantAnimaux NombreEtablissementsEtatsTiersFournissantAnimaux=\"1\""=>"Nombre d'établissements éleveur ou fournisseur localisés dans des pays tiers fournissant tout ou partie des animaux du projet ? 1",
"EtablissementsEtatsTiersFournissantAnimaux NombreEtablissementsEtatsTiersFournissantAnimaux=\"2\""=>"Nombre d'établissements éleveur ou fournisseur localisés dans des pays tiers fournissant tout ou partie des animaux du projet ? 2",
"EtablissementsEtatsTiersFournissantAnimaux NombreEtablissementsEtatsTiersFournissantAnimaux=\"3\""=>"Nombre d'établissements éleveur ou fournisseur localisés dans des pays tiers fournissant tout ou partie des animaux du projet ? 3",
"EtablissementEtatTiers"=>"Informations sur l'établissement :",
"NomEtablissementsEtatsTiersFournissantAnimaux"=>"Nom de l'établissement  :",
"PaysEtablissementsEtatsTiersFournissantAnimaux"=>"Pays de l'établissement  :",
"AnimauxReutilisesProjetPrecedent"=>"Les animaux sont-ils des animaux réutilisés d'un projet précédent ?",
"AnimauxUtilises"=>"",
"NombreAnimauxUtilises"=>"3.4.10. Nombre estimé d'animaux utilisés dans le projet :",
"JustificationUtilisationEspeces"=>"Justification de ce nombre pour chacune des espèces animales utilisées :",
"UtilisationQuelStade"=>"3.4.11. Indiquez à quel(s) stade(s) de développement les animaux seront utilisés et le justifier :",
"SexeAnimauxUtilisesJustification"=>"3.4.12. Indiquez le sexe des animaux utilisés et le justifier :",
"ProceduresExperimentales"=>"4. Procédures expérimentales",
"ExplicationsProcedures NombreProcedures=\"1\""=>"4.2 Nombre de procédures expérimentales :  1",
"ExplicationsProcedures NombreProcedures=\"2\""=>"4.2 Nombre de procédures expérimentales :  2",
"ExplicationsProcedures NombreProcedures=\"3\""=>"4.2 Nombre de procédures expérimentales :  3",
"ExplicationsProcedures NombreProcedures=\"4\""=>"4.2 Nombre de procédures expérimentales :  4",
"ExplicationsProcedures NombreProcedures=\"5\""=>"4.2 Nombre de procédures expérimentales :  5",
"ExplicationsProcedures NombreProcedures=\"6\""=>"4.2 Nombre de procédures expérimentales :  6",
"ExplicationsProcedures NombreProcedures=\"7\""=>"4.2 Nombre de procédures expérimentales :  7",
"ExplicationsProcedures NombreProcedures=\"8\""=>"4.2 Nombre de procédures expérimentales :  8",
"ExplicationsProcedures NombreProcedures=\"9\""=>"4.2 Nombre de procédures expérimentales :  9",
"ExplicationsProcedures NombreProcedures=\"10\""=>"4.2 Nombre de procédures expérimentales :  10",
"ExplicationsProcedures NombreProcedures=\"11\""=>"4.2 Nombre de procédures expérimentales :  11",
"ExplicationsProcedures NombreProcedures=\"12\""=>"4.2 Nombre de procédures expérimentales :  12",
"ExplicationsProcedures NombreProcedures=\"13\""=>"4.2 Nombre de procédures expérimentales :  13",
"ExplicationsProcedures NombreProcedures=\"14\""=>"4.2 Nombre de procédures expérimentales :  14",
"ExplicationsProcedures NombreProcedures=\"15\""=>"4.2 Nombre de procédures expérimentales :  15",
"ExplicationsProcedures NombreProcedures=\"16\""=>"4.2 Nombre de procédures expérimentales :  16",
"ExplicationsProcedures NombreProcedures=\"17\""=>"4.2 Nombre de procédures expérimentales :  17",
"ExplicationsProcedures NombreProcedures=\"18\""=>"4.2 Nombre de procédures expérimentales :  18",
"ExplicationsProcedures NombreProcedures=\"19\""=>"4.2 Nombre de procédures expérimentales :  19",
"ExplicationsProcedures NombreProcedures=\"20\""=>"4.2 Nombre de procédures expérimentales :  20",
"ExplicationsProcedures NombreProcedures=\"21\""=>"4.2 Nombre de procédures expérimentales :  21",
"ExplicationsProcedures NombreProcedures=\"22\""=>"4.2 Nombre de procédures expérimentales :  22",
"ExplicationsProcedures NombreProcedures=\"23\""=>"4.2 Nombre de procédures expérimentales :  23",
"ExplicationsProcedures NombreProcedures=\"24\""=>"4.2 Nombre de procédures expérimentales :  24",
"ExplicationsProcedures NombreProcedures=\"25\""=>"4.2 Nombre de procédures expérimentales :  25",
"Procedure"=>"4.2.x Procédure x",
"NomProcedure"=>"Nom de la procédure :",
"ClassificationProcedure"=>"     Proposition de classification de la procédure selon le degré de sévérité : 	",
"DescriptionDetaillee"=>"     Description détaillée de la procédure expérimentale ",
"PertinenceJustification"=>"     Pertinence et justification de la procédure expérimentale : ",
"NombreLots"=>"      Indiquez le nombre de lots et le nombre d'animaux par lots, et les justifier :",
"PointsLimitesAdaptes"=>"      Indiquez pour chaque espèce les points limites adaptés, suffisamment prédictifs et précoces pour permettre de limiter la douleur à son minimum, sans remettre en cause les résultats du projet : ",
"PrelevementEtFrequence"=>"      Indiquez le cas échéant le prélèvement, ainsi que la fréquence et le(s) volume(s) prélevés : ",
"MethodeSuppressionDouleur"=>"     Indiquez le cas échéant les méthodes pour réduire ou supprimer la douleur, la souffrance et l'angoisse [liste des médications . anesthésiques, analgésiques, anti-inflammatoires, en précisant les doses, voies, durées et fréquences d'administration], y compris le raffinement des conditions d'hébergement, d'élevage et de soins :",
"MethodeSuppressionSouffrance"=>"      Indiquez le cas échéant les dispositions prises en vue de réduire, d'éviter et d'atténuer toute forme de souffrance des animaux de la naissance à la mort : ",
"RaisonsScientifiquesDerogationAnestesie"=>"     Indiquez le cas échéant les raisons scientifiques justifiant une dérogation à l'anesthésie des animaux : ",
"RaisonsScientifiquesDerogationHebergement"=>"     Indiquez le cas échéant les raisons scientifiques justifiant une dérogation aux conditions d'hébergement des animaux : ",
"DispositionsPrisesEviterDoubleEmploi"=>"     Dispositions prises pour éviter tout double emploi injustifié des procédures expérimentales, le cas échéant : ",
"DevenirAnimaux"=>"     Devenir des animaux à la fin de cette procédure expérimentale : ",
"MiseAMortAnimaux"=>"      mise à mort ? : ",
"AnimauxMisAMort"=>"	précisez les animaux concernés :",
"GardeEnVie"=>"      animal gardé en vie ? : ",
"AnimauxGardesEnVie"=>"	précisez les animaux concernés :",
"DecisionVeterinaire"=>"Précisez si la décision a été prise par le vétérinaire ou toute autre personne compétente désignée par le responsable du projet:",
"MiseEnLiberte"=>"     Placement ou mise en liberté des animaux ? : ",
"AnimauxMisEnLiberte"=>"Précisez les animaux concernés:",
"ExplicationsProcedures"=>"",
"UtilisationAnimauxProjetAnterieur"=>"4.3. Si le projet utilise des animaux réutilisés d'un projet antérieur :",
"GraviteReelle"=>"Gravité réelle de la (ou des) procédure(s) antérieure(s) :",
"GraviteLegere"=>"- légère : ",
"GraviteModeree"=>"- modérée : ",
"GraviteSevere"=>"- sévère : ",
"ElementsScientifiquesJustifiantDerogation"=>"Si des animaux sont issus d’une procédure antérieure « sévère », apporter les éléments scientifiques justifiant la dérogation, pour
autant que ces animaux n’aient pas été utilisés plus d’une fois dans une procédure expérimentale entrainant une douleur intense, de
l’angoisse ou une souffrance équivalente. Dans ce cas, le MESRI peut autoriser la réutilisation, après avis du comité d’éthique en expérimentation animale dont relève l’établissement ",
"EffetCumulatif"=>"Effet cumulatif de cette réutilisation sur les animaux :",
"AvisVeterinaireFavorable"=>"L'avis vétérinaire est-il favorable en prenant en considération le sort de l'animal concerné sur toute sa durée de vie ?",
"EtatDeSanteRecouvre"=>"L'animal réutilisé a-t-il pleinement recouvré son état de santé et de bien-être général ?",
"ProjetContenantSouffranceSevere"=>"4.4. Cas particulier des projets contenant une procédure expérimentale impliquant une douleur,  une angoisse ou une souffrance sévère et susceptible de se prolonger sans qu'il soit possible de les soulager",
"ProcedureEnCause"=>"De quelle(s) procédure(s) expérimentale(s) du projet s'agit-il ?",
"JustificationScientifiqueProcedure"=>"Justifiez scientifiquement les raisons à l'origine d'une demande de dérogation :",
"PublishNtsProjectRequest"=>"5. Résumé au format européen ",
"projectTitle"=>"5.1. Intitulé du projet [Repris automatiquement du champ 1.2]",
"projectDuration"=>"5.2. Durée du projet (en mois) [Repris automatiquement du champ 1.3]",
"keywords"=>"5.3. Mots-clés ",
"keyword"=>"- Mot-clé n1 : ",
"keyword"=>"- Mot-clé n1 : ",
"keyword2"=>"- Mot-clé n2 : ",
"keyword3"=>"- Mot-clé n3 : ",
"keyword4"=>"- Mot-clé n4 : ",
"keyword5"=>"- Mot-clé n5 : ",
"keyword6"=>"- Mot-clé n6 : ",
"projectPurposes"=>"5.4. Finalités du projet. Sélectionner dans la liste proposée la ou les finalités du projet",
"purpose"=>"- Finalité :  ",
"objectivesAndBenefits"=>"5.5. Objectifs et bénéfices escomptés du projet ",
"projectObjectives"=>"5.5.1. Décrire les objectifs du projet [GRAND PUBLIC] ",
"potentialBenefits"=>"5.5.2. Quels sont les bénéfices susceptibles de découler de ce projet [GRAND PUBLIC]?",
"predictedHarms"=>"5.6. Nuisances prévues ",
"procedures"=>"5.6.1. À quels types d’interventions les animaux seront-ils soumis (par exemple, prélèvements sur animaux vigiles, procédures
chirurgicales) ? Indiquer leur nombre et leur durée. ",
"expectedImpacts"=>"5.6.2. Quels sont les effets / ou effets indésirables prévus sur les animaux ? ",
"expectedHarms"=>"5.7. Quelles espèces est-il prévu d’utiliser? Quels sont le degré de gravité des procédures et le nombre d’animaux prévus dans chaque catégorie de gravité (par espèce) ? ",
"species"=>"- Espèce : ",
"nonRecovery"=>"     Sans réveil : ",
"mild"=>"     Légère : ",
"moderate"=>"     Modérée : ",
"severe"=>"     Sévère : ",
"fateOfAnimalsKeptAlive"=>"5.8. Qu’adviendra-t-il des animaux maintenus en vie à la fin du projet ?",
"reused"=>"     Réutilisés : ",
"returned"=>"     Replacés : ",
"rehomed"=>"     Adoptés : ",
"fateReasons"=>"5.9. Justifier le sort prévu de tous les animaux à l'issue de chaque procédure ",
"applicationOfTheThreeRs"=>"5.10. Application de la règle des «trois R» ",
"replacement"=>"1. Remplacement. [Repris automatiquement du champ 3.3.6.1] ",
"reduction"=>"2. Réduction. [Repris automatiquement du champ 3.3.6.2] ",
"refinement"=>"3. Raffinement. [Repris automatiquement du champ 3.3.6.3] ",
"speciesChoiceExplanation"=>"5.11. Expliquer le choix des espèces et les stades de développement y afférents. [Repris automatiquement des champs 3.4.3 et 3.4.11,
dans la limite des 2500 premiers caractères]");

if ($line =~ /\w/ and $line !~ /</){
print OUT decode_entities($line),"\n";
}

foreach my $balise (keys %balises){

if($line=~ "<$balise>"){
$line =~ s/>true</>OUI</g;
$line =~ s/>false</>NON</g;
$line =~ s/<$balise>//;
$line =~ s/<\/$balise>//;
$line =~ s/   +/ /;
print OUT $balises{$balise},decode_entities($line),"\n";
}
else{
if($line=~ "<\/$balise>"){
$line =~ s/>true</>OUI</g;
$line =~ s/>false</>NON</g;
$line =~ s/<$balise>//;
$line =~ s/<\/$balise>//;
$line =~ s/   +/ /;

print OUT decode_entities($line),"\n";
}
}
}

}



close IN or die $!;
close OUT or die $!;
}

my $dir = cwd();
opendir DIR, $dir or die "cannot open dir $dir: $!";
my @tmpfiles = glob "$dir/*.doc";
closedir(DIR);

foreach(@tmpfiles){
open( I, "<:utf8", $_ ) or die "$ARGV[0]: $!";
my $utf = do { local $/; <I> };  # slurp it

# here's the magic part: replace each wide character with
# "\uN\5f", where "N" is the decimal numeric codepoint:

$utf =~ s/([^[:ascii:]])/sprintf("\\u%d\\'5f",ord($1))/eg;

my $out = $_;

my $rtf = RTF::Writer->new_to_file( $out );
my @pars = split( /\n+/, $utf );
$rtf->prolog( title => $out );
for my $par ( @pars ) {
    $rtf->paragraph( \$par );  # need to pass $par by reference
}
$rtf->close;
}

print "Conversion finie\nValidez pour fermer ce script.\n";
<STDIN>
}
else{exit;}

use Cwd;

my $dir = cwd();
opendir DIR, $dir or die "cannot open dir $dir: $!";
my @tmpfilestodelete = glob "$dir/*.tmp";
closedir(DIR);

foreach(@tmpfilestodelete){
  my $qfn = $_;

open IN,$qfn or die $!;
close IN,$qfn or die $!;
unlink IN,$qfn ;

}