# WordPress-Apache-MariaDB
Crear una xarxa per tal que es puguin connectar el WordPress i MariaDB
Imatge de Apache amb Php instal·lat amb la inserció de un script per instal·lar el Wordpress configurat amb les dades del contenidor de la Base de dades.
- Contenidor de Base de dades : 
  -i contenidor interactiu
  -t amb una terminal
  -d contenidor en segon pla
  -p indicar el port de fora i dins del contenidor
  --network wordsql indica la xarxa 
  -e varibles d’entorn 
	- MYSQL_ROOT_PASSWORD contrasenya de administrador de mariadb
  - MYSQL_DATABASE1, MYSQL_USER1, MYSQL_PASSWORD1 Crear usuari, contrasenya i una base de dades
  --volumes-from datacontainer carrega els volums del contenidor datacontainer per guardar les dades de la base de dades a /mysql_data

- Contenidor Datacontainer 
  Contenidor per guardar les dades de la web de wordpress = /var/ww/html/wp-admin
	De la Mariadb /var/lib/mysql en /wordpress_data i mysql_data
  
- Contenidor Apache-WordPress
  Crear una imatge amb Dockerfile insertant un script per instal·lar WordPress a la imatge de httpd i php.
  Llavors crear el contenidor de apache i php :
  -i contenidor interactiu
  -t amb una terminal
  -d contenidor en segon pla
  -p indicar el port de fora i dins del contenidor apache 80:80
  --network wordsql indica la xarxa 
  -v /swordpress/:/script  volum per obtenir el script de la màquina al contenidor
  Indicar la imatge keenneeth/WordPress-Apache

