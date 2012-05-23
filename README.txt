copy insdru.sh to root(www) folder of your server.
make it executable
open terminal and go to root folder and type following command
  ./insdru.sh [site-name] [db-user] [db-pass] [default] [optional modules to enable]

  [site-name] - compulsory - site name, database name
  [db-user] - compulsory - database username
  [db-pass] - compulsory - database password
  [default] - optional - if given ctools views pathauto zen token devel will be enabled by default
  [optional modules to enable] - list of modules you want to enabled

  eg
  ./insdru.sh firstsite root password default date admin_menu
  ./insdru.sh firstsite root password date admin_menu
  ./insdru.sh firstsite root password default
  ./insdru.sh firstsite root password
