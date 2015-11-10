# apafis2doc
 Convertisseur xml (formatté par APAFIS) en doc

Ce dépôt vise à fournir une solution aux personnes travaillant avec l'application APAFIS, pour partager leurs documents avec d'autres utilisateurs.
Il peut aussi fournir aux rapporteurs des Comités d'Ethique une solution convenable pour utiliser le suivi de modifications et les commentaires, permettant de faciliter leur travail.

L'exécutable et le script perl fournis dans ce dépôt convertissent les documents xml sauvegardés par l'application APAFIS dans un document word au format UTF-8.
Une macro .bas permet ensuite un formattage plus lisible permettant une sauvegarde au format Word.

### Mode d'emploi :

Placer la saisine générée par APAFIS dans le répertoire contenant l'exécutable ou le script perl.
Lancer le logiciel Convert-Apafis_to_doc.exe ou executer perl saisine.pl
Taper 1 pour accepter puis valider
(Attention, tous les fichiers Apafis présents dans le répertoire sont traités et écrasés si déjà présents)

Pour un usage avancé, une macro Word est disponible afin de formatter le fichier produit.

* 1) Ouvrez le document .doc généré, acceptez l'encodage UTF-8
* 2) Pressez les deux touches Alt et F11 simultanément pour ouvrir le panneau Visual Basic
* 3) Dans le menu Fichier, importez le document Apafis.bas téléchargé depuis ce dépôt
* 4) Pressez la touche F5 puis executez la macro Formattage
* 5) Sauvegardez le document, en précisant le format Word

Pour tous commentaires ou corrections, n'hésitez pas à me contacter.

Ce script est mis à votre disposition, sans garantie de parfait fonctionnement.

Merci de conserver la source de ce travail : Institut Clinique de la Souris - IGBMC
