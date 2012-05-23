#!/bin/bash

MyUSER=$2
MyPASS=$3
HostName="localhost"
dbName=$1
charSet="utf8"
collate="utf8_general_ci"
default="ctools views token pathauto devel zen"

#mysql -u $MyUSER -h $HostName -p$MyPASS -Bse "CREATE DATABASE $dbName CHARACTER SET $charSet COLLATE $collate;"

echo "start drupal download"

drush dl drupal --drupal-project-rename=$dbName

echo "download completed"
echo "installing drupal"

cd $dbName
cp sites/default/default.settings.php sites/default/settings.php
chmod 666 sites/default/settings.php
chmod a+w sites/default

drush site-install standard --db-url=mysql://$MyUSER:$MyPASS@localhost/$dbName --site-name=$dbName

chmod 755 sites/default
chmod 644 sites/default/settings.php

if [ $4 = "default" ]; then
    drush dl $default
    yes | drush en ctools views views_ui token pathauto devel
    for ((  i = 0 ;  i < 4;  i++  ))
      do
        shift
      done
else
    for ((  i = 0 ;  i < 3;  i++  ))
      do
        shift
      done
fi

for mod in $@
      do
         sub_mod=$(drush dl $mod --pipe)
          for m in $sub_mod
                do
                   yes | drush en $m
                done
      done


var="."
chown -R $(whoami):www-data $var
find $var -type d -exec chmod u=rwx,g=rx,o= {} \;
find $var -type f -exec chmod u=rw,g=r,o= {} \;
find $var/sites/default/ -type d -name files -exec chmod ug=rwx,o= '{}' \;
for d in $var/sites/default/files
do
   find $d -type d -exec chmod ug=rwx,o= {} \;
   find $d -type f -exec chmod ug=rw,o= {} \;
done
