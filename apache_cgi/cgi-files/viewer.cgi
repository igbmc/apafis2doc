#!/usr/bin/perl -w

use strict;
use Cwd;
use CGI;
use CGI::Carp qw ( fatalsToBrowser );
use File::Basename;
use HTML::Entities;

$CGI::POST_MAX = 1024 * 5000;
my $safe_filename_characters = "a-zA-Z0-9_.-";
my $upload_dir = "/var/www/html/upload";

my $query = new CGI;
my $filename = $query->param("file");

if ( !$filename )
{
print $query->header ( );
print "There was a problem uploading your doc.";
exit;
}

my ( $name, $path, $extension ) = fileparse ( $filename, '..*' );
$filename = $name . $extension;
$filename =~ tr/ /_/;
$filename =~ s/[^$safe_filename_characters]//g;


if ( $filename =~ /^([$safe_filename_characters]+)$/ )
{
$filename = $1;
}
else
{
die "Filename contains invalid characters";
}

if ($filename =~ /\.xml$/i) {
}
else
{
print $query->header ( );
print <<END_HTML;

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "DTD/xhtml1-strict.dtd">
<html xmlns="https://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Thanks!</title>
<style type="text/css">
img {border: none;}
</style>
</head>
<body>
<p>Seuls les fichiers .xml apafis sont autoris&eacute;s !</p>
<p><a href="/">Retour</a></p>
</body>
</html>
END_HTML
exit
}

my $upload_filehandle = $query->upload("file");

open ( UPLOADFILE, ">$upload_dir/$filename" ) or die "$!";
binmode UPLOADFILE;

while ( <$upload_filehandle> )
{
print UPLOADFILE;
}

close UPLOADFILE;

my $dir = cwd();

my @files = glob "$upload_dir/$filename";
closedir(DIR);

