service mariadb start

mariadb -e "CREATE DATABASE ${DB_NAME};"
mariadb -e "CREATE USER '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';"
mariadb -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%';"
mariadb -e "FLUSH PRIVILEGES;"
#mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '1234';"
mariadb-admin -u root password "1234"