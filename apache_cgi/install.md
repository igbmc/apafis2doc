How to install on a fresh Debian OS with apache2 installed:

1) Add cgi support to apache2

edit /etc/apache2/apache2.conf

add :
``` 
AddHandler cgi-script .cgi .pl .py
Options +ExecCGI
<Directory /var/www/html/cgi-files>
   Options +ExecCGI
   SetHandler cgi-script
</Directory>

<Directory /var/www/html/upload>
        Options FollowSymLinks
        AllowOverride None
        Require all granted
</Directory>
```

```
sudo a2enmod cgi
sudo apt install libcgi-pm-perl
sudo systemctl restart apache2
```

2) Add building tools
```
sudo apt-get install build-essential
sudo cpan install MsOffice::Word::HTML::Writer
```

3) Set-up the server
```
cp index.html /var/www/html
cp *.cgi in /var/www/html/cgi-files
chmod +x /var/www/html/cgi-files/*.cgi
mkdir /var/www/html/upload
chmod 755 /var/www/html/upload/
sudo crontab -e
```
add :  
```
* * * * * rm /var/www/html/upload/*.*
```