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
<p>Your file has not the good extension. Only .xml produced by apafis are accepted!</p>
<p><a href="/">Go back to the form</a></p>
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

my @files = glob "$upload_dir/*.xml";
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
</head><h1>1. Informations GÃ©nÃ©rales</h1>",
"TitreProjet"=>"<h2>1.2. Titre du projetÂ :</h2>",
"NumVersion"=>"NumÃ©ro de version :",
"ReferenceDossier"=>"<h2>1.1. RÃ©fÃ©rence Dossier :</h2>",
"DureeProjet"=>"<h2>1.2. DurÃ©e du projetÂ :</h2>",
"DureeAnnees"=>"AnnÃ©es :",
"DureeMois"=>"Mois :",
"DureeJours"=>"Jours :",
"DebutQuandProjetAutorise"=>"<br>DÃ¨s que le projet est autorisÃ© :",
"DatePrevueDebutProjet"=>"<h2>1.3. Date prÃ©vue de dÃ©but du projetÂ (AnnÃ©e-Mois-Jour):</h2>",
"Date"=>"Date :",
"RNT"=>"<h1>2. Rnt (inutilisÃ©)</h1>",
"InformationsAdministrativesEtReglementaires"=>"<h1>3. Informations Administratives et RÃ©glementaires</h1>",
"EtablissementUtilisateur"=>"<h2>3.1. L Ã©tablissement utilisateur (EU)</h2>",
"AgrementUE"=>"<h3>3.1.1. AgrÃ©ment de l'EU oÃ¹ seront utilisÃ©s les animaux :</h3>",
"NomUE"=>"Nom :","NumeroAgrement"=>"<br>NumÃ©ro d'agrÃ©mentÂ :",
"DateDelivrance"=>"<br>Date de dÃ©livrance de l'agrÃ©mentÂ :",
"CiviliteResponsable"=>"<br>CivilitÃ© :",
"NomResponsable"=>"<br>Nom du responsable :",
"PrenomResponsable"=>"<br>PrÃ©nom du responsable :",
"EMailResponsable"=>"<br>Adresse Ã©lectronique du responsableÂ :",
"CiviliteDelegataire"=>"<br>CivilitÃ© du dÃ©lÃ©gataire :",
"NomDelegataire"=>"<br>Nom de la personne dÃ©lÃ©gataire du responsable prÃ©sente dans l'EUÂ :",
"PrenomDelegataire"=>"<br>PrÃ©nom de la personne dÃ©lÃ©gataire du responsable prÃ©sente dans l'EUÂ :",
"EMailDelegataire"=>"<br>Adresse Ã©lectronique de ce dÃ©lÃ©gataireÂ :",
"ComiteEthiqueAgree"=>"<h3>3.1.2. ComitÃ© d'Ã©thique agrÃ©Ã© par le MESR dont relÃ¨ve l'EU :</h3>",
"ResponsablesMiseEnOeuvre NombreResponsablesMiseEnOeuvre=\"1\""=>"<h3>3.1.3. Responsable(s) de la mise en oeuvre gÃ©nÃ©rale du projet dans l'EU et de sa conformitÃ© Ã  l'autorisation de projet :</h3>",
"ResponsablesMiseEnOeuvre NombreResponsablesMiseEnOeuvre=\"2\""=>"<h3>3.1.3. Responsable(s) de la mise en Å“uvre gÃ©nÃ©rale du projet dans l'EU et de sa conformitÃ© Ã  l'autorisation de projet :</h3>",
"ResponsablesMiseEnOeuvre NombreResponsablesMiseEnOeuvre=\"3\""=>"<h3>3.1.3. Responsable(s) de la mise en Å“uvre gÃ©nÃ©rale du projet dans l'EU et de sa conformitÃ© Ã  l'autorisation de projet :</h3>",
"ResponsablesMiseEnOeuvre NombreResponsablesMiseEnOeuvre=\"4\""=>"<h3>3.1.3. Responsable(s) de la mise en Å“uvre gÃ©nÃ©rale du projet dans l'EU et de sa conformitÃ© Ã  l'autorisation de projet :</h3>",
"CoordonneesResponsablesMiseEnOeuvre"=>"<br>Responsable(s)Â :",
"Civilite"=>"<br>CivilitÃ© :",
"Nom"=>"<br>Nom :",
"Prenom"=>"<br>Prenom :",
"AdressePostale"=>"<br>Adresse postale :",
"NomLaboratoire"=>"<br>Nom du Laboratoire :",
"ComplementAdresse"=>"<br>ComplÃ©ment :",
"NumeroRue"=>"<br>NumÃ©ro de rue :",
"Voie"=>"<br>Voie :",
"CodePostal"=>"<br>Code Postal :",
"Ville"=>"<br>Ville :",
"Pays"=>"<br>Pays :",
"Email"=>"<br>Email :",
"NumTelephone"=>"<br>TÃ©lÃ©phone :",
"ResponsablesBienEtre NombreResponsablesBienEtre=\"1\""=>"<h3>3.1.4. Responsable(s) du bien-Ãªtre des animaux :</h3>",
"ResponsablesBienEtre NombreResponsablesBienEtre=\"2\""=>"<h3>3.1.4. Responsable(s) du bien-Ãªtre des animaux :</h3>",
"ResponsablesBienEtre NombreResponsablesBienEtre=\"3\""=>"<h3>3.1.4. Responsable(s) du bien-Ãªtre des animaux :</h3>",
"ResponsablesBienEtre NombreResponsablesBienEtre=\"4\""=>"<h3>3.1.4. Responsable(s) du bien-Ãªtre des animaux :</h3>",
"CoordonneesResponsablesBienEtre"=>"<br>Responsable(s)Â :",
"Personnel"=>"<h2>3.2. Le personnel </h2>",
"ConceptionProceduresExp"=>"CompÃ©tences des personnes participant au projetÂ :<br> - la conception des procÃ©dures expÃ©rimentales et des projets : ",
"ApplicationProceduresExp"=>"<br> - l'application de procÃ©dures expÃ©rimentales aux animaux : ",
"SoinAuxAnimaux"=>"<br> - les soins aux animaux : ",
"MiseAMort"=>"<br> - la mise Ã  mort des animaux : ",
"Projet"=>"<h2>3.3. Le projet</h2>",
"ObjectifDuProjet"=>"<h3>3.3.1. L'objectif du projet :</h3>",
"JustificationProjet"=>"Est-ilÂ :",
"JustifieEducativement"=>"<br> - justifiÃ© du point de vue Ã©ducatifÂ ?	: ",
"RequisLoi"=>"<br> - requis par la loiÂ ?	: ",
"JustifieScientifiquement"=>"<br> - justifiÃ© du point de vue scientifiqueÂ ?	: ",
"InformationsJustification"=>"<br><b>Quelle est lâ€™instance qui a Ã©valuÃ© lâ€™intÃ©rÃªt de ce projet ? </b>",
"DescriptionProjet"=>"<h3>3.3.2. Description du projet :</h3>",
"DescriptionProjet2"=>"<h3>3.3.2. Description du projet :</h3>",
"ObjectifsDuProjet"=>"<h4>3.3.2.1. Objectifs du projet :</h4>",
"DerouleDuProjet"=>"<h4>3.3.2.2. DÃ©roulÃ© du projet :</h4>",
"BeneficesDuProjet"=>"<h4>3.3.2.3. BÃ©nÃ©fices attendus du projet (version scientifique):</h4>",
"NuisancesAnimaux"=>"<h4>3.3.2.4. Nuisances ou effets indÃ©sirables attendus sur les animaux (version scientifique):</h4>",
"MethodeMiseAMort"=>"<h3>3.3.3. PrÃ©cisez, le cas Ã©chÃ©ant, la ou les mÃ©thodes de mise Ã  mort prÃ©vue(s) :</h3>",
"ElementsScientifiquesJustifiantDemandeMiseAMort"=>"<h3>3.3.4. PrÃ©cisez, le cas Ã©chÃ©ant, les Ã©lÃ©ments scientifiques justifiant la demande de dÃ©rogation concernant la mÃ©thode de mise Ã  mort envisagÃ©e :</h3>",
"StrategieExperimentations"=>"<h3>3.3.5. StratÃ©gie d'expÃ©rimentation ou d'observation et approche statistique utilisÃ©e afin de rÃ©duire au minimum le nombre d'animaux, la douleur, la souffrance et l'angoisse, infligÃ©es et l'impact environnemental, le cas Ã©chÃ©ant . si une Ã©tude statistique est prÃ©vue, indiquez et justifiez les tests choisis (INUTILISE):</h3>",
"Strategies3R"=>"<h3>3.3.6. StratÃ©gies de Remplacement, de RÃ©duction et de Raffinement</h3>",
"Remplacement"=>"<h4>3.3.6.1. Remplacement</h4>",
"Reduction"=>"<h4>3.3.6.2. RÃ©duction</h4>",
"Raffinement"=>"<h4>3.3.6.3. Raffinement</h4>",
"Animaux"=>"<h2>3.4. Les animaux</h2>",
"JustificationRecoursAuxAnimaux"=>"<h3>3.4.1. Justifiez la nÃ©cessitÃ© d'avoir recours Ã  des animaux pour atteindre les objectifs du projet (inutilisÃ©):</h3>",
"ListeAnimaux"=>"<h3>3.4.2. EspÃ¨ces animales ou types d'animaux utilisÃ©s (le champ 3.4.1. est supprimÃ©) :</h3>",
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
"Chevaux"=>"<br>Chevaux, Ã¢nes et croisements (Equidae) [A13]&emsp;",
"Porcs"=>"<br>Porcs (Sus scrofa domesticus) [A14]&emsp;",
"Caprins"=>"<br>Caprins (Capra aegagrus hircus) [A15]&emsp;",
"Ovins"=>"<br>Ovins (Ovis aries) [A16]&emsp;",
"Bovins"=>"<br>Bovins (Bos taurus) [A17]&emsp;",
"Prosimien"=>"<br>Prosimiens (prosimia) [A18]&emsp;",
"Ouistitis"=>"<br>Ouistitis et tamarins (par exemple, Callithrix jacchus) [A19]&emsp;",
"SingeCynomologue"=>"<br>Singe cynomolgus (Macaca fascicularis) [A20]&emsp;",
"SingeRhesus"=>"<br>Singe rhÃ©sus (Macaca mulatta) [A21]&emsp;",
"Vervets"=>"<br>Vervets (Chlorocebus spp.) (soit pygerythrus, soit sabaeus) [A22]&emsp;",
"Babouins"=>"<br>Babouins (Papio son.) [A23]&emsp;",
"Sairimis"=>"<br>SaÃ¯miris (par exemple, Saimiri sciureus) [A24]&emsp;",
"AutresSingesAncienMonde"=>"<br>Autres espÃ¨ces de singes de l'Ancien Monde (autres espÃ¨ces de Cercopithecoidea)[A25-1]&emsp;",
"AutresSingesNouveauMonde"=>"<br>Autres espÃ¨ces de singes du Nouveau Monde[A25-2]&emsp;",
"AutresPrimateNonHumain"=>"<br>Autres espÃ¨ces de primates non humains [cocher [A25-1] ou [A25-2]]&emsp;",
"SingesAntropoides"=>"<br>SingesAntropoides&emsp;",
"AutresMammiferes"=>"<br>Autres mammifÃ¨res (autres Mammalia) [A27]&emsp;",
"PoulesDomestiques"=>"<br>Poules domestiques (Gallus gallus domesticus) [A28]&emsp;",
"Dindes"=>"<br>Dindes&emsp;",
"AutresOiseaux"=>"<br>Autres oiseaux (autres Aves) [A29]&emsp;",
"Reptiles"=>"<br>Reptiles (Reptilia) [A30]&emsp;",
"GrenouillesRana"=>"<br>Grenouilles Rana (Rana temporaria et Rana pipiens) [ABI]&emsp;",
"GrenouillesXenopus"=>"<br>Grenouilles Xenopus (Xenopus laevis et Xenopus tropicalis) [A32]&emsp;",
"AutresAmphibiens"=>"<br>Autres amphibiens (autres Amphibia) [A33]&emsp;",
"PoissonsZebres"=>"<br>Poissons zÃ¨bres (Danio rerio) [A34]&emsp;",
"Bars"=>"<br>Bars&emsp;",
"Saumons"=>"<br>Saumons&emsp;",
"Guppies"=>"<br>Guppies&emsp;",
"AutresPoissons"=>"<br>Autres poissons (autres Pisces) [A35]&emsp;",
"Cephalopodes"=>"<br>CÃ©phalopodes (Cephalopoda) [A36]&emsp;",
"PertinenceAnimauxChoisis"=>"<h3>3.4.3. Justifiez la pertinence de l'(des) espÃ¨ce(s) animale(s) choisie(s) :</h3>",
"EspecesMenacees"=>"<h3>3.4.4. S'agit-il de spÃ©cimens d'espÃ¨ces menacÃ©es Ã©numÃ©rÃ©es Ã  l'annexe A du rÃ¨glement (CE) nÂ° 338/97 du Conseil du 9 dÃ©cembre 1996 relatif Ã  la protection des espÃ¨ces de faune et de flore sauvages par le contrÃ´le et leur commerce ?</h3>",
"OuiEspecesMenacees"=>"<br>Si oui, Ã©lÃ©ments scientifiques dÃ©montrant que la finalitÃ© de la procÃ©dure expÃ©rimentale ne peut Ãªtre atteinte en utilisant d'autres espÃ¨ces que celles Ã©numÃ©rÃ©es dans cette annexe :<br>",
"Primate"=>"<h3>3.4.5. S'agit-il de spÃ©cimens de primates non humains ?</h3>",
"OuiPrimate"=>"<br><br>Si oui, Ã©lÃ©ments scientifiques dÃ©montrant que la finalitÃ© de la procÃ©dure expÃ©rimentale ne peut Ãªtre atteinte en utilisant d'autres espÃ¨ces de primates non humains:<br>",
"CaptureNature"=>"<h3>3.4.6. S'agit-il d'animaux capturÃ©s dans la nature ?</h3> ",
"OuiCaptureNature"=>"<br><br>Si oui, Ã©lÃ©ments scientifiques dÃ©montrant que la finalitÃ© de la procÃ©dure expÃ©rimentale ne peut Ãªtre atteinte en utilisant d'autres animaux que ceux  capturÃ©s dans la nature :<br>",
"EspeceDomestique"=>"<h3>3.4.7. S'agit-il d'animaux d'espÃ¨ces domestiques, errants ou vivant Ã  l'Ã©tat sauvage ?</h3>",
"OuiEspeceDomestique"=>"<br><br>Si oui, Ã©lÃ©ments scientifiques dÃ©montrant que la finalitÃ© de la procÃ©dure expÃ©rimentale ne peut Ãªtre atteinte qu'en utilisant ces animaux.<br>",
"CategorieAnimauxUtilises"=>"<h3>3.4.8. CatÃ©gorie des animaux utilisÃ©s dans le projet :</h3>",
"AnimauxEnCaptivite"=>"<br> - Animaux tenus en captivitÃ© (domestiques ou non domestiques)	: ",
"AnimauxNonDomNonCaptifs"=>"<br> - Animaux non domestiques non tenus en captivitÃ©	: ",
"ReferencesDerogationsEspProtegee"=>"<br><br>Si les animaux utilisÃ©s sont des spÃ©cimens d'espÃ¨ces protÃ©gÃ©es en application de l'article L. 411-1 du Code de l'environnement, indiquez les rÃ©fÃ©rences de la dÃ©rogation accordÃ©e pour effectuer la capture des animaux dans le milieu naturel (4Â° de l'article L. 411-2 du Code de l'environnement) :<br>",
"ReferencesDerogationsChasseAutorisee"=>"<br><br>Si les animaux utilisÃ©s sont des spÃ©cimens d'espÃ¨ces dont la chasse est autorisÃ©e, indiquez ici les rÃ©fÃ©rences de l'autorisation de prÃ©lÃ¨vement accordÃ©e pour effectuer la capture des animaux dans le milieu naturel (article L. 424-11 du Code de l'environnement) :<br>",
"Justification"=>"<br><br>Justification scientifique montrant que l'objectif de la procÃ©dure expÃ©rimentale ne peut Ãªtre atteint en utilisant un animal Ã©levÃ© en vue d'une utilisation dans des procÃ©dures expÃ©rimentales :<br>",
"OuiAnimauxGenetiquementAlteres"=>"<br><b>Animaux gÃ©nÃ©tiquement altÃ©rÃ©s</b>",
"AnimauxGenetiquementModifiesEtSoucheMutante"=>"<br>Animaux gÃ©nÃ©tiquement modifiÃ©s ET Souche mutante autre",
"AnimauxGenetiquementModifies2"=>"<br><b> - Animaux gÃ©nÃ©tiquement modifiÃ©s</b>",
"CreationLignee"=>"<br>CrÃ©ation d'une lignÃ©e : ",
"MaintienLigneeEtablie"=>"<br>Maintien d'une lignÃ©e Ã©tablie et/ou utilisation : ",
"PhenotypeDommageable"=>"<br>PhÃ©notype dommageable : ",
"NumeroRecipisse"=>"<br>NumÃ©ro dâ€™agrÃ©ment, le cas Ã©chÃ©ant : ",
"SoucheMutante2"=>"<br><b> - Souche mutante autre</b>",
"CreationMutant"=>"<br>CrÃ©ation d'un mutant : ",
"MaintienLigneeEtablieMutant"=>"<br>Maintien d'une lignÃ©e Ã©tablie et/ou utilisation : ",
"PhenotypeDommageableMutant"=>"<br>PhÃ©notype dommageable : ",
"CategorieAnimauxUtilises"=>"<h3>3.4.8. CatÃ©gorie des animaux utilisÃ©s dans le projet :</h3>",
"OrigineAnimaux"=>"<h3>3.4.9. Origine des animaux tenus en captivitÃ© :</h3>",
"ElevesAFinExperimentale"=>"<br>Les animaux destinÃ©s Ã  Ãªtre utilisÃ©s dans les procÃ©dures expÃ©rimentales appartenant aux espÃ¨ces dont la liste est fixÃ©e rÃ©glementairement sont-ils Ã©levÃ©s Ã  cette fin et proviennent-ils d'Ã©leveurs ou de fournisseurs agrÃ©Ã©s ?",
"OuiEleves NombreEtablissementEleveur=\"1\""=>"<br>Nombre dâ€™Ã©tablissements Ã©leveur ou fournisseur agrÃ©Ã©s franÃ§ais fournissant tout ou partie des animaux
du projet : 1",
"OuiEleves NombreEtablissementEleveur=\"2\""=>"<br>Nombre dâ€™Ã©tablissements Ã©leveur ou fournisseur agrÃ©Ã©s franÃ§ais fournissant tout ou partie des animaux
du projet : 2",
"OuiEleves NombreEtablissementEleveur=\"3\""=>"<br>Nombre dâ€™Ã©tablissements Ã©leveur ou fournisseur agrÃ©Ã©s franÃ§ais fournissant tout ou partie des animaux
du projet : 3",
"OuiEleves NombreEtablissementEleveur=\"4\""=>"<br>Nombre dâ€™Ã©tablissements Ã©leveur ou fournisseur agrÃ©Ã©s franÃ§ais fournissant tout ou partie des animaux
du projet : 4",
"OuiEleves NombreEtablissementEleveur=\"5\""=>"<br>Nombre dâ€™Ã©tablissements Ã©leveur ou fournisseur agrÃ©Ã©s franÃ§ais fournissant tout ou partie des animaux
du projet : 5",
"OuiEleves NombreEtablissementEleveur=\"6\""=>"<br>Nombre dâ€™Ã©tablissements Ã©leveur ou fournisseur agrÃ©Ã©s franÃ§ais fournissant tout ou partie des animaux
du projet : 6",
"OuiElevesAFinExperimentale"=>"<br>Nom de l'Ã©tablissement :",
"NomEtablissement"=>"<br> Nom de l'Ã©tablissement :",
"AdressePostaleEtablissement"=>"<br> Adresse postale",
"AnimauxFournis"=>"<br> Animaux Fournis : ",
"OuiEleves"=>"",
"NonEleves"=>"<br>Si non, justifier scientifiquement l'utilisation d'animaux qui ne proviennent pas d'Ã©leveurs ou de fournisseurs agrÃ©Ã©s :",
"VotreEUFournitToutOuPartieAnimaux"=>"<br>Votre propre Ã©tablissement utilisateur fournit-il tout ou partie des animaux du projetÂ ?",
"AutreEUFournitToutOuPartieAnimaux"=>"<br>Un autre Ã©tablissement utilisateur fournit-il tout ou partie des animaux du projetÂ ?",
"EtablissementsNonAgreesFournissantAnimaux NombreEtablissementsNonAgreesFournissantAnimaux=\"1\""=>"<br>Nombre d'Ã©tablissements Ã©leveur occasionnel non agrÃ©Ã©s fournissant tout ou partie des animaux du projet ? 1",
"EtablissementsNonAgreesFournissantAnimaux NombreEtablissementsNonAgreesFournissantAnimaux=\"2\""=>"<br>Nombre d'Ã©tablissements Ã©leveur occasionnel non agrÃ©Ã©s fournissant tout ou partie des animaux du projet ? 2",
"EtablissementsNonAgreesFournissantAnimaux NombreEtablissementsNonAgreesFournissantAnimaux=\"3\""=>"<br>Nombre d'Ã©tablissements Ã©leveur occasionnel non agrÃ©Ã©s fournissant tout ou partie des animaux du projet ? 3",
"EtablissementsNonAgreesFournissantAnimaux NombreEtablissementsNonAgreesFournissantAnimaux=\"4\""=>"<br>Nombre d'Ã©tablissements Ã©leveur occasionnel non agrÃ©Ã©s fournissant tout ou partie des animaux du projet ? 4",
"NomEtablissementsNonAgreesFournissantAnimaux"=>"<br>Nom de l'Ã©tablissement :",
"EtablissementsNonAgreesFournissantAnimaux"=>"<br>Nom de l'Ã©tablissement :",
"EtablissementsEtatsMembresFournissantAnimaux NombreEtablissementsEtatsMembresFournissantAnimaux=\"1\""=>"<br>Nombre d'Ã©tablissements Ã©leveur ou fournisseur localisÃ©s dans des Etats membres autres que la France fournissant tout ou partie des animaux du projet ? 1",
"EtablissementsEtatsMembresFournissantAnimaux NombreEtablissementsEtatsMembresFournissantAnimaux=\"2\""=>"<br>Nombre d'Ã©tablissements Ã©leveur ou fournisseur localisÃ©s dans des Etats membres autres que la France fournissant tout ou partie des animaux du projet ? 2",
"EtablissementsEtatsMembresFournissantAnimaux NombreEtablissementsEtatsMembresFournissantAnimaux=\"3\""=>"<br>Nombre d'Ã©tablissements Ã©leveur ou fournisseur localisÃ©s dans des Etats membres autres que la France fournissant tout ou partie des animaux du projet ? 3",
"EtablissementsEtatsMembresFournissantAnimaux NombreEtablissementsEtatsMembresFournissantAnimaux=\"4\""=>"<br>Nombre d'Ã©tablissements Ã©leveur ou fournisseur localisÃ©s dans des Etats membres autres que la France fournissant tout ou partie des animaux du projet ? 4",
"EtablissementEtatMembre"=>"<br>Informations sur l'Ã©tablissement :",
"NomEtablissementsEtatsMembresFournissantAnimaux"=>"Nom de l'Ã©tablissement :",
"PaysEtablissementsEtatsMembresFournissantAnimaux"=>"Pays de l'Ã©tablissement :",
"EtablissementsEtatsTiersFournissantAnimaux NombreEtablissementsEtatsTiersFournissantAnimaux=\"1\""=>"<br>Nombre d'Ã©tablissements Ã©leveur ou fournisseur localisÃ©s dans des pays tiers fournissant tout ou partie des animaux du projet ? 1",
"EtablissementsEtatsTiersFournissantAnimaux NombreEtablissementsEtatsTiersFournissantAnimaux=\"2\""=>"<br>Nombre d'Ã©tablissements Ã©leveur ou fournisseur localisÃ©s dans des pays tiers fournissant tout ou partie des animaux du projet ? 2",
"EtablissementsEtatsTiersFournissantAnimaux NombreEtablissementsEtatsTiersFournissantAnimaux=\"3\""=>"<br>Nombre d'Ã©tablissements Ã©leveur ou fournisseur localisÃ©s dans des pays tiers fournissant tout ou partie des animaux du projet ? 3",
"EtablissementEtatTiers"=>"<br>Informations sur l'Ã©tablissement :",
"NomEtablissementsEtatsTiersFournissantAnimaux"=>"<br>Nom de l'Ã©tablissement  :",
"PaysEtablissementsEtatsTiersFournissantAnimaux"=>"<br>Pays de l'Ã©tablissement  :",
"AnimauxReutilisesProjetPrecedent"=>"<br>Les animaux sont-ils des animaux rÃ©utilisÃ©s d'un projet prÃ©cÃ©dent ?",
"AnimauxUtilises"=>"",
"NombreAnimauxUtilises"=>"<h3>3.4.10. Nombre estimÃ© d'animaux utilisÃ©s dans le projet :</h3>",
"JustificationUtilisationEspeces"=>"<br>Justification de ce nombre pour chacune des espÃ¨ces animales utilisÃ©es :<br>",
"UtilisationQuelStade"=>"<h3>3.4.11. Indiquez Ã  quel(s) stade(s) de dÃ©veloppement les animaux seront utilisÃ©s et le justifier :</h3>",
"SexeAnimauxUtilisesJustification"=>"<h3>3.4.12. Indiquez le sexe des animaux utilisÃ©s et le justifier :</h3>",
"ProceduresExperimentales"=>"<h1>4. ProcÃ©dures expÃ©rimentales</h1>",
"ExplicationsProcedures NombreProcedures=\"1\""=>"<h2>4.2 Nombre de procÃ©dures expÃ©rimentales :  1</h2>",
"ExplicationsProcedures NombreProcedures=\"2\""=>"<h2>4.2 Nombre de procÃ©dures expÃ©rimentales :  2</h2>",
"ExplicationsProcedures NombreProcedures=\"3\""=>"<h2>4.2 Nombre de procÃ©dures expÃ©rimentales :  3</h2>",
"ExplicationsProcedures NombreProcedures=\"4\""=>"<h2>4.2 Nombre de procÃ©dures expÃ©rimentales :  4</h2>",
"ExplicationsProcedures NombreProcedures=\"5\""=>"<h2>4.2 Nombre de procÃ©dures expÃ©rimentales :  5</h2>",
"ExplicationsProcedures NombreProcedures=\"6\""=>"<h2>4.2 Nombre de procÃ©dures expÃ©rimentales :  6</h2>",
"ExplicationsProcedures NombreProcedures=\"7\""=>"<h2>4.2 Nombre de procÃ©dures expÃ©rimentales :  7</h2>",
"ExplicationsProcedures NombreProcedures=\"8\""=>"<h2>4.2 Nombre de procÃ©dures expÃ©rimentales :  8</h2>",
"ExplicationsProcedures NombreProcedures=\"9\""=>"<h2>4.2 Nombre de procÃ©dures expÃ©rimentales :  9</h2>",
"ExplicationsProcedures NombreProcedures=\"10\""=>"<h2>4.2 Nombre de procÃ©dures expÃ©rimentales :  10</h2>",
"ExplicationsProcedures NombreProcedures=\"11\""=>"<h2>4.2 Nombre de procÃ©dures expÃ©rimentales :  11</h2>",
"ExplicationsProcedures NombreProcedures=\"12\""=>"<h2>4.2 Nombre de procÃ©dures expÃ©rimentales :  12</h2>",
"ExplicationsProcedures NombreProcedures=\"13\""=>"<h2>4.2 Nombre de procÃ©dures expÃ©rimentales :  13</h2>",
"ExplicationsProcedures NombreProcedures=\"14\""=>"<h2>4.2 Nombre de procÃ©dures expÃ©rimentales :  14</h2>",
"ExplicationsProcedures NombreProcedures=\"15\""=>"<h2>4.2 Nombre de procÃ©dures expÃ©rimentales :  15</h2>",
"ExplicationsProcedures NombreProcedures=\"16\""=>"<h2>4.2 Nombre de procÃ©dures expÃ©rimentales :  16</h2>",
"ExplicationsProcedures NombreProcedures=\"17\""=>"<h2>4.2 Nombre de procÃ©dures expÃ©rimentales :  17</h2>",
"ExplicationsProcedures NombreProcedures=\"18\""=>"<h2>4.2 Nombre de procÃ©dures expÃ©rimentales :  18</h2>",
"ExplicationsProcedures NombreProcedures=\"19\""=>"<h2>4.2 Nombre de procÃ©dures expÃ©rimentales :  19</h2>",
"ExplicationsProcedures NombreProcedures=\"20\""=>"<h2>4.2 Nombre de procÃ©dures expÃ©rimentales :  20</h2>",
"ExplicationsProcedures NombreProcedures=\"21\""=>"<h2>4.2 Nombre de procÃ©dures expÃ©rimentales :  21</h2>",
"ExplicationsProcedures NombreProcedures=\"22\""=>"<h2>4.2 Nombre de procÃ©dures expÃ©rimentales :  22</h2>",
"ExplicationsProcedures NombreProcedures=\"23\""=>"<h2>4.2 Nombre de procÃ©dures expÃ©rimentales :  23</h2>",
"ExplicationsProcedures NombreProcedures=\"24\""=>"<h2>4.2 Nombre de procÃ©dures expÃ©rimentales :  24</h2>",
"ExplicationsProcedures NombreProcedures=\"25\""=>"<h2>4.2 Nombre de procÃ©dures expÃ©rimentales :  25</h2>",
"Procedure"=>"<h3>4.2.x ProcÃ©dure x</h3>",
"NomProcedure"=>"<b>Nom de la procÃ©dure :</b><br>",
"ClassificationProcedure"=>"<br><b>     Proposition de classification de la procÃ©dure selon le degrÃ© de sÃ©vÃ©ritÃ© : </b>	",
"DescriptionDetaillee"=>"<br><b>     Description dÃ©taillÃ©e de la procÃ©dure expÃ©rimentale </b>",
"PertinenceJustification"=>"<br><br><b>     Pertinence et justification de la procÃ©dure expÃ©rimentale : </b>",
"NombreLots"=>"<br><b>      Indiquez le nombre de lots et le nombre d'animaux par lots, et les justifier :</b><br>",
"PointsLimitesAdaptes"=>"<br><b>      Indiquez pour chaque espÃ¨ce les points limites adaptÃ©s, suffisamment prÃ©dictifs et prÃ©coces pour permettre de limiter la douleur Ã  son minimum, sans remettre en cause les rÃ©sultats du projet : </b>",
"PrelevementEtFrequence"=>"<br><b>      Indiquez le cas Ã©chÃ©ant le prÃ©lÃ¨vement, ainsi que la frÃ©quence et le(s) volume(s) prÃ©levÃ©s : </b>",
"MethodeSuppressionDouleur"=>"<br><b>     Indiquez le cas Ã©chÃ©ant les mÃ©thodes pour rÃ©duire ou supprimer la douleur, la souffrance et l'angoisse [liste des mÃ©dications . anesthÃ©siques, analgÃ©siques, anti-inflammatoires, en prÃ©cisant les doses, voies, durÃ©es et frÃ©quences d'administration], y compris le raffinement des conditions d'hÃ©bergement, d'Ã©levage et de soins :</b>",
"MethodeSuppressionSouffrance"=>"<br><b>      Indiquez le cas Ã©chÃ©ant les dispositions prises en vue de rÃ©duire, d'Ã©viter et d'attÃ©nuer toute forme de souffrance des animaux de la naissance Ã  la mort : </b>",
"RaisonsScientifiquesDerogationAnestesie"=>"<br><b>     Indiquez le cas Ã©chÃ©ant les raisons scientifiques justifiant une dÃ©rogation Ã  l'anesthÃ©sie des animaux : </b>",
"RaisonsScientifiquesDerogationHebergement"=>"<br><b>     Indiquez le cas Ã©chÃ©ant les raisons scientifiques justifiant une dÃ©rogation aux conditions d'hÃ©bergement des animaux : </b>",
"DispositionsPrisesEviterDoubleEmploi"=>"<br><b>     Dispositions prises pour Ã©viter tout double emploi injustifiÃ© des procÃ©dures expÃ©rimentales, le cas Ã©chÃ©ant : </b>",
"DevenirAnimaux"=>"<br><b>     Devenir des animaux Ã  la fin de cette procÃ©dure expÃ©rimentale : </b>",
"MiseAMortAnimaux"=>"<br><b>      mise Ã  mort ? : </b>",
"AnimauxMisAMort"=>"<br>	prÃ©cisez les animaux concernÃ©s :<br>",
"GardeEnVie"=>"<br><b>      animal gardÃ© en vie ? : </b>",
"AnimauxGardesEnVie"=>"<br>	prÃ©cisez les animaux concernÃ©s :<br>",
"DecisionVeterinaire"=>"<br>PrÃ©cisez si la dÃ©cision a Ã©tÃ© prise par le vÃ©tÃ©rinaire ou toute autre personne compÃ©tente dÃ©signÃ©e par le responsable du projet:",
"MiseEnLiberte"=>"<br><b>     Placement ou mise en libertÃ© des animaux ? : </b>",
"AnimauxMisEnLiberte"=>"<br>PrÃ©cisez les animaux concernÃ©s:<br>",
"ExplicationsProcedures"=>"",
"UtilisationAnimauxProjetAnterieur"=>"<h2>4.3. Si le projet utilise des animaux rÃ©utilisÃ©s d'un projet antÃ©rieur :</h2>",
"GraviteReelle"=>"<br>GravitÃ© rÃ©elle de la (ou des) procÃ©dure(s) antÃ©rieure(s) :<br>",
"GraviteLegere"=>"<br>- lÃ©gÃ¨re : ",
"GraviteModeree"=>"<br>- modÃ©rÃ©e : ",
"GraviteSevere"=>"<br>- sÃ©vÃ¨re : ",
"ElementsScientifiquesJustifiantDerogation"=>"<br>Si des animaux sont issus dâ€™une procÃ©dure antÃ©rieure Â« sÃ©vÃ¨re Â», apporter les Ã©lÃ©ments scientifiques justifiant la dÃ©rogation, pour
autant que ces animaux nâ€™aient pas Ã©tÃ© utilisÃ©s plus dâ€™une fois dans une procÃ©dure expÃ©rimentale entrainant une douleur intense, de
lâ€™angoisse ou une souffrance Ã©quivalente. Dans ce cas, le MESRI peut autoriser la rÃ©utilisation, aprÃ¨s avis du comitÃ© dâ€™Ã©thique en expÃ©rimentation animale dont relÃ¨ve lâ€™Ã©tablissement <br>",
"EffetCumulatif"=>"<br>Effet cumulatif de cette rÃ©utilisation sur les animaux :<br>",
"AvisVeterinaireFavorable"=>"<br>L'avis vÃ©tÃ©rinaire est-il favorable en prenant en considÃ©ration le sort de l'animal concernÃ© sur toute sa durÃ©e de vie ?<br>",
"EtatDeSanteRecouvre"=>"<br>L'animal rÃ©utilisÃ© a-t-il pleinement recouvrÃ© son Ã©tat de santÃ© et de bien-Ãªtre gÃ©nÃ©ral ?<br>",
"ProjetContenantSouffranceSevere"=>"<h2>4.4. Cas particulier des projets contenant une procÃ©dure expÃ©rimentale impliquant une douleur,  une angoisse ou une souffrance sÃ©vÃ¨re et susceptible de se prolonger sans qu'il soit possible de les soulager</h2>",
"ProcedureEnCause"=>"<br>De quelle(s) procÃ©dure(s) expÃ©rimentale(s) du projet s'agit-il ?<br>",
"JustificationScientifiqueProcedure"=>"<br>Justifiez scientifiquement les raisons Ã  l'origine d'une demande de dÃ©rogation :<br>",
"PublishNtsProjectRequest"=>"<h1>5. RÃ©sumÃ© au format europÃ©en </h1>",
"projectTitle"=>"<h2>5.1. IntitulÃ© du projet [Repris automatiquement du champ 1.2]</h2>",
"projectDuration"=>"<h2>5.2. DurÃ©e du projet (en mois) [Repris automatiquement du champ 1.3]</h2>",
"keywords"=>"<h2>5.3. Mots-clÃ©s </h2>",
"keyword"=>"<br>- Mot-clÃ© n1 : ",
"keyword"=>"<br>- Mot-clÃ© n1 : ",
"keyword2"=>"<br>- Mot-clÃ© n2 : ",
"keyword3"=>"<br>- Mot-clÃ© n3 : ",
"keyword4"=>"<br>- Mot-clÃ© n4 : ",
"keyword5"=>"<br>- Mot-clÃ© n5 : ",
"keyword6"=>"<br>- Mot-clÃ© n6 : ",
"projectPurposes"=>"<h2>5.4. FinalitÃ©s du projet. SÃ©lectionner dans la liste proposÃ©e la ou les finalitÃ©s du projet</h2>",
"purpose"=>"<br>- FinalitÃ© :  ",
"objectivesAndBenefits"=>"<h2>5.5. Objectifs et bÃ©nÃ©fices escomptÃ©s du projet </h2>",
"projectObjectives"=>"<h3>5.5.1. DÃ©crire les objectifs du projet [GRAND PUBLIC] </h3>",
"potentialBenefits"=>"<h3>5.5.2. Quels sont les bÃ©nÃ©fices susceptibles de dÃ©couler de ce projet [GRAND PUBLIC]?</h3>",
"predictedHarms"=>"<h2>5.6. Nuisances prÃ©vues </h2>",
"procedures"=>"<h3>5.6.1. Ã€ quels types dâ€™interventions les animaux seront-ils soumis (par exemple, prÃ©lÃ¨vements sur animaux vigiles, procÃ©dures
chirurgicales) ? Indiquer leur nombre et leur durÃ©e. </h3>",
"expectedImpacts"=>"<h3>5.6.2. Quels sont les effets / ou effets indÃ©sirables prÃ©vus sur les animaux ? </h3>",
"expectedHarms"=>"<h2>5.7. Quelles espÃ¨ces est-il prÃ©vu dâ€™utiliser? Quels sont le degrÃ© de gravitÃ© des procÃ©dures et le nombre dâ€™animaux prÃ©vus dans chaque catÃ©gorie de gravitÃ© (par espÃ¨ce) ? </h2>",
"species"=>"<br>- EspÃ¨ce : ",
"nonRecovery"=>"<br>     Sans rÃ©veil : ",
"mild"=>"<br>     LÃ©gÃ¨re : ",
"moderate"=>"<br>     ModÃ©rÃ©e : ",
"severe"=>"<br>     SÃ©vÃ¨re : ",
"fateOfAnimalsKeptAlive"=>"<h2>5.8. Quâ€™adviendra-t-il des animaux maintenus en vie Ã  la fin du projet ?</h2>",
"reused"=>"<br>     RÃ©utilisÃ©s : ",
"returned"=>"<br>     ReplacÃ©s : ",
"rehomed"=>"<br>     AdoptÃ©s : ",
"fateReasons"=>"<h2>5.9. Justifier le sort prÃ©vu de tous les animaux Ã  l'issue de chaque procÃ©dure </h2>",
"applicationOfTheThreeRs"=>"<h2>5.10. Application de la rÃ¨gle des Â«trois RÂ» </h2>",
"replacement"=>"<h3>1. Remplacement. [Repris automatiquement du champ 3.3.6.1]</h3> ",
"reduction"=>"<h3>2. RÃ©duction. [Repris automatiquement du champ 3.3.6.2] </h3>",
"refinement"=>"<h3>3. Raffinement. [Repris automatiquement du champ 3.3.6.3] </h3>",
"speciesChoiceExplanation"=>"<h2>5.11. Expliquer le choix des espÃ¨ces et les stades de dÃ©veloppement y affÃ©rents. [Repris automatiquement des champs 3.4.3 et 3.4.11,
dans la limite des 2500 premiers caractÃ¨res]</h2>");

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
