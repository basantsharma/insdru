
Prerequisites - Drush

copy insdru folder to root(www) folder of your server.
Go to insdru folder and make insdru.sh executable (chmod 755 insdru.sh)
open terminal and go to insdru folder which is residing in root folder (cd /var/www/insdru) and type following command
  ./insdru.sh [site-name] [db-user] [db-pass] [default] [optional modules to enable]

  [site-name] - compulsory - site name, database name
  [db-user] - compulsory - database username
  [db-pass] - compulsory - database password
  [default] - optional - if given ctools views pathauto zen token devel will be enabled by default
  [optional modules to enable] - list of modules you want to enable

  eg
  ./insdru.sh firstsite root password default date admin_menu
  ./insdru.sh firstsite root password date admin_menu
  ./insdru.sh firstsite root password default
  ./insdru.sh firstsite root password


  NOTE : Prompt for confirmition are automatically answered yes, so that you don't need to watch the terminal while it is installed, and even no need to create database for it, it will be created by this script

  CAUTION : Never use a [site-name] same as an already existing database name otherwise it will be overwritten.
