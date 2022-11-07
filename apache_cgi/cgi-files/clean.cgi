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
<p>Seuls les fichiers .xml apafis sont autoris&eacutes;s !</p>
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
my $cut_name = $filename;
$cut_name =~ s/.xml//;
my $fichier = $cut_name."-edited.xml";

foreach(@files){
my $qfn = $_;

open IN,$qfn or die $!;
$qfn =~ s/.xml//;
open OUT,">",$qfn."-edited.xml" or die $!;

while (<IN>) {
my $line = $_;

if ($line =~ /LectureSeule="true"/){
$line =~ s/LectureSeule=\"true\" //;
print OUT $line;
}
print OUT $line unless /<NumVersion>|<ReferenceDossier>|LectureSeule="true"/;

}
close IN or die $!;
close OUT or die $!;
}


print $query->header ( );
print <<END_HTML;
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "DTD/xhtml1-strict.dtd">
<html xmlns="https://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>C'est fait !</title>
<style type="text/css">
img {border: none;}
</style>
</head>
<body>
<p>Merci pour l'envoi de votre fichier </p>
<p>T&eacute;l&eacute;charger le fichier en suivant ce lien : <a href="/upload/$fichier" download> Fichier apafis nettoy&eacute; </a></p>
<p>Les fichiers sont effac&eacute;s chaque minute automatiquement</p>
</body>
</html>
END_HTML
