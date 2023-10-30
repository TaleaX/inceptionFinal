service mariadb start

#mariadb -e "CREATE DATABASE ${DB_NAME};"
#mariadb -e "CREATE USER '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';"
#mariadb -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%';"
#mariadb -e "FLUSH PRIVILEGES;"
#mariadb-admin -u root password "${DB_ROOT_PASSWORD}"

mariadb -e "CREATE DATABASE wordpress;"
mariadb -e "CREATE USER 'tdehne'@'%' IDENTIFIED BY '1234';"
mariadb -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'tdehne'@'%';"
mariadb -e "FLUSH PRIVILEGES;"
mariadb-admin -u root password "1234"
