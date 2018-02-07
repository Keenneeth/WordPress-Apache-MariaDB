echo "Contenidor datacontainer"
docker create --name datacontainer -v /wordpress_data/:/var/www/html/wp-admin -v /mysql_data/:/var/lib/mysql centos

echo "Crear Xarxa de Comunicació de Apache i MySQL"
docker network create wordsql

echo "Contenidor Apache+PHP"
docker run -itd -p 80:80 --volumes-from datacontainer --name apache --network wordsql keenneeth/wordpress-apache

echo "Contenidor MYSQL"
docker run -itd -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE1=wordb -e MYSQL_USER1=keenneeth -e MYSQL_PASSWORD1=keenneeeth --volumes-from datacontainer --network wordsql --name db orboan/dcsss-mariadb
