# apafis2doc
 Convertisseur xml (formatté par APAFIS) en doc

Ce dépôt vise à fournir une solution aux personnes travaillant avec l'application APAFIS, pour partager leurs documents avec d'autres utilisateurs.
Il peut aussi fournir aux rapporteurs des Comités d'Ethique une solution convenable pour utiliser le suivi de modifications et les commentaires, permettant de faciliter leur travail.

L'exécutable et les script perl fournis dans ce dépôt convertissent les documents xml sauvegardés par l'application APAFIS dans un document word au format UTF-8.
Deux versions pl existent : 
- saisine-2.00-unformatted : produit un fichier sans balises, mais ne nécessite que l'installation du module RTF::Writer (cpan install RTF::Writer)
- saisine-2.00  : produit un fichier contenant des balises html, mais requiert la compilation du module MsOffice::Word::HTML::Writer

Le répertoire apache_cgi permet le déploiement d'une solution sur un serveur apache. Merci de vous référer à la documentation install.md dans ce répertoire.

### Mode d'emploi :

* Placer la saisine générée par APAFIS dans le répertoire contenant l'exécutable ou le script perl.
* Lancer le logiciel Convert-Apafis_to_doc-2.0.exe **[Télécharger](https://github.com/igbmc/apafis2doc/blob/master/Convert-Apafis_to_doc-2.0.exe?raw=true)** ou executer perl saisine-2.00.pl
* Taper 1 pour accepter puis valider
(Attention, tous les fichiers Apafis au format xml présents dans le répertoire sont traités et les document doc correspondant seront écrasés si déjà présents)

Pour tous commentaires ou corrections, n'hésitez pas à me contacter.

Ce script est mis à votre disposition, sans garantie de parfait fonctionnement.

Merci de conserver la source de ce travail : Institut Clinique de la Souris - IGBMC