foreach(@files){
my $qfn = $_;

open IN,$qfn or die $!;
open OUT,">",$qfn."\.html" or die $!;

while (<IN>) {
my $line = $_;
chomp $line;

my %balises = (
"InformationsGenerales"=>"
<head>
<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />
</head><h1>1. Informations Générales</h1>",
"TitreProjet"=>"<h2>1.2. Titre du projet :</h2>",
"NumVersion"=>"Numéro de version :",
"ReferenceDossier"=>"<h2>1.1. Référence Dossier :</h2>",
"DureeProjet"=>"<h2>1.2. Durée du projet :</h2>",
"DureeAnnees"=>"Années :",
"DureeMois"=>"Mois :",
"DureeJours"=>"Jours :",
"DebutQuandProjetAutorise"=>"<br>Dès que le projet est autorisé :",
"DatePrevueDebutProjet"=>"<h2>1.3. Date prévue de début du projet (Année-Mois-Jour):</h2>",
"Date"=>"Date :",
"RNT"=>"<h1>2. Rnt (inutilisé)</h1>",
"InformationsAdministrativesEtReglementaires"=>"<h1>3. Informations Administratives et Réglementaires</h1>",
"EtablissementUtilisateur"=>"<h2>3.1. L établissement utilisateur (EU)</h2>",
"AgrementUE"=>"<h3>3.1.1. Agrément de l'EU où seront utilisés les animaux :</h3>",
"NomUE"=>"Nom :","NumeroAgrement"=>"<br>Numéro d'agrément :",
"DateDelivrance"=>"<br>Date de délivrance de l'agrément :",
"CiviliteResponsable"=>"<br>Civilité :",
"NomResponsable"=>"<br>Nom du responsable :",
"PrenomResponsable"=>"<br>Prénom du responsable :",
"EMailResponsable"=>"<br>Adresse électronique du responsable :",
"CiviliteDelegataire"=>"<br>Civilité du délégataire :",
"NomDelegataire"=>"<br>Nom de la personne délégataire du responsable présente dans l'EU :",
"PrenomDelegataire"=>"<br>Prénom de la personne délégataire du responsable présente dans l'EU :",
"EMailDelegataire"=>"<br>Adresse électronique de ce délégataire :",
"ComiteEthiqueAgree"=>"<h3>3.1.2. Comité d'éthique agréé par le MESR dont relève l'EU :</h3>",
"ResponsablesMiseEnOeuvre NombreResponsablesMiseEnOeuvre=\"1\""=>"<h3>3.1.3. Responsable(s) de la mise en oeuvre générale du projet dans l'EU et de sa conformité à l'autorisation de projet :</h3>",
"ResponsablesMiseEnOeuvre NombreResponsablesMiseEnOeuvre=\"2\""=>"<h3>3.1.3. Responsable(s) de la mise en œuvre générale du projet dans l'EU et de sa conformité à l'autorisation de projet :</h3>",
"ResponsablesMiseEnOeuvre NombreResponsablesMiseEnOeuvre=\"3\""=>"<h3>3.1.3. Responsable(s) de la mise en œuvre générale du projet dans l'EU et de sa conformité à l'autorisation de projet :</h3>",
"ResponsablesMiseEnOeuvre NombreResponsablesMiseEnOeuvre=\"4\""=>"<h3>3.1.3. Responsable(s) de la mise en œuvre générale du projet dans l'EU et de sa conformité à l'autorisation de projet :</h3>",
"CoordonneesResponsablesMiseEnOeuvre"=>"<br><br>Responsable(s) :",
"Civilite"=>"<br>Civilité :",
"Nom"=>"<br>Nom :",
"Prenom"=>"<br>Prenom :",
"AdressePostale"=>"<br>Adresse postale :",
"NomLaboratoire"=>"<br>Nom du Laboratoire :",
"ComplementAdresse"=>"<br>Complément :",
"NumeroRue"=>"<br>Numéro de rue :",
"Voie"=>"<br>Voie :",
"CodePostal"=>"<br>Code Postal :",
"Ville"=>"<br>Ville :",
"Pays"=>"<br>Pays :",
"Email"=>"<br>Email :",
"NumTelephone"=>"<br>Téléphone :",
"ResponsablesBienEtre NombreResponsablesBienEtre=\"1\""=>"<h3>3.1.4. Responsable(s) du bien-être des animaux :</h3>",
"ResponsablesBienEtre NombreResponsablesBienEtre=\"2\""=>"<h3>3.1.4. Responsable(s) du bien-être des animaux :</h3>",
"ResponsablesBienEtre NombreResponsablesBienEtre=\"3\""=>"<h3>3.1.4. Responsable(s) du bien-être des animaux :</h3>",
"ResponsablesBienEtre NombreResponsablesBienEtre=\"4\""=>"<h3>3.1.4. Responsable(s) du bien-être des animaux :</h3>",
"CoordonneesResponsablesBienEtre"=>"<br><br>Responsable(s) :",
"Personnel"=>"<h2>3.2. Le personnel </h2>",
"ConceptionProceduresExp"=>"Compétences des personnes participant au projet :<br> - la conception des procédures expérimentales et des projets : ",
"ApplicationProceduresExp"=>"<br> - l'application de procédures expérimentales aux animaux : ",
"SoinAuxAnimaux"=>"<br> - les soins aux animaux : ",
"MiseAMort"=>"<br> - la mise à mort des animaux : ",
"Projet"=>"<h2>3.3. Le projet</h2>",
"ObjectifDuProjet"=>"<h3>3.3.1. L'objectif du projet :</h3>",
"JustificationProjet"=>"Est-il :",
"JustifieEducativement"=>"<br> - justifié du point de vue éducatif ?	: ",
"RequisLoi"=>"<br> - requis par la loi ?	: ",
"JustifieScientifiquement"=>"<br> - justifié du point de vue scientifique ?	: ",
"InformationsJustification"=>"<br><b>Quelle est l’instance qui a évalué l’intérêt de ce projet ? </b>",
"DescriptionProjet"=>"<h3>3.3.2. Description du projet :</h3>",
"DescriptionProjet2"=>"<h3>3.3.2. Description du projet :</h3>",
"ObjectifsDuProjet"=>"<h4>3.3.2.1. Objectifs du projet :</h4>",
"DerouleDuProjet"=>"<h4>3.3.2.2. Déroulé du projet :</h4>",
"BeneficesDuProjet"=>"<h4>3.3.2.3. Bénéfices attendus du projet (version scientifique):</h4>",
"NuisancesAnimaux"=>"<h4>3.3.2.4. Nuisances ou effets indésirables attendus sur les animaux (version scientifique):</h4>",
"MethodeMiseAMort"=>"<h3>3.3.3. Précisez, le cas échéant, la ou les méthodes de mise à mort prévue(s) :</h3>",
"ElementsScientifiquesJustifiantDemandeMiseAMort"=>"<h3>3.3.4. Précisez, le cas échéant, les éléments scientifiques justifiant la demande de dérogation concernant la méthode de mise à mort envisagée :</h3>",
"StrategieExperimentations"=>"<h3>3.3.5. Stratégie d'expérimentation ou d'observation et approche statistique utilisée afin de réduire au minimum le nombre d'animaux, la douleur, la souffrance et l'angoisse, infligées et l'impact environnemental, le cas échéant . si une étude statistique est prévue, indiquez et justifiez les tests choisis (INUTILISE):</h3>",
"Strategies3R"=>"<h3>3.3.6. Stratégies de Remplacement, de Réduction et de Raffinement</h3>",
"Remplacement"=>"<h4>3.3.6.1. Remplacement</h4>",
"Reduction"=>"<h4>3.3.6.2. Réduction</h4>",
"Raffinement"=>"<h4>3.3.6.3. Raffinement</h4>",
"Animaux"=>"<h2>3.4. Les animaux</h2>",
"JustificationRecoursAuxAnimaux"=>"<h3>3.4.1. Justifiez la nécessité d'avoir recours à des animaux pour atteindre les objectifs du projet (inutilisé):</h3>",
"ListeAnimaux"=>"<h3>3.4.2. Espèces animales ou types d'animaux utilisés (le champ 3.4.1. est supprimé) :</h3>",
"Souris"=>"<br>Souris (Mus musculus) [A1]&emsp;",
"Rats"=>"<br>Rats (Rattus norvegicus) [A2]&emsp;",
"Cobayes"=>"<br>Cobayes (Cavia porcellus) [A31]&emsp;",
"HamstersSyriens"=>"<br>Hamsters (syriens) (Mesocricetus auratus) [A4]&emsp;",
"HamstersChinois"=>"<br>Hamsters (chinois) (Cricetulus griseus) [A5]&emsp;",
"Gerbille"=>"<br>Gerbilles de Mongolie (Meriones unguiculatus) [A6]&emsp;",
"AutresRongeurs"=>"<br>Autres rongeurs (Rodentia) [A7]&emsp;",
"Lapins"=>"<br>Lapins (Oryctolagus cuniculus) [A8]&emsp;",
"Chats"=>"<br>Chats (Felis catus) [A9]&emsp;",
"Chiens"=>"<br>Chiens (Canis familiaris) [A10];&emsp;",
"Furets"=>"<br>Furets (Mustela putorius furo) [A11]&emsp;",
"AutresCarnivores"=>"<br>Autres carnivores (carnivora) [A12]&emsp;",
"Chevaux"=>"<br>Chevaux, ânes et croisements (Equidae) [A13]&emsp;",
"Porcs"=>"<br>Porcs (Sus scrofa domesticus) [A14]&emsp;",
"Caprins"=>"<br>Caprins (Capra aegagrus hircus) [A15]&emsp;",
"Ovins"=>"<br>Ovins (Ovis aries) [A16]&emsp;",
"Bovins"=>"<br>Bovins (Bos taurus) [A17]&emsp;",
"Prosimien"=>"<br>Prosimiens (prosimia) [A18]&emsp;",
"Ouistitis"=>"<br>Ouistitis et tamarins (par exemple, Callithrix jacchus) [A19]&emsp;",
"SingeCynomologue"=>"<br>Singe cynomolgus (Macaca fascicularis) [A20]&emsp;",
"SingeRhesus"=>"<br>Singe rhésus (Macaca mulatta) [A21]&emsp;",
"Vervets"=>"<br>Vervets (Chlorocebus spp.) (soit pygerythrus, soit sabaeus) [A22]&emsp;",
"Babouins"=>"<br>Babouins (Papio son.) [A23]&emsp;",
"Sairimis"=>"<br>Saïmiris (par exemple, Saimiri sciureus) [A24]&emsp;",
"AutresSingesAncienMonde"=>"<br>Autres espèces de singes de l'Ancien Monde (autres espèces de Cercopithecoidea)[A25-1]&emsp;",
"AutresSingesNouveauMonde"=>"<br>Autres espèces de singes du Nouveau Monde[A25-2]&emsp;",
"AutresPrimateNonHumain"=>"<br>Autres espèces de primates non humains [cocher [A25-1] ou [A25-2]]&emsp;",
"SingesAntropoides"=>"<br>SingesAntropoides&emsp;",
"AutresMammiferes"=>"<br>Autres mammifères (autres Mammalia) [A27]&emsp;",
"PoulesDomestiques"=>"<br>Poules domestiques (Gallus gallus domesticus) [A28]&emsp;",
"Dindes"=>"<br>Dindes&emsp;",
"AutresOiseaux"=>"<br>Autres oiseaux (autres Aves) [A29]&emsp;",
"Reptiles"=>"<br>Reptiles (Reptilia) [A30]&emsp;",
"GrenouillesRana"=>"<br>Grenouilles Rana (Rana temporaria et Rana pipiens) [ABI]&emsp;",
"GrenouillesXenopus"=>"<br>Grenouilles Xenopus (Xenopus laevis et Xenopus tropicalis) [A32]&emsp;",
"AutresAmphibiens"=>"<br>Autres amphibiens (autres Amphibia) [A33]&emsp;",
"PoissonsZebres"=>"<br>Poissons zèbres (Danio rerio) [A34]&emsp;",
"Bars"=>"<br>Bars&emsp;",
"Saumons"=>"<br>Saumons&emsp;",
"Guppies"=>"<br>Guppies&emsp;",
"AutresPoissons"=>"<br>Autres poissons (autres Pisces) [A35]&emsp;",
"Cephalopodes"=>"<br>Céphalopodes (Cephalopoda) [A36]&emsp;",
"PertinenceAnimauxChoisis"=>"<h3>3.4.3. Justifiez la pertinence de l'(des) espèce(s) animale(s) choisie(s) :</h3>",
"EspecesMenacees"=>"<h3>3.4.4. S'agit-il de spécimens d'espèces menacées énumérées à l'annexe A du règlement (CE) n° 338/97 du Conseil du 9 décembre 1996 relatif à la protection des espèces de faune et de flore sauvages par le contrôle et leur commerce ?</h3>",
"OuiEspecesMenacees"=>"<br>Si oui, éléments scientifiques démontrant que la finalité de la procédure expérimentale ne peut être atteinte en utilisant d'autres espèces que celles énumérées dans cette annexe :<br>",
"Primate"=>"<h3>3.4.5. S'agit-il de spécimens de primates non humains ?</h3>",
"OuiPrimate"=>"<br><br>Si oui, éléments scientifiques démontrant que la finalité de la procédure expérimentale ne peut être atteinte en utilisant d'autres espèces de primates non humains:<br>",
"CaptureNature"=>"<h3>3.4.6. S'agit-il d'animaux capturés dans la nature ?</h3> ",
"OuiCaptureNature"=>"<br><br>Si oui, éléments scientifiques démontrant que la finalité de la procédure expérimentale ne peut être atteinte en utilisant d'autres animaux que ceux  capturés dans la nature :<br>",
"EspeceDomestique"=>"<h3>3.4.7. S'agit-il d'animaux d'espèces domestiques, errants ou vivant à l'état sauvage ?</h3>",
"OuiEspeceDomestique"=>"<br><br>Si oui, éléments scientifiques démontrant que la finalité de la procédure expérimentale ne peut être atteinte qu'en utilisant ces animaux.<br>",
"CategorieAnimauxUtilises"=>"<h3>3.4.8. Catégorie des animaux utilisés dans le projet :</h3>",
"AnimauxEnCaptivite"=>"<br> - Animaux tenus en captivité (domestiques ou non domestiques)	: ",
"AnimauxNonDomNonCaptifs"=>"<br> - Animaux non domestiques non tenus en captivité	: ",
"ReferencesDerogationsEspProtegee"=>"<br><br>Si les animaux utilisés sont des spécimens d'espèces protégées en application de l'article L. 411-1 du Code de l'environnement, indiquez les références de la dérogation accordée pour effectuer la capture des animaux dans le milieu naturel (4° de l'article L. 411-2 du Code de l'environnement) :<br>",
"ReferencesDerogationsChasseAutorisee"=>"<br><br>Si les animaux utilisés sont des spécimens d'espèces dont la chasse est autorisée, indiquez ici les références de l'autorisation de prélèvement accordée pour effectuer la capture des animaux dans le milieu naturel (article L. 424-11 du Code de l'environnement) :<br>",
"Justification"=>"<br><br>Justification scientifique montrant que l'objectif de la procédure expérimentale ne peut être atteint en utilisant un animal élevé en vue d'une utilisation dans des procédures expérimentales :<br>",
"OuiAnimauxGenetiquementAlteres"=>"<br><b>Animaux génétiquement altérés</b>",
"AnimauxGenetiquementModifiesEtSoucheMutante"=>"<br>Animaux génétiquement modifiés ET Souche mutante autre",
"AnimauxGenetiquementModifies2"=>"<br><b> - Animaux génétiquement modifiés</b>",
"CreationLignee"=>"<br>Création d'une lignée : ",
"MaintienLigneeEtablie"=>"<br>Maintien d'une lignée établie et/ou utilisation : ",
"PhenotypeDommageable"=>"<br>Phénotype dommageable : ",
"NumeroRecipisse"=>"<br>Numéro d’agrément, le cas échéant : ",
"SoucheMutante2"=>"<br><b> - Souche mutante autre</b>",
"CreationMutant"=>"<br>Création d'un mutant : ",
"MaintienLigneeEtablieMutant"=>"<br>Maintien d'une lignée établie et/ou utilisation : ",
"PhenotypeDommageableMutant"=>"<br>Phénotype dommageable : ",
"CategorieAnimauxUtilises"=>"<h3>3.4.8. Catégorie des animaux utilisés dans le projet :</h3>",
"OrigineAnimaux"=>"<h3>3.4.9. Origine des animaux tenus en captivité :</h3>",
"ElevesAFinExperimentale"=>"<br>Les animaux destinés à être utilisés dans les procédures expérimentales appartenant aux espèces dont la liste est fixée réglementairement sont-ils élevés à cette fin et proviennent-ils d'éleveurs ou de fournisseurs agréés ?",
"OuiEleves NombreEtablissementEleveur=\"1\""=>"<br>Nombre d’établissements éleveur ou fournisseur agréés français fournissant tout ou partie des animaux
du projet : 1",
"OuiEleves NombreEtablissementEleveur=\"2\""=>"<br>Nombre d’établissements éleveur ou fournisseur agréés français fournissant tout ou partie des animaux
du projet : 2",
"OuiEleves NombreEtablissementEleveur=\"3\""=>"<br>Nombre d’établissements éleveur ou fournisseur agréés français fournissant tout ou partie des animaux
du projet : 3",
"OuiEleves NombreEtablissementEleveur=\"4\""=>"<br>Nombre d’établissements éleveur ou fournisseur agréés français fournissant tout ou partie des animaux
du projet : 4",
"OuiEleves NombreEtablissementEleveur=\"5\""=>"<br>Nombre d’établissements éleveur ou fournisseur agréés français fournissant tout ou partie des animaux
du projet : 5",
"OuiEleves NombreEtablissementEleveur=\"6\""=>"<br>Nombre d’établissements éleveur ou fournisseur agréés français fournissant tout ou partie des animaux
du projet : 6",
"OuiElevesAFinExperimentale"=>"<br>Nom de l'établissement :",
"NomEtablissement"=>"<br> Nom de l'établissement :",
"AdressePostaleEtablissement"=>"<br> Adresse postale",
"AnimauxFournis"=>"<br> Animaux Fournis : ",
"OuiEleves"=>"",
"NonEleves"=>"<br>Si non, justifier scientifiquement l'utilisation d'animaux qui ne proviennent pas d'éleveurs ou de fournisseurs agréés :",
"VotreEUFournitToutOuPartieAnimaux"=>"<br>Votre propre établissement utilisateur fournit-il tout ou partie des animaux du projet ?",
"AutreEUFournitToutOuPartieAnimaux"=>"<br>Un autre établissement utilisateur fournit-il tout ou partie des animaux du projet ?",
"EtablissementsNonAgreesFournissantAnimaux NombreEtablissementsNonAgreesFournissantAnimaux=\"1\""=>"<br>Nombre d'établissements éleveur occasionnel non agréés fournissant tout ou partie des animaux du projet ? 1",
"EtablissementsNonAgreesFournissantAnimaux NombreEtablissementsNonAgreesFournissantAnimaux=\"2\""=>"<br>Nombre d'établissements éleveur occasionnel non agréés fournissant tout ou partie des animaux du projet ? 2",
"EtablissementsNonAgreesFournissantAnimaux NombreEtablissementsNonAgreesFournissantAnimaux=\"3\""=>"<br>Nombre d'établissements éleveur occasionnel non agréés fournissant tout ou partie des animaux du projet ? 3",
"EtablissementsNonAgreesFournissantAnimaux NombreEtablissementsNonAgreesFournissantAnimaux=\"4\""=>"<br>Nombre d'établissements éleveur occasionnel non agréés fournissant tout ou partie des animaux du projet ? 4",
"NomEtablissementsNonAgreesFournissantAnimaux"=>"<br>Nom de l'établissement :",
"EtablissementsNonAgreesFournissantAnimaux"=>"<br>Nom de l'établissement :",
"EtablissementsEtatsMembresFournissantAnimaux NombreEtablissementsEtatsMembresFournissantAnimaux=\"1\""=>"<br>Nombre d'établissements éleveur ou fournisseur localisés dans des Etats membres autres que la France fournissant tout ou partie des animaux du projet ? 1",
"EtablissementsEtatsMembresFournissantAnimaux NombreEtablissementsEtatsMembresFournissantAnimaux=\"2\""=>"<br>Nombre d'établissements éleveur ou fournisseur localisés dans des Etats membres autres que la France fournissant tout ou partie des animaux du projet ? 2",
"EtablissementsEtatsMembresFournissantAnimaux NombreEtablissementsEtatsMembresFournissantAnimaux=\"3\""=>"<br>Nombre d'établissements éleveur ou fournisseur localisés dans des Etats membres autres que la France fournissant tout ou partie des animaux du projet ? 3",
"EtablissementsEtatsMembresFournissantAnimaux NombreEtablissementsEtatsMembresFournissantAnimaux=\"4\""=>"<br>Nombre d'établissements éleveur ou fournisseur localisés dans des Etats membres autres que la France fournissant tout ou partie des animaux du projet ? 4",
"EtablissementEtatMembre"=>"<br>Informations sur l'établissement :",
"NomEtablissementsEtatsMembresFournissantAnimaux"=>"Nom de l'établissement :",
"PaysEtablissementsEtatsMembresFournissantAnimaux"=>"Pays de l'établissement :",
"EtablissementsEtatsTiersFournissantAnimaux NombreEtablissementsEtatsTiersFournissantAnimaux=\"1\""=>"<br>Nombre d'établissements éleveur ou fournisseur localisés dans des pays tiers fournissant tout ou partie des animaux du projet ? 1",
"EtablissementsEtatsTiersFournissantAnimaux NombreEtablissementsEtatsTiersFournissantAnimaux=\"2\""=>"<br>Nombre d'établissements éleveur ou fournisseur localisés dans des pays tiers fournissant tout ou partie des animaux du projet ? 2",
"EtablissementsEtatsTiersFournissantAnimaux NombreEtablissementsEtatsTiersFournissantAnimaux=\"3\""=>"<br>Nombre d'établissements éleveur ou fournisseur localisés dans des pays tiers fournissant tout ou partie des animaux du projet ? 3",
"EtablissementEtatTiers"=>"<br>Informations sur l'établissement :",
"NomEtablissementsEtatsTiersFournissantAnimaux"=>"<br>Nom de l'établissement  :",
"PaysEtablissementsEtatsTiersFournissantAnimaux"=>"<br>Pays de l'établissement  :",
"AnimauxReutilisesProjetPrecedent"=>"<br>Les animaux sont-ils des animaux réutilisés d'un projet précédent ?",
"AnimauxUtilises"=>"",
"NombreAnimauxUtilises"=>"<h3>3.4.10. Nombre estimé d'animaux utilisés dans le projet :</h3>",
"JustificationUtilisationEspeces"=>"<br>Justification de ce nombre pour chacune des espèces animales utilisées :<br>",
"UtilisationQuelStade"=>"<h3>3.4.11. Indiquez à quel(s) stade(s) de développement les animaux seront utilisés et le justifier :</h3>",
"SexeAnimauxUtilisesJustification"=>"<h3>3.4.12. Indiquez le sexe des animaux utilisés et le justifier :</h3>",
"ProceduresExperimentales"=>"<h1>4. Procédures expérimentales</h1>",
"ExplicationsProcedures NombreProcedures=\"1\""=>"<h2>4.2 Nombre de procédures expérimentales :  1</h2>",
"ExplicationsProcedures NombreProcedures=\"2\""=>"<h2>4.2 Nombre de procédures expérimentales :  2</h2>",
"ExplicationsProcedures NombreProcedures=\"3\""=>"<h2>4.2 Nombre de procédures expérimentales :  3</h2>",
"ExplicationsProcedures NombreProcedures=\"4\""=>"<h2>4.2 Nombre de procédures expérimentales :  4</h2>",
"ExplicationsProcedures NombreProcedures=\"5\""=>"<h2>4.2 Nombre de procédures expérimentales :  5</h2>",
"ExplicationsProcedures NombreProcedures=\"6\""=>"<h2>4.2 Nombre de procédures expérimentales :  6</h2>",
"ExplicationsProcedures NombreProcedures=\"7\""=>"<h2>4.2 Nombre de procédures expérimentales :  7</h2>",
"ExplicationsProcedures NombreProcedures=\"8\""=>"<h2>4.2 Nombre de procédures expérimentales :  8</h2>",
"ExplicationsProcedures NombreProcedures=\"9\""=>"<h2>4.2 Nombre de procédures expérimentales :  9</h2>",
"ExplicationsProcedures NombreProcedures=\"10\""=>"<h2>4.2 Nombre de procédures expérimentales :  10</h2>",
"ExplicationsProcedures NombreProcedures=\"11\""=>"<h2>4.2 Nombre de procédures expérimentales :  11</h2>",
"ExplicationsProcedures NombreProcedures=\"12\""=>"<h2>4.2 Nombre de procédures expérimentales :  12</h2>",
"ExplicationsProcedures NombreProcedures=\"13\""=>"<h2>4.2 Nombre de procédures expérimentales :  13</h2>",
"ExplicationsProcedures NombreProcedures=\"14\""=>"<h2>4.2 Nombre de procédures expérimentales :  14</h2>",
"ExplicationsProcedures NombreProcedures=\"15\""=>"<h2>4.2 Nombre de procédures expérimentales :  15</h2>",
"ExplicationsProcedures NombreProcedures=\"16\""=>"<h2>4.2 Nombre de procédures expérimentales :  16</h2>",
"ExplicationsProcedures NombreProcedures=\"17\""=>"<h2>4.2 Nombre de procédures expérimentales :  17</h2>",
"ExplicationsProcedures NombreProcedures=\"18\""=>"<h2>4.2 Nombre de procédures expérimentales :  18</h2>",
"ExplicationsProcedures NombreProcedures=\"19\""=>"<h2>4.2 Nombre de procédures expérimentales :  19</h2>",
"ExplicationsProcedures NombreProcedures=\"20\""=>"<h2>4.2 Nombre de procédures expérimentales :  20</h2>",
"ExplicationsProcedures NombreProcedures=\"21\""=>"<h2>4.2 Nombre de procédures expérimentales :  21</h2>",
"ExplicationsProcedures NombreProcedures=\"22\""=>"<h2>4.2 Nombre de procédures expérimentales :  22</h2>",
"ExplicationsProcedures NombreProcedures=\"23\""=>"<h2>4.2 Nombre de procédures expérimentales :  23</h2>",
"ExplicationsProcedures NombreProcedures=\"24\""=>"<h2>4.2 Nombre de procédures expérimentales :  24</h2>",
"ExplicationsProcedures NombreProcedures=\"25\""=>"<h2>4.2 Nombre de procédures expérimentales :  25</h2>",
"Procedure"=>"<h3>4.2.x Procédure x</h3>",
"NomProcedure"=>"<b>Nom de la procédure :</b><br>",
"ClassificationProcedure"=>"<br><b>     Proposition de classification de la procédure selon le degré de sévérité : </b>	",
"DescriptionDetaillee"=>"<br><b>     Description détaillée de la procédure expérimentale </b>",
"PertinenceJustification"=>"<br><br><b>     Pertinence et justification de la procédure expérimentale : </b>",
"NombreLots"=>"<br><b>      Indiquez le nombre de lots et le nombre d'animaux par lots, et les justifier :</b><br>",
"PointsLimitesAdaptes"=>"<br><b>      Indiquez pour chaque espèce les points limites adaptés, suffisamment prédictifs et précoces pour permettre de limiter la douleur à son minimum, sans remettre en cause les résultats du projet : </b>",
"PrelevementEtFrequence"=>"<br><b>      Indiquez le cas échéant le prélèvement, ainsi que la fréquence et le(s) volume(s) prélevés : </b>",
"MethodeSuppressionDouleur"=>"<br><b>     Indiquez le cas échéant les méthodes pour réduire ou supprimer la douleur, la souffrance et l'angoisse [liste des médications . anesthésiques, analgésiques, anti-inflammatoires, en précisant les doses, voies, durées et fréquences d'administration], y compris le raffinement des conditions d'hébergement, d'élevage et de soins :</b>",
"MethodeSuppressionSouffrance"=>"<br><b>      Indiquez le cas échéant les dispositions prises en vue de réduire, d'éviter et d'atténuer toute forme de souffrance des animaux de la naissance à la mort : </b>",
"RaisonsScientifiquesDerogationAnestesie"=>"<br><b>     Indiquez le cas échéant les raisons scientifiques justifiant une dérogation à l'anesthésie des animaux : </b>",
"RaisonsScientifiquesDerogationHebergement"=>"<br><b>     Indiquez le cas échéant les raisons scientifiques justifiant une dérogation aux conditions d'hébergement des animaux : </b>",
"DispositionsPrisesEviterDoubleEmploi"=>"<br><b>     Dispositions prises pour éviter tout double emploi injustifié des procédures expérimentales, le cas échéant : </b>",
"DevenirAnimaux"=>"<br><b>     Devenir des animaux à la fin de cette procédure expérimentale : </b>",
"MiseAMortAnimaux"=>"<br><b>      mise à mort ? : </b>",
"AnimauxMisAMort"=>"<br>	précisez les animaux concernés :<br>",
"GardeEnVie"=>"<br><b>      animal gardé en vie ? : </b>",
"AnimauxGardesEnVie"=>"<br>	précisez les animaux concernés :<br>",
"DecisionVeterinaire"=>"<br>Précisez si la décision a été prise par le vétérinaire ou toute autre personne compétente désignée par le responsable du projet:",
"MiseEnLiberte"=>"<br><b>     Placement ou mise en liberté des animaux ? : </b>",
"AnimauxMisEnLiberte"=>"<br>Précisez les animaux concernés:<br>",
"ExplicationsProcedures"=>"",
"UtilisationAnimauxProjetAnterieur"=>"<h2>4.3. Si le projet utilise des animaux réutilisés d'un projet antérieur :</h2>",
"GraviteReelle"=>"<br>Gravité réelle de la (ou des) procédure(s) antérieure(s) :<br>",
"GraviteLegere"=>"<br>- légère : ",
"GraviteModeree"=>"<br>- modérée : ",
"GraviteSevere"=>"<br>- sévère : ",
"ElementsScientifiquesJustifiantDerogation"=>"<br>Si des animaux sont issus d’une procédure antérieure « sévère », apporter les éléments scientifiques justifiant la dérogation, pour
autant que ces animaux n’aient pas été utilisés plus d’une fois dans une procédure expérimentale entrainant une douleur intense, de
l’angoisse ou une souffrance équivalente. Dans ce cas, le MESRI peut autoriser la réutilisation, après avis du comité d’éthique en expérimentation animale dont relève l’établissement <br>",
"EffetCumulatif"=>"<br>Effet cumulatif de cette réutilisation sur les animaux :<br>",
"AvisVeterinaireFavorable"=>"<br>L'avis vétérinaire est-il favorable en prenant en considération le sort de l'animal concerné sur toute sa durée de vie ?<br>",
"EtatDeSanteRecouvre"=>"<br>L'animal réutilisé a-t-il pleinement recouvré son état de santé et de bien-être général ?<br>",
"ProjetContenantSouffranceSevere"=>"<h2>4.4. Cas particulier des projets contenant une procédure expérimentale impliquant une douleur,  une angoisse ou une souffrance sévère et susceptible de se prolonger sans qu'il soit possible de les soulager</h2>",
"ProcedureEnCause"=>"<br>De quelle(s) procédure(s) expérimentale(s) du projet s'agit-il ?<br>",
"JustificationScientifiqueProcedure"=>"<br>Justifiez scientifiquement les raisons à l'origine d'une demande de dérogation :<br>",
"PublishNtsProjectRequest"=>"<h1>5. Résumé au format européen </h1>",
"projectTitle"=>"<h2>5.1. Intitulé du projet [Repris automatiquement du champ 1.2]</h2>",
"projectDuration"=>"<h2>5.2. Durée du projet (en mois) [Repris automatiquement du champ 1.3]</h2>",
"keywords"=>"<h2>5.3. Mots-clés </h2>",
"keyword"=>"<br>- Mot-clé n1 : ",
"keyword"=>"<br>- Mot-clé n1 : ",
"keyword2"=>"<br>- Mot-clé n2 : ",
"keyword3"=>"<br>- Mot-clé n3 : ",
"keyword4"=>"<br>- Mot-clé n4 : ",
"keyword5"=>"<br>- Mot-clé n5 : ",
"keyword6"=>"<br>- Mot-clé n6 : ",
"projectPurposes"=>"<h2>5.4. Finalités du projet. Sélectionner dans la liste proposée la ou les finalités du projet</h2>",
"purpose"=>"<br>- Finalité :  ",
"objectivesAndBenefits"=>"<h2>5.5. Objectifs et bénéfices escomptés du projet </h2>",
"projectObjectives"=>"<h3>5.5.1. Décrire les objectifs du projet [GRAND PUBLIC] </h3>",
"potentialBenefits"=>"<h3>5.5.2. Quels sont les bénéfices susceptibles de découler de ce projet [GRAND PUBLIC]?</h3>",
"predictedHarms"=>"<h2>5.6. Nuisances prévues </h2>",
"procedures"=>"<h3>5.6.1. À quels types d’interventions les animaux seront-ils soumis (par exemple, prélèvements sur animaux vigiles, procédures
chirurgicales) ? Indiquer leur nombre et leur durée. </h3>",
"expectedImpacts"=>"<h3>5.6.2. Quels sont les effets / ou effets indésirables prévus sur les animaux ? </h3>",
"expectedHarms"=>"<h2>5.7. Quelles espèces est-il prévu d’utiliser? Quels sont le degré de gravité des procédures et le nombre d’animaux prévus dans chaque catégorie de gravité (par espèce) ? </h2>",
"species"=>"<br>- Espèce : ",
"nonRecovery"=>"<br>     Sans réveil : ",
"mild"=>"<br>     Légère : ",
"moderate"=>"<br>     Modérée : ",
"severe"=>"<br>     Sévère : ",
"fateOfAnimalsKeptAlive"=>"<h2>5.8. Qu’adviendra-t-il des animaux maintenus en vie à la fin du projet ?</h2>",
"reused"=>"<br>     Réutilisés : ",
"returned"=>"<br>     Replacés : ",
"rehomed"=>"<br>     Adoptés : ",
"fateReasons"=>"<h2>5.9. Justifier le sort prévu de tous les animaux à l'issue de chaque procédure </h2>",
"applicationOfTheThreeRs"=>"<h2>5.10. Application de la règle des «trois R» </h2>",
"replacement"=>"<h3>1. Remplacement. [Repris automatiquement du champ 3.3.6.1]</h3> ",
"reduction"=>"<h3>2. Réduction. [Repris automatiquement du champ 3.3.6.2] </h3>",
"refinement"=>"<h3>3. Raffinement. [Repris automatiquement du champ 3.3.6.3] </h3>",
"speciesChoiceExplanation"=>"<h2>5.11. Expliquer le choix des espèces et les stades de développement y afférents. [Repris automatiquement des champs 3.4.3 et 3.4.11,
dans la limite des 2500 premiers caractères]</h2>");

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




print $query->redirect("../upload/$filename.html");
