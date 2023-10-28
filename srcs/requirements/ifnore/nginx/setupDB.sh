service mariadb start

mysql -e "CREATE DATABASE wordpress;"
mysql -e "CREATE USER 'tdehne'@'%' IDENTIFIED BY '1234';"
mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'tdehne'@'%';"
mysql -e "FLUSH PRIVILEGES;"
#mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '1234';"

mysqladmin -u root password "1234"